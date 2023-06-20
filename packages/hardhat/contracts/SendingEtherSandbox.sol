// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract ReceivingSandbox {
    address immutable owner;

    constructor(address _owner) {
        owner = _owner;
    }

    receive() external payable {
        console.log("Value: %s", msg.value);
    }
    fallback() external payable {
        console.log("Value: %s", msg.value);
        console.logBytes(msg.data);
    }
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendingEtherSandbox {
    bool reentrancyLock = false;
    address immutable owner;

    constructor(address _owner) {
        owner = _owner;
    }

    modifier noReentrancy() {
        console.log("reentrancyLock: %s", reentrancyLock);
        require(!reentrancyLock, "No reentrancy");
        reentrancyLock = true;
        _;
        reentrancyLock = false;
    }

    function sendViaCall(address payable _to) public payable noReentrancy {
        require(_to != address(0), "Address does not exist");
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        console.log("sendViaCall: %s", sent);
        console.logBytes(data);
        require(sent, "Failed to send Ether");
    }
}
