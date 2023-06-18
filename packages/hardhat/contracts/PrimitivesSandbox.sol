//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// Useful for debugging. Remove when deploying to a live network.
import "hardhat/console.sol";

contract PrimitivesSandbox {
    address public immutable owner;
    constructor(address _owner) {
        owner = _owner;
    }

    function assertionsAboutEtherUnits() public payable {
        // msg.value: built-in global variable that represents the amount of ether sent with the transaction
        if (msg.value > 0) {
            console.log("msg.value is greater than 0");
        }
        // ether: global variable that represents 1 ether in wei
        if (msg.value == 1 ether) {
            console.log("msg.value is equal to 1 ether");
        }
        // wei: global variable that represents 1 wei
        if (msg.value == 1 wei) {
            console.log("msg.value is equal to 1 wei");
        }
        // 1 ether is equal to 10^18 wei
        if (1 ether == 10**18 wei) {
            console.log("1 ether is equal to 10^18 wei");
        }
        // 1 gwei is equal to 10^9 wei
        if (1 gwei == 10**9 wei) {
            console.log("1 gwei is equal to 10^9 wei");
        }
    }
}
