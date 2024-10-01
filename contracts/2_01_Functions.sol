// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * this is a contract to learn functions, contract state and return values in solidity.
 * Create a contract that contains 2 functions:
    one has to modify the contract state and the other one has to return a value
    one of them has to emit an event
 * at the end, you need to compile and deploy the contract using remix
 * check in the remix logs the event that you emitted
 */


contract Functions {

    event Hello(string indexed hello); // one function need to emit this event this way: emit Hello('hi')
    
    function log(string memory _text) public {
        emit Hello(_text);
    }

    // assignment: create the functions here 

    // Declare an event
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Function that triggers a transfer and emits an event
    function transfer(address _to, uint256 _amount) public {
        // Emit the event log with the transaction data
        emit Transfer(msg.sender, _to, _amount);
    }

}


