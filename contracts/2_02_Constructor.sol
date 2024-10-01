// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * create a cointract with some state variable that need to be initialized in the constructor
 */


contract Constructor {

// create a state variable here

// create a constructor here
// constructor(type nameOfVariable) {
//     assign value to state variable here
// }

    address public owner;
    uint public initVar;

    // Constructor function: executed once when the contract is deployed
    constructor(uint _var) {
        // Initialize the owner to the address that deployed the contract (msg.sender)
        owner = msg.sender;
        initVar = _var;
    }

}


