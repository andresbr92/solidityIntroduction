//SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity >=0.7.0 <0.9.0;
import "./inteface.sol";

contract ImplementationSum is Sum {
	function sum(uint num1, uint num2) public override pure returns(uint) {
		return num1 + num2;
	}
}