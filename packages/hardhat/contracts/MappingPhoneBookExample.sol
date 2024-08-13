//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// Useful for debugging. Remove when deploying to a live network.
import "hardhat/console.sol";

contract MappingPhoneBookExample {
    address immutable owner;
    mapping(string => mapping(string => string)) phoneBook;

    constructor(address _owner) {
        owner = _owner;
    }

    function addEntry(string memory _name, string memory _workOrHome, string memory _phoneNumber) public {
        require(keccak256(abi.encodePacked(_workOrHome)) == keccak256(abi.encodePacked("work")) || keccak256(abi.encodePacked(_workOrHome)) == keccak256(abi.encodePacked("home")), "Please enter 'work' or 'home' for the second parameter");
        phoneBook[_name][_workOrHome] = _phoneNumber;
    }

    function getEntry(string memory _name, string memory _workOrHome) public view returns (string memory) {
        return phoneBook[_name][_workOrHome];
    }

    function removeEntry(string memory _name, string memory _workOrHome) public {
        delete phoneBook[_name][_workOrHome];
    }
}
