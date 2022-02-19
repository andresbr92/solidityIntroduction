// SPDX-License-Identifier: GPL-2.0-or-later	
pragma solidity >0.7.0 <0.9.0;


contract Functions {
	address private owner;
	constructor () {
		owner = msg.sender;
	}




	function Sum(uint num1, uint num2) public view IsOwner returns (uint) {
		return sumIntern(num1, num2);
	}
	// modifiers
	modifier IsOwner() {
		require(msg.sender == owner, "Only the owner can call this function");
		_;
	}

	function sumIntern (uint num1, uint num2) private pure returns(uint) {
		return num1 + num2;
	}

	uint private result;

	function ObtainResult() public view returns(uint) {
		return result;
	}
}