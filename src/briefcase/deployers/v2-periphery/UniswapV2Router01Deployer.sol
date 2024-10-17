// SPDX-License-Identifier: MIT
pragma solidity >= 0.5.0;

import {IUniswapV2Router01} from '../../protocols/v2-periphery/interfaces/IUniswapV2Router01.sol';

library UniswapV2Router02Deployer {
    function deploy(address factory, address weth) internal returns (IUniswapV2Router01 router01) {
        bytes memory args = abi.encode(factory, weth);
        bytes memory initcode_ = abi.encodePacked(initcode(), args);
        assembly {
            router01 := create(0, add(initcode_, 32), mload(initcode_))
        }
    }

    /// @dev autogenerated - run `` to generate current initcode
    function initcode() internal pure returns (bytes memory) {
        return
        hex'60c060405234801561001057600080fd5b506040516140fe3803806140fe8339818101604052604081101561003357600080fd5b5080516020909101516001600160601b0319606092831b8116608052911b1660a05260805160601c60a05160601c613fc261013c600039806101655280610b235280610b5e5280610c9b5280610f5e52806113b852806115e65280611799528061182e5280611afd5280611eb352806121e9528061223f528061227352806122f4528061250e52806126be5280612753525080610d8d5280610e8b5280611031528061106a528061121552806114aa52806116cc528061186d5280611a335280611ba65280611e385280611e615280611e91528061206e528061221d52806125f452806127925280613211528061325452806137e752806138c852806139485250613fc26000f3fe6080604052600436106101485760003560e01c80638803dbee116100c0578063d06ca61f11610074578063e8e3370011610059578063e8e3370014610937578063f305d719146109c4578063fb3bdb4114610a175761018e565b8063d06ca61f14610800578063ded9382a146108b75761018e565b8063ad615dec116100a5578063ad615dec1461074b578063baa2abde14610781578063c45a0155146107eb5761018e565b80638803dbee14610668578063ad5c46481461070d5761018e565b80632195995c116101175780634a25d94a116100fc5780634a25d94a146105305780637ff36ab5146105d557806385f8c2591461020c5761018e565b80632195995c1461040057806338ed17391461048b5761018e565b806302751cec14610193578063054d50d41461020c57806318cbafe5146102545780631f00ca74146103495761018e565b3661018e573373ffffffffffffffffffffffffffffffffffffffff7f0000000000000000000000000000000000000000000000000000000000000000161461018c57fe5b005b600080fd5b34801561019f57600080fd5b506101f3600480360360c08110156101b657600080fd5b5073ffffffffffffffffffffffffffffffffffffffff81358116916020810135916040820135916060810135916080820135169060a00135610aaa565b6040805192835260208301919091528051918290030190f35b34801561021857600080fd5b506102426004803603606081101561022f57600080fd5b5080359060208101359060400135610bfd565b60408051918252519081900360200190f35b34801561026057600080fd5b506102f9600480360360a081101561027757600080fd5b81359160208101359181019060608101604082013564010000000081111561029e57600080fd5b8201836020820111156102b057600080fd5b803590602001918460208302840111640100000000831117156102d257600080fd5b919350915073ffffffffffffffffffffffffffffffffffffffff8135169060200135610c12565b60408051602080825283518183015283519192839290830191858101910280838360005b8381101561033557818101518382015260200161031d565b505050509050019250505060405180910390f35b34801561035557600080fd5b506102f96004803603604081101561036c57600080fd5b8135919081019060408101602082013564010000000081111561038e57600080fd5b8201836020820111156103a057600080fd5b803590602001918460208302840111640100000000831117156103c257600080fd5b91908080602002602001604051908101604052809392919081815260200183836020028082843760009201919091525092955061102a945050505050565b34801561040c57600080fd5b506101f3600480360361016081101561042457600080fd5b5073ffffffffffffffffffffffffffffffffffffffff8135811691602081013582169160408201359160608101359160808201359160a08101359091169060c08101359060e081013515159060ff6101008201351690610120810135906101400135611060565b34801561049757600080fd5b506102f9600480360360a08110156104ae57600080fd5b8135916020810135918101906060810160408201356401000000008111156104d557600080fd5b8201836020820111156104e757600080fd5b8035906020019184602083028401116401000000008311171561050957600080fd5b919350915073ffffffffffffffffffffffffffffffffffffffff813516906020013561119e565b34801561053c57600080fd5b506102f9600480360360a081101561055357600080fd5b81359160208101359181019060608101604082013564010000000081111561057a57600080fd5b82018360208201111561058c57600080fd5b803590602001918460208302840111640100000000831117156105ae57600080fd5b919350915073ffffffffffffffffffffffffffffffffffffffff813516906020013561132f565b6102f9600480360360808110156105eb57600080fd5b8135919081019060408101602082013564010000000081111561060d57600080fd5b82018360208201111561061f57600080fd5b8035906020019184602083028401116401000000008311171561064157600080fd5b919350915073ffffffffffffffffffffffffffffffffffffffff8135169060200135611572565b34801561067457600080fd5b506102f9600480360360a081101561068b57600080fd5b8135916020810135918101906060810160408201356401000000008111156106b257600080fd5b8201836020820111156106c457600080fd5b803590602001918460208302840111640100000000831117156106e657600080fd5b919350915073ffffffffffffffffffffffffffffffffffffffff81351690602001356119bc565b34801561071957600080fd5b50610722611afb565b6040805173ffffffffffffffffffffffffffffffffffffffff9092168252519081900360200190f35b34801561075757600080fd5b506102426004803603606081101561076e57600080fd5b5080359060208101359060400135611b1f565b34801561078d57600080fd5b506101f3600480360360e08110156107a457600080fd5b5073ffffffffffffffffffffffffffffffffffffffff8135811691602081013582169160408201359160608101359160808201359160a08101359091169060c00135611b2c565b3480156107f757600080fd5b50610722611e36565b34801561080c57600080fd5b506102f96004803603604081101561082357600080fd5b8135919081019060408101602082013564010000000081111561084557600080fd5b82018360208201111561085757600080fd5b8035906020019184602083028401116401000000008311171561087957600080fd5b919080806020026020016040519081016040528093929190818152602001838360200280828437600092019190915250929550611e5a945050505050565b3480156108c357600080fd5b506101f360048036036101408110156108db57600080fd5b5073ffffffffffffffffffffffffffffffffffffffff81358116916020810135916040820135916060810135916080820135169060a08101359060c081013515159060ff60e08201351690610100810135906101200135611e87565b34801561094357600080fd5b506109a6600480360361010081101561095b57600080fd5b5073ffffffffffffffffffffffffffffffffffffffff8135811691602081013582169160408201359160608101359160808201359160a08101359160c0820135169060e00135611fdf565b60408051938452602084019290925282820152519081900360600190f35b6109a6600480360360c08110156109da57600080fd5b5073ffffffffffffffffffffffffffffffffffffffff81358116916020810135916040820135916060810135916080820135169060a0013561216e565b6102f960048036036080811015610a2d57600080fd5b81359190810190604081016020820135640100000000811115610a4f57600080fd5b820183602082011115610a6157600080fd5b80359060200191846020830284011164010000000083111715610a8357600080fd5b919350915073ffffffffffffffffffffffffffffffffffffffff813516906020013561249a565b6000808242811015610b1d57604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601860248201527f556e69737761705632526f757465723a20455850495245440000000000000000604482015290519081900360640190fd5b610b4c897f00000000000000000000000000000000000000000000000000000000000000008a8a8a308a611b2c565b9093509150610b5c8986856128e9565b7f000000000000000000000000000000000000000000000000000000000000000073ffffffffffffffffffffffffffffffffffffffff16632e1a7d4d836040518263ffffffff1660e01b815260040180828152602001915050600060405180830381600087803b158015610bcf57600080fd5b505af1158015610be3573d6000803e3d6000fd5b50505050610bf18583612ac6565b50965096945050505050565b6000610c0a848484612c03565b949350505050565b60608142811015610c8457604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601860248201527f556e69737761705632526f757465723a20455850495245440000000000000000604482015290519081900360640190fd5b73ffffffffffffffffffffffffffffffffffffffff7f00000000000000000000000000000000000000000000000000000000000000001686867fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8101818110610ce957fe5b9050602002013573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1614610d8857604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601d60248201527f556e69737761705632526f757465723a20494e56414c49445f50415448000000604482015290519081900360640190fd5b610de67f000000000000000000000000000000000000000000000000000000000000000089888880806020026020016040519081016040528093929190818152602001838360200280828437600092019190915250612d2792505050565b91508682600184510381518110610df957fe5b60200260200101511015610e58576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252602b815260200180613f3c602b913960400191505060405180910390fd5b610f1d86866000818110610e6857fe5b9050602002013573ffffffffffffffffffffffffffffffffffffffff1633610f037f00000000000000000000000000000000000000000000000000000000000000008a8a6000818110610eb757fe5b9050602002013573ffffffffffffffffffffffffffffffffffffffff168b8b6001818110610ee157fe5b9050602002013573ffffffffffffffffffffffffffffffffffffffff16612e8d565b85600081518110610f1057fe5b6020026020010151612f78565b610f5c82878780806020026020016040519081016040528093929190818152602001838360200280828437600092019190915250309250613148915050565b7f000000000000000000000000000000000000000000000000000000000000000073ffffffffffffffffffffffffffffffffffffffff16632e1a7d4d83600185510381518110610fa857fe5b60200260200101516040518263ffffffff1660e01b815260040180828152602001915050600060405180830381600087803b158015610fe657600080fd5b505af1158015610ffa573d6000803e3d6000fd5b5050505061101f848360018551038151811061101257fe5b6020026020010151612ac6565b509695505050505050565b60606110577f000000000000000000000000000000000000000000000000000000000000000084846133cf565b90505b92915050565b60008060006110907f00000000000000000000000000000000000000000000000000000000000000008f8f612e8d565b905060008761109f578c6110c1565b7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff5b604080517fd505accf00000000000000000000000000000000000000000000000000000000815233600482015230602482015260448101839052606481018c905260ff8a16608482015260a4810189905260c48101889052905191925073ffffffffffffffffffffffffffffffffffffffff84169163d505accf9160e48082019260009290919082900301818387803b15801561115d57600080fd5b505af1158015611171573d6000803e3d6000fd5b505050506111848f8f8f8f8f8f8f611b2c565b809450819550505050509b509b9950505050505050505050565b6060814281101561121057604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601860248201527f556e69737761705632526f757465723a20455850495245440000000000000000604482015290519081900360640190fd5b61126e7f000000000000000000000000000000000000000000000000000000000000000089888880806020026020016040519081016040528093929190818152602001838360200280828437600092019190915250612d2792505050565b9150868260018451038151811061128157fe5b602002602001015110156112e0576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252602b815260200180613f3c602b913960400191505060405180910390fd5b6112f086866000818110610e6857fe5b61101f82878780806020026020016040519081016040528093929190818152602001838360200280828437600092019190915250899250613148915050565b606081428110156113a157604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601860248201527f556e69737761705632526f757465723a20455850495245440000000000000000604482015290519081900360640190fd5b73ffffffffffffffffffffffffffffffffffffffff7f00000000000000000000000000000000000000000000000000000000000000001686867fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff810181811061140657fe5b9050602002013573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16146114a557604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601d60248201527f556e69737761705632526f757465723a20494e56414c49445f50415448000000604482015290519081900360640190fd5b6115037f0000000000000000000000000000000000000000000000000000000000000000898888808060200260200160405190810160405280939291908181526020018383602002808284376000920191909152506133cf92505050565b9150868260008151811061151357fe5b60200260200101511115610e58576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401808060200182810382526027815260200180613ecc6027913960400191505060405180910390fd5b606081428110156115e457604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601860248201527f556e69737761705632526f757465723a20455850495245440000000000000000604482015290519081900360640190fd5b7f000000000000000000000000000000000000000000000000000000000000000073ffffffffffffffffffffffffffffffffffffffff168686600081811061162857fe5b9050602002013573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16146116c757604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601d60248201527f556e69737761705632526f757465723a20494e56414c49445f50415448000000604482015290519081900360640190fd5b6117257f000000000000000000000000000000000000000000000000000000000000000034888880806020026020016040519081016040528093929190818152602001838360200280828437600092019190915250612d2792505050565b9150868260018451038151811061173857fe5b60200260200101511015611797576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252602b815260200180613f3c602b913960400191505060405180910390fd5b7f000000000000000000000000000000000000000000000000000000000000000073ffffffffffffffffffffffffffffffffffffffff1663d0e30db0836000815181106117e057fe5b60200260200101516040518263ffffffff1660e01b81526004016000604051808303818588803b15801561181357600080fd5b505af1158015611827573d6000803e3d6000fd5b50505050507f000000000000000000000000000000000000000000000000000000000000000073ffffffffffffffffffffffffffffffffffffffff1663a9059cbb6118c37f00000000000000000000000000000000000000000000000000000000000000008989600081811061189957fe5b9050602002013573ffffffffffffffffffffffffffffffffffffffff168a8a6001818110610ee157fe5b846000815181106118d057fe5b60200260200101516040518363ffffffff1660e01b8152600401808373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200182815260200192505050602060405180830381600087803b15801561194157600080fd5b505af1158015611955573d6000803e3d6000fd5b505050506040513d602081101561196b57600080fd5b505161197357fe5b6119b282878780806020026020016040519081016040528093929190818152602001838360200280828437600092019190915250899250613148915050565b5095945050505050565b60608142811015611a2e57604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601860248201527f556e69737761705632526f757465723a20455850495245440000000000000000604482015290519081900360640190fd5b611a8c7f0000000000000000000000000000000000000000000000000000000000000000898888808060200260200160405190810160405280939291908181526020018383602002808284376000920191909152506133cf92505050565b91508682600081518110611a9c57fe5b602002602001015111156112e0576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401808060200182810382526027815260200180613ecc6027913960400191505060405180910390fd5b7f000000000000000000000000000000000000000000000000000000000000000081565b6000610c0a84848461355d565b6000808242811015611b9f57604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601860248201527f556e69737761705632526f757465723a20455850495245440000000000000000604482015290519081900360640190fd5b6000611bcc7f00000000000000000000000000000000000000000000000000000000000000008c8c612e8d565b604080517f23b872dd00000000000000000000000000000000000000000000000000000000815233600482015273ffffffffffffffffffffffffffffffffffffffff831660248201819052604482018d9052915192935090916323b872dd916064808201926020929091908290030181600087803b158015611c4d57600080fd5b505af1158015611c61573d6000803e3d6000fd5b505050506040513d6020811015611c7757600080fd5b5050604080517f89afcb4400000000000000000000000000000000000000000000000000000000815273ffffffffffffffffffffffffffffffffffffffff888116600483015282516000938493928616926389afcb44926024808301939282900301818787803b158015611cea57600080fd5b505af1158015611cfe573d6000803e3d6000fd5b505050506040513d6040811015611d1457600080fd5b50805160209091015190925090506000611d2e8e8e61363d565b5090508073ffffffffffffffffffffffffffffffffffffffff168e73ffffffffffffffffffffffffffffffffffffffff1614611d6b578183611d6e565b82825b90975095508a871015611dcc576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401808060200182810382526026815260200180613ef36026913960400191505060405180910390fd5b89861015611e25576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401808060200182810382526026815260200180613e596026913960400191505060405180910390fd5b505050505097509795505050505050565b7f000000000000000000000000000000000000000000000000000000000000000081565b60606110577f00000000000000000000000000000000000000000000000000000000000000008484612d27565b6000806000611ed77f00000000000000000000000000000000000000000000000000000000000000008e7f0000000000000000000000000000000000000000000000000000000000000000612e8d565b9050600087611ee6578c611f08565b7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff5b604080517fd505accf00000000000000000000000000000000000000000000000000000000815233600482015230602482015260448101839052606481018c905260ff8a16608482015260a4810189905260c48101889052905191925073ffffffffffffffffffffffffffffffffffffffff84169163d505accf9160e48082019260009290919082900301818387803b158015611fa457600080fd5b505af1158015611fb8573d6000803e3d6000fd5b50505050611fca8e8e8e8e8e8e610aaa565b909f909e509c50505050505050505050505050565b6000806000834281101561205457604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601860248201527f556e69737761705632526f757465723a20455850495245440000000000000000604482015290519081900360640190fd5b6120628c8c8c8c8c8c613790565b909450925060006120947f00000000000000000000000000000000000000000000000000000000000000008e8e612e8d565b90506120a28d338388612f78565b6120ae8c338387612f78565b8073ffffffffffffffffffffffffffffffffffffffff16636a627842886040518263ffffffff1660e01b8152600401808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001915050602060405180830381600087803b15801561212d57600080fd5b505af1158015612141573d6000803e3d6000fd5b505050506040513d602081101561215757600080fd5b5051949d939c50939a509198505050505050505050565b600080600083428110156121e357604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601860248201527f556e69737761705632526f757465723a20455850495245440000000000000000604482015290519081900360640190fd5b6122118a7f00000000000000000000000000000000000000000000000000000000000000008b348c8c613790565b909450925060006122637f00000000000000000000000000000000000000000000000000000000000000008c7f0000000000000000000000000000000000000000000000000000000000000000612e8d565b90506122718b338388612f78565b7f000000000000000000000000000000000000000000000000000000000000000073ffffffffffffffffffffffffffffffffffffffff1663d0e30db0856040518263ffffffff1660e01b81526004016000604051808303818588803b1580156122d957600080fd5b505af11580156122ed573d6000803e3d6000fd5b50505050507f000000000000000000000000000000000000000000000000000000000000000073ffffffffffffffffffffffffffffffffffffffff1663a9059cbb82866040518363ffffffff1660e01b8152600401808373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200182815260200192505050602060405180830381600087803b15801561239957600080fd5b505af11580156123ad573d6000803e3d6000fd5b505050506040513d60208110156123c357600080fd5b50516123cb57fe5b8073ffffffffffffffffffffffffffffffffffffffff16636a627842886040518263ffffffff1660e01b8152600401808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001915050602060405180830381600087803b15801561244a57600080fd5b505af115801561245e573d6000803e3d6000fd5b505050506040513d602081101561247457600080fd5b505192503484101561248c5761248c33853403612ac6565b505096509650969350505050565b6060814281101561250c57604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601860248201527f556e69737761705632526f757465723a20455850495245440000000000000000604482015290519081900360640190fd5b7f000000000000000000000000000000000000000000000000000000000000000073ffffffffffffffffffffffffffffffffffffffff168686600081811061255057fe5b9050602002013573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16146125ef57604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601d60248201527f556e69737761705632526f757465723a20494e56414c49445f50415448000000604482015290519081900360640190fd5b61264d7f0000000000000000000000000000000000000000000000000000000000000000888888808060200260200160405190810160405280939291908181526020018383602002808284376000920191909152506133cf92505050565b9150348260008151811061265d57fe5b602002602001015111156126bc576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401808060200182810382526027815260200180613ecc6027913960400191505060405180910390fd5b7f000000000000000000000000000000000000000000000000000000000000000073ffffffffffffffffffffffffffffffffffffffff1663d0e30db08360008151811061270557fe5b60200260200101516040518263ffffffff1660e01b81526004016000604051808303818588803b15801561273857600080fd5b505af115801561274c573d6000803e3d6000fd5b50505050507f000000000000000000000000000000000000000000000000000000000000000073ffffffffffffffffffffffffffffffffffffffff1663a9059cbb6127be7f00000000000000000000000000000000000000000000000000000000000000008989600081811061189957fe5b846000815181106127cb57fe5b60200260200101516040518363ffffffff1660e01b8152600401808373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200182815260200192505050602060405180830381600087803b15801561283c57600080fd5b505af1158015612850573d6000803e3d6000fd5b505050506040513d602081101561286657600080fd5b505161286e57fe5b6128ad82878780806020026020016040519081016040528093929190818152602001838360200280828437600092019190915250899250613148915050565b816000815181106128ba57fe5b60200260200101513411156119b2576119b233836000815181106128da57fe5b60200260200101513403612ac6565b6040805173ffffffffffffffffffffffffffffffffffffffff8481166024830152604480830185905283518084039091018152606490920183526020820180517bffffffffffffffffffffffffffffffffffffffffffffffffffffffff167fa9059cbb00000000000000000000000000000000000000000000000000000000178152925182516000946060949389169392918291908083835b602083106129bf57805182527fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe09092019160209182019101612982565b6001836020036101000a0380198251168184511680821785525050505050509050019150506000604051808303816000865af19150503d8060008114612a21576040519150601f19603f3d011682016040523d82523d6000602084013e612a26565b606091505b5091509150818015612a54575080511580612a545750808060200190516020811015612a5157600080fd5b50515b612abf57604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601f60248201527f5472616e7366657248656c7065723a205452414e534645525f4641494c454400604482015290519081900360640190fd5b5050505050565b6040805160008082526020820190925273ffffffffffffffffffffffffffffffffffffffff84169083906040518082805190602001908083835b60208310612b3d57805182527fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe09092019160209182019101612b00565b6001836020036101000a03801982511681845116808217855250505050505090500191505060006040518083038185875af1925050503d8060008114612b9f576040519150601f19603f3d011682016040523d82523d6000602084013e612ba4565b606091505b5050905080612bfe576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401808060200182810382526023815260200180613f196023913960400191505060405180910390fd5b505050565b6000808411612c5d576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252602b815260200180613f8b602b913960400191505060405180910390fd5b600083118015612c6d5750600082115b612cc2576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401808060200182810382526028815260200180613e7f6028913960400191505060405180910390fd5b6000612cd6856103e563ffffffff613a9116565b90506000612cea828563ffffffff613a9116565b90506000612d1083612d04886103e863ffffffff613a9116565b9063ffffffff613b1716565b9050808281612d1b57fe5b04979650505050505050565b6060600282511015612d9a57604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601e60248201527f556e697377617056324c6962726172793a20494e56414c49445f504154480000604482015290519081900360640190fd5b815167ffffffffffffffff81118015612db257600080fd5b50604051908082528060200260200182016040528015612ddc578160200160208202803683370190505b5090508281600081518110612ded57fe5b60200260200101818152505060005b6001835103811015612e8557600080612e3f87868581518110612e1b57fe5b6020026020010151878660010181518110612e3257fe5b6020026020010151613b89565b91509150612e61848481518110612e5257fe5b60200260200101518383612c03565b848460010181518110612e7057fe5b60209081029190910101525050600101612dfc565b509392505050565b6000806000612e9c858561363d565b604080517fffffffffffffffffffffffffffffffffffffffff000000000000000000000000606094851b811660208084019190915293851b81166034830152825160288184030181526048830184528051908501207fff0000000000000000000000000000000000000000000000000000000000000060688401529a90941b9093166069840152607d8301989098527f96e8ac4277198ff8b6f785478aa9a39f403cb768dd02cbee326c3e7da348845f609d808401919091528851808403909101815260bd909201909752805196019590952095945050505050565b6040805173ffffffffffffffffffffffffffffffffffffffff85811660248301528481166044830152606480830185905283518084039091018152608490920183526020820180517bffffffffffffffffffffffffffffffffffffffffffffffffffffffff167f23b872dd0000000000000000000000000000000000000000000000000000000017815292518251600094606094938a169392918291908083835b6020831061305657805182527fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe09092019160209182019101613019565b6001836020036101000a0380198251168184511680821785525050505050509050019150506000604051808303816000865af19150503d80600081146130b8576040519150601f19603f3d011682016040523d82523d6000602084013e6130bd565b606091505b50915091508180156130eb5750805115806130eb57508080602001905160208110156130e857600080fd5b50515b613140576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401808060200182810382526024815260200180613f676024913960400191505060405180910390fd5b505050505050565b60005b60018351038110156133c95760008084838151811061316657fe5b602002602001015185846001018151811061317d57fe5b6020026020010151915091506000613195838361363d565b50905060008785600101815181106131a957fe5b602002602001015190506000808373ffffffffffffffffffffffffffffffffffffffff168673ffffffffffffffffffffffffffffffffffffffff16146131f1578260006131f5565b6000835b91509150600060028a5103881061320c578861324d565b61324d7f0000000000000000000000000000000000000000000000000000000000000000878c8b6002018151811061324057fe5b6020026020010151612e8d565b905061327a7f00000000000000000000000000000000000000000000000000000000000000008888612e8d565b73ffffffffffffffffffffffffffffffffffffffff1663022c0d9f84848460006040519080825280601f01601f1916602001820160405280156132c4576020820181803683370190505b506040518563ffffffff1660e01b8152600401808581526020018481526020018373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200180602001828103825283818151815260200191508051906020019080838360005b8381101561334f578181015183820152602001613337565b50505050905090810190601f16801561337c5780820380516001836020036101000a031916815260200191505b5095505050505050600060405180830381600087803b15801561339e57600080fd5b505af11580156133b2573d6000803e3d6000fd5b50506001909901985061314b975050505050505050565b50505050565b606060028251101561344257604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601e60248201527f556e697377617056324c6962726172793a20494e56414c49445f504154480000604482015290519081900360640190fd5b815167ffffffffffffffff8111801561345a57600080fd5b50604051908082528060200260200182016040528015613484578160200160208202803683370190505b509050828160018351038151811061349857fe5b602090810291909101015281517fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff015b8015612e85576000806134f8878660018603815181106134e457fe5b6020026020010151878681518110612e3257fe5b9150915061351a84848151811061350b57fe5b60200260200101518383613c71565b84600185038151811061352957fe5b602090810291909101015250507fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff016134c8565b60008084116135b7576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401808060200182810382526025815260200180613ea76025913960400191505060405180910390fd5b6000831180156135c75750600082115b61361c576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401808060200182810382526028815260200180613e7f6028913960400191505060405180910390fd5b8261362d858463ffffffff613a9116565b8161363457fe5b04949350505050565b6000808273ffffffffffffffffffffffffffffffffffffffff168473ffffffffffffffffffffffffffffffffffffffff1614156136c5576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401808060200182810382526025815260200180613e346025913960400191505060405180910390fd5b8273ffffffffffffffffffffffffffffffffffffffff168473ffffffffffffffffffffffffffffffffffffffff16106136ff578284613702565b83835b909250905073ffffffffffffffffffffffffffffffffffffffff821661378957604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601e60248201527f556e697377617056324c6962726172793a205a45524f5f414444524553530000604482015290519081900360640190fd5b9250929050565b604080517fe6a4390500000000000000000000000000000000000000000000000000000000815273ffffffffffffffffffffffffffffffffffffffff888116600483015287811660248301529151600092839283927f00000000000000000000000000000000000000000000000000000000000000009092169163e6a4390591604480820192602092909190829003018186803b15801561383057600080fd5b505afa158015613844573d6000803e3d6000fd5b505050506040513d602081101561385a57600080fd5b505173ffffffffffffffffffffffffffffffffffffffff16141561394057604080517fc9c6539600000000000000000000000000000000000000000000000000000000815273ffffffffffffffffffffffffffffffffffffffff8a81166004830152898116602483015291517f00000000000000000000000000000000000000000000000000000000000000009092169163c9c65396916044808201926020929091908290030181600087803b15801561391357600080fd5b505af1158015613927573d6000803e3d6000fd5b505050506040513d602081101561393d57600080fd5b50505b60008061396e7f00000000000000000000000000000000000000000000000000000000000000008b8b613b89565b91509150816000148015613980575080155b1561399057879350869250613a84565b600061399d89848461355d565b9050878111613a0a57858110156139ff576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401808060200182810382526026815260200180613e596026913960400191505060405180910390fd5b889450925082613a82565b6000613a1789848661355d565b905089811115613a2357fe5b87811015613a7c576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401808060200182810382526026815260200180613ef36026913960400191505060405180910390fd5b94508793505b505b5050965096945050505050565b6000811580613aac57505080820282828281613aa957fe5b04145b61105a57604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601460248201527f64732d6d6174682d6d756c2d6f766572666c6f77000000000000000000000000604482015290519081900360640190fd5b8082018281101561105a57604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601460248201527f64732d6d6174682d6164642d6f766572666c6f77000000000000000000000000604482015290519081900360640190fd5b6000806000613b98858561363d565b509050600080613ba9888888612e8d565b73ffffffffffffffffffffffffffffffffffffffff16630902f1ac6040518163ffffffff1660e01b815260040160606040518083038186803b158015613bee57600080fd5b505afa158015613c02573d6000803e3d6000fd5b505050506040513d6060811015613c1857600080fd5b5080516020909101516dffffffffffffffffffffffffffff918216935016905073ffffffffffffffffffffffffffffffffffffffff87811690841614613c5f578082613c62565b81815b90999098509650505050505050565b6000808411613ccb576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252602c815260200180613e08602c913960400191505060405180910390fd5b600083118015613cdb5750600082115b613d30576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401808060200182810382526028815260200180613e7f6028913960400191505060405180910390fd5b6000613d546103e8613d48868863ffffffff613a9116565b9063ffffffff613a9116565b90506000613d6e6103e5613d48868963ffffffff613d9516565b9050613d8b6001828481613d7e57fe5b049063ffffffff613b1716565b9695505050505050565b8082038281111561105a57604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601560248201527f64732d6d6174682d7375622d756e646572666c6f770000000000000000000000604482015290519081900360640190fdfe556e697377617056324c6962726172793a20494e53554646494349454e545f4f55545055545f414d4f554e54556e697377617056324c6962726172793a204944454e544943414c5f414444524553534553556e69737761705632526f757465723a20494e53554646494349454e545f425f414d4f554e54556e697377617056324c6962726172793a20494e53554646494349454e545f4c4951554944495459556e697377617056324c6962726172793a20494e53554646494349454e545f414d4f554e54556e69737761705632526f757465723a204558434553534956455f494e5055545f414d4f554e54556e69737761705632526f757465723a20494e53554646494349454e545f415f414d4f554e545472616e7366657248656c7065723a204554485f5452414e534645525f4641494c4544556e69737761705632526f757465723a20494e53554646494349454e545f4f55545055545f414d4f554e545472616e7366657248656c7065723a205452414e534645525f46524f4d5f4641494c4544556e697377617056324c6962726172793a20494e53554646494349454e545f494e5055545f414d4f554e54a164736f6c6343000606000a';
    }
}
