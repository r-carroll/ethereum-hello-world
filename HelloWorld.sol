// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld {
    string public message;
    
    function setMessage(string memory newMessage) public {
        message = newMessage;
    }
    
    function remove() public {
        selfdestruct(payable (address (0x0)));
    }
}