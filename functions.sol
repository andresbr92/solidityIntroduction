// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >0.7.0 <0.9.0;

contract Functions {
    address private owner;
		// types of storage
		// storage is a type of storage that is stored in the blockchain
		// memory is a type of storage that is stored in the stack.
		// calldata is a type of storage used by functions parameters.

    constructor() {
        owner = msg.sender;
    }

    function Sum(uint256 num1, uint256 num2)
        public
        view
        IsOwner
        returns (uint256)
    {
        return sumIntern(num1, num2);
    }

    // modifiers
    modifier IsOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function sumIntern(uint256 num1, uint256 num2)
        private
        pure
        returns (uint256)
    {
        return num1 + num2;
    }

    uint256 private result;

    function ObtainResult() public view returns (uint256) {
        return result;
    }
}
