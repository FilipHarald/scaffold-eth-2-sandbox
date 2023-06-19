//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// Useful for debugging. Remove when deploying to a live network.
import "hardhat/console.sol";

contract FunctionModifiersSandbox {
    address public owner;
    uint public x = 10;
    bool public counterMutexLock = false;

    constructor(address _owner) {
        owner = _owner;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Not the Owner");
        _;
    }

    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public isOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    modifier noReentrancy() {
        require(!counterMutexLock, "No reentrancy");

        counterMutexLock = true;
        _;
        counterMutexLock = false;
    }

    function decrement(uint i) public noReentrancy {
        x -= i;

        if (i > 1) {
            // NOTE: this recursion is basically never going to work since it will be reverted by the modifier
            decrement(i - 1);
        }
    }
}
