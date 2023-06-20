// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract EventsSandbox {
    event Log(address indexed sender, string message);
    event AnotherLog();

    constructor(string memory _message) {
        console.log("Deploying a EventsSandbox with message:", _message);
    }

    function test() public returns (string memory) {
        emit Log(msg.sender, "Hello World!");
        emit Log(msg.sender, "Hello EVM!");
        emit AnotherLog();

        console.log("check transction receipt for emitted events");
    }
}
