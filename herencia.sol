// SPDX-license-identifier: GPL-2.0-or-later
pragma solidity >=0.7.0 <0.9.0;

import "./inteface.sol";
import "./modifiersHerencia.sol";

contract Herencia is Sum, Modifiers {

    constructor(string memory newName) Modifiers(newName) {
        
    }
	function sum(uint num1, num2) public override IsOwner() view returns(uint) {
		return num1 + num2;
	}


}