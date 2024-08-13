//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// Useful for debugging. Remove when deploying to a live network.
import "hardhat/console.sol";

contract UnitsAndGlobalStuffSandbox {
    address immutable owner;
    constructor(address _owner) {
        owner = _owner;
    }

    function etherUnits() public payable {
        console.log("msg.value is %s wei", msg.value);

        if (msg.value == 1 ether) {
            console.log("msg.value is equal to 1 ether");
        }
        if (msg.value == 1 wei) {
            console.log("msg.value is equal to 1 wei");
        }
        if (msg.value == 1 gwei) {
            console.log("msg.value is equal to 1 gwei");
        }
        console.log("1", 1 ether == 1e18);
        console.log("2", 1 ether == 10**18);
        console.log("3", 1 wei == 1);
        console.log("4", 1 gwei == 1e9);
        console.log("5", 1 ether == 1e9 gwei);
    }

    function timeUnits() public view {
        console.log("block.timestamp is %s", block.timestamp);
        console.log("block.timestamp is %s seconds", block.timestamp / 1 seconds);
        console.log("block.timestamp is %s minutes", block.timestamp / 1 minutes);
        console.log("block.timestamp is %s hours", block.timestamp / 1 hours);
        console.log("block.timestamp is %s days", block.timestamp / 1 days);
        console.log("block.timestamp is %s weeks", block.timestamp / 1 weeks);
    }

    function gasUnits() public view {
        console.log("gasleft is %s", gasleft());
        console.log("tx.gasprice is %s", tx.gasprice);
    }

    // TODO: local variable for temp owner address
    address supriseOwner;
    function errorHandling() public {
        // NOTE: for validating external inputs, use require()
        require(msg.sender == owner, "You are not the owner");
        if (block.timestamp % 4 == 0) {
            supriseOwner = msg.sender;
        } else {
            supriseOwner = address(0x123);
        }
        // NOTE: for validating internal state, use assert()
        // (no reason can be given for why this would fail)
        assert(supriseOwner != owner);
        if (block.timestamp % 1337 == 0) {
            revert("If we for some reason need to revert manually, we will do so here");
        }
    }
}
