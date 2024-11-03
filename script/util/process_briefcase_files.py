import os
import re
import sys


def parse_flattened_file(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()

    main_pragma_version = None

    for line in lines:
        # First specified Solidity Version is used for all blocks by default
        if line.startswith("pragma solidity"):
            if not main_pragma_version:
                main_pragma_version = line.strip()
                break

    code_blocks = []
    current_block = {'source': None, 'content': '', 'pragma': main_pragma_version}

    for line in lines:
        # Some files are not flattened correctly and still have (unnecessary) import statements, ignore those
        if line.startswith("import {") or line.startswith("import \"") or line.startswith("import '"):
            continue

        # License is taken from source file, so can be ignored
        if line.startswith("// SPDX-License-Identifier:"):
            continue


        # Block has a specified solidity version
        if line.startswith("pragma solidity"):
            current_block["pragma"] = line.strip()
            continue

        # Additional pragma lines are also taken from source file, so can be ignored
        if line.startswith("pragma"):
            continue

        if line.startswith("// src/") or line.startswith("// lib/"):
            if current_block["source"]:
                code_blocks.append(current_block)
                current_block = {
                    'source': line.strip(), 'content': '', 'pragma': main_pragma_version}
            else:
                current_block['source'] = line.strip()

            continue

        current_block['content'] += line

    code_blocks.append(current_block)

    return code_blocks


def get_additional_pragma_and_license_from_source_file(source_file):
    additional_pragma_pattern = re.compile(r"^\s*pragma\s+(?!solidity)[^;]+;")
    license_pattern = re.compile(r"^\s*//\s*SPDX-License-Identifier:\s*([^\s]+)")

    additional_pragma_lines = []
    license = None

    with open(source_file, 'r') as file:
        for line in file:
            if license_pattern.match(line):
                license = line.strip()
            if additional_pragma_pattern.match(line):
                additional_pragma_lines.append(line.strip())

    return additional_pragma_lines, license


def get_imported_elements_from_source_file(source_file):
    # Regular expression to match import statements with curly braces
    import_with_braces_regex = r"import\s*{([^}]+)}\s*from\s*['\"]([^'\"]+)['\"]\s*;"

    # Regular expression to match import statements without curly braces
    import_without_braces_regex = r"import\s*['\"]([^'\"]+\.sol)['\"]\s*;"

    imported_elements = []

    with open(source_file, 'r') as file:
        sol_content = file.read()

        matches_with_braces = re.findall(import_with_braces_regex, sol_content)

        for match in matches_with_braces:
            elements = match[0].split(',')
            elements = [element.strip() for element in elements]
            imported_elements.extend(elements)

        matches_without_braces = re.findall(
            import_without_braces_regex, sol_content)

        for match in matches_without_braces:
            filename = os.path.basename(match)
            class_name = filename.replace('.sol', '')
            class_name = class_name[0].upper() + class_name[1:]
            imported_elements.append(class_name)

    return imported_elements


def parse_content_for_classes_and_functions(content):
    classes = []
    functions = []
    # Define regex patterns for contracts, structs, interfaces, and libraries
    class_pattern = r'\b(?:interface|contract|type|library|struct)\s+(\w+)\b'
    function_pattern = r'\b(?:function)\s+(\w+)\b'

    # Initialize scope level
    scope_level = 0
    in_multiline_comment = False

    for line in content.splitlines():
        # Handle multi-line comments
        if in_multiline_comment:
            if '*/' in line:
                in_multiline_comment = False
            continue

        if '/*' in line:
            in_multiline_comment = True
            if '*/' in line:
                in_multiline_comment = False
            continue

        # Handle single-line comments
        if line.strip().startswith("//"):
            continue

        # Only handle top-level definitions
        if scope_level == 0 and line:
            class_match = re.search(class_pattern, line)
            function_match = re.search(function_pattern, line)
            if class_match:
                classes.append(class_match.group(1))
            if function_match:
                functions.append(function_match.group(1))

        for char in line:
            if char == '{':
                scope_level += 1
            elif char == '}':
                scope_level -= 1

    return classes, functions


def get_relative_path(src_path, dest_path):
    relative_path = os.path.relpath(src_path, os.path.dirname(dest_path))
    if not relative_path.startswith('.'):
        relative_path = os.path.join(".", relative_path)
    return relative_path


def write_file(path, license, pragma, classes, functions, imports, block):
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, 'w') as file:
        if license:
            file.write(license + "\n")
        file.write(pragma + "\n\n")

        for dest_path in classes:
            if dest_path != path:
                class_names = classes[dest_path]
                function_names = functions[dest_path]
                used_elements = [
                    cls for cls in class_names if cls in block] + [func for func in function_names if func in imports]

                if used_elements:
                    relative_path = get_relative_path(dest_path, path)
                    import_statement = create_import_statement(
                        used_elements, relative_path)
                    file.write(import_statement)

        file.write("\n" + block.strip())


def create_import_statement(element_names, relative_path):
    return f'import {{{", ".join(element_names)}}} from "{relative_path}";\n'


def process_file(flattened_file, root_directory):
    code_blocks = parse_flattened_file(flattened_file)
    pragma = {}
    license = {}
    classes = {}
    functions = {}
    imports = {}
    blocks = {}

    for block in code_blocks:
        if block['source']:
            source_file = block['source'].replace("// ", "")
        else:
            break

        interface_match = re.match(
            r'src/pkgs/(.*)/(src|contracts)/(interface|interfaces)/(.*)', source_file)
        lib_types_match = re.match(
            r'src/pkgs/(.*)/(src|contracts)/(libraries|types)/(.*)', source_file)
        external_lib_match = re.match(r'(.*?)lib/(.*)', source_file)
        other_match = re.match(
            r'src/pkgs/(.*)/(src|contracts)/(.*)', source_file)
        
        if interface_match:
            package_name = interface_match.group(1)
            subdir = "interfaces"
            rest_of_path = interface_match.group(4)
        elif lib_types_match:
            package_name = lib_types_match.group(1)
            subdir = lib_types_match.group(3)
            rest_of_path = lib_types_match.group(4)
        elif external_lib_match:
            package_name = ''
            subdir = "lib-external"
            rest_of_path = external_lib_match.group(2)
        elif other_match:
            package_name = other_match.group(1)
            subdir = ''
            rest_of_path = other_match.group(3)
        else:
            continue

        content = block['content']

        dest_path = os.path.join(
            root_directory, package_name, subdir, rest_of_path)

        class_names, function_names = parse_content_for_classes_and_functions(
            content)
        imported_classes = get_imported_elements_from_source_file(source_file)
        additional_pragma_from_source, license_from_source = get_additional_pragma_and_license_from_source_file(source_file)

        classes[dest_path] = class_names
        functions[dest_path] = function_names
        imports[dest_path] = imported_classes
        license[dest_path] = license_from_source
        pragma[dest_path] = block['pragma'] + '\n' + '\n'.join(additional_pragma_from_source)
        # if the current file isn't the recognized source file, it will be/has been processed separately (guaranteed)
        if interface_match and dest_path != flattened_file:
            continue

        blocks[dest_path] = content

    for dest_path, block in blocks.items():
        write_file(dest_path, license[dest_path], pragma[dest_path], classes,
                functions, imports[dest_path], block)



def process_all_files_in_directory(directory):
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith('.sol'):
                filepath = os.path.join(root, file)
                process_file(filepath, directory)


if __name__ == "__main__":
    directory = sys.argv[1]
    if not directory.endswith('/'):
        directory += '/'

    process_all_files_in_directory(directory)
