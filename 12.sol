// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
//send ether to a smart contract

contract EtherVault {
    address public owner;

    // Constructor to set the contract owner
    constructor() payable {
        owner = msg.sender; // Set the deployer as the owner
    }

    // Function to deposit Ether into the contract
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
    }

    // Function to withdraw the total Ether balance (owner only)
    function withdrawAll() public {
        require(msg.sender == owner, "Only the owner can withdraw funds");
        uint256 contractBalance = address(this).balance;
        require(contractBalance > 0, "No funds available for withdrawal");

        // Transfer all Ether to the owner
        payable(owner).transfer(contractBalance);
    }

    // Function to check the contract's balance
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
