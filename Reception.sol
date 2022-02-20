// SPDX-license-identifier: GPL-2.0-or-later
pragma solidity >=0.7.0 <0.9.0;

	
contract Reception {
	mapping(address => uint) balances;

	receive() external payable {
		balances[msg.sender] += msg.value;
	}
	fallback() external payable {
	}
	function receiveBalance(uint number) public payable {
		uint quantity = msg.value;
		quantity = number; 
	} 
}