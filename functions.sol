// SPDX-License-Identifier: GPL-2.0-or-later	
pragma solidity >0.7.0 <0.9.0;


contract Functions {
	function Sum(uint num1, uint num2) public pure returns(uint) {
		return num1 + num2;
	}
	uint private result;
	function ObtainResult() public view returns(uint) {
		return result;

	}
}