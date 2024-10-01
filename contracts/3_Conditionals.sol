// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * this is a contract to learn conditional statements and the use of require 
 * create a contract that has a myAge variable and a conditional that emit an event saying "you're in" if  myAge >=18 else "you cannot enter" if myAge < 18.
 * hint: you need to set the variable first!
 */


contract Conditionals {

    uint public myAge; 

    event bouncer(bool isOk, uint age, string message);

    /*
    that's a conditional statement in solidity:
    if(condition){ do things}

    then you can use things like if(condition){do things}else{do other things} and so on
    */

    constructor(uint newAge){
        myAge = newAge;
    }

    function checkAge() public {
        require(myAge != 0, "age is not initialized");
        if(myAge > 18){
            emit bouncer(true, myAge, "you're in");
        }
        else{
            emit bouncer(false, myAge, "you cannot enter");
        }
    }



    
}
