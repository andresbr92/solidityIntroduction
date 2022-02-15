// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Permission {
    address private owner;
    string public projectName = "Andres";

    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can do this");
        _;
    }   
    function changeProjectName (string memory _projectName) public onlyOwner {
        projectName = _projectName;
    }

 
}