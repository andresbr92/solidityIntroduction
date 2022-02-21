// SPDX-license-identifier: GPL-2.0-or-later
pragma solidity >=0.7.0 <0.9.0;
import "./inteface.sol";

contract Polimorphism  {
	function sumFromContract(uint num1, uint num2, address contractAddress) public returns(uint) {
				Sum interfaceSum = Sum(contractAddress);
				return interfaceSum.sum(num1, num2);
			}
	



}