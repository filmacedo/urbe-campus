// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * this is a contract to learn data types and functions in solidity.
 * Create a contract that demonstrates the use of different data types (e.g., uint, int, bool, address, string, and arrays and mapping)
 * Create data type, getters and setters
 * at the end, you need to compile and deploy the contract using remix
 */


contract BasicTypes {

    // uint : integers without sign:
    uint public unsignedInteger = 10;

    function setUnsignedInteger(uint _value) public {
        unsignedInteger = _value;
    }

    //this getter function only reads state and doesn’t modify it, so the view keyword is used.
    function getUnsignedInteger () public view returns (uint) {
        return unsignedInteger;
    }


    // int : signed integers (can be negative or positive)
    int public Integer = -5;

    function setInteger(int _value) public {
        Integer = _value;
    }

    function getInteger () public view returns (int) {
        return Integer;
    }

    // bool : true or false
    bool public isBoolean = true;

    function setIsBoolean(bool _value) public {
        isBoolean = _value;
    }

    function getIsBoolean () public view returns (bool) {
        return isBoolean;
    }

    // address : stores an Ethereum address
    address public walletAddress = 0xc0ddf0D22c3E735bBB381747F972908a7FC4c9Af;

    function setWalletAddress(address _value) public {
        walletAddress = _value;
    }

    function getWalletAddress () public view returns (address) {
        return walletAddress;
    }

    // string : used to store text
    string public Name = "macedo";

    //this setter function uses temporary storage in "memory", as opposed to being stored permanently on the blockchain in storage.
    function setName(string memory _value) public {
        Name = _value;
    }

    //the memory keyword is only used with reference types such as arrays, structs, mappings, and strings.
    function getName () public view returns (string memory) {
        return Name;
    }
    



}
