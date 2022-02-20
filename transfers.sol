// SPDX-license-identifier: GPL-2.0-or-later
pragma solidity >=0.7.0 <0.9.0;

	
contract Transfers {
	constructor() payable {

	}
	// send have a output value in case of success or failure
	function transferBySend(address destiny, uint quantity) public returns(bool) {
		bool output = payable(destiny).send(quantity);
		return output;
	}
	// transfer does not have a output value in case of success or failure
	function transferByTransfer(address destiny, uint quantity) public {
		payable(destiny).transfer(quantity);
	}
	// call have a boolean output value in case of success or failure (true, false)
	// have another output with the parameter of other function (for exmaple, another contract function)
	function transferByCall(address destiny, uint quantity) public returns(bool) {
		(bool output, bytes memory response) = destiny.call{value: quantity}("");
		return output;
	}
}