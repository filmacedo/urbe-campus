// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// that's a little bit complex so I'll go trhough it. 
// then, the exercise is to rewrite this contract  but you need to send money each other
// deploy this contract, send the address to your mate. your mate should send something here
// as a task, you need to go to the sepolia block explorer and check the transaction you sent!
// for this task, you need to create a wallet: https://metamask.io/it/
// then go here to get test tokens: https://faucets.chain.link/sepolia

contract SimpleWallet {
    address public owner;
    uint public amount;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    receive() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdraw(uint _amount) public onlyOwner {
       
        // Check if the contract has enough balance to withdraw the specified amount
        require(address(this).balance >= _amount, "Insufficient balance");

        // Transfer the specified amount to the owner
        payable(owner).transfer(_amount);
    }
}
