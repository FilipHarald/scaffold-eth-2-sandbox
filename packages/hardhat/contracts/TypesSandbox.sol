//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// Useful for debugging. Remove when deploying to a live network.
import "hardhat/console.sol";

contract TypesSandbox {
    address immutable owner;
    constructor(address _owner) {
        owner = _owner;
    }

    function printTypeFunctions() public view {
        int x = type(int).min;
        console.logInt(x);
    }

    function byteArrays() public view returns (bytes3){
        // NOTE: bytes is dynamic (padded with 0s) and byte1...byte32 are static
        uint256 aInt = 0x123;
        bytes memory a = abi.encodePacked(aInt);
        console.logBytes(a);
        bytes3 b = 0x112233;
        return b;
    }

}
