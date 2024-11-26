//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Balance {
    address owner;
    constructor()
    {
        owner = msg.sender;
    }
    function getOwner() public view returns(address)
    {
        return owner;
    }
    function getOwnerBalance() public view returns (uint256)
    {
        return owner.balance;
    }
    function findMe() public view returns(address)
    {
        return msg.sender;
    }
    function getBalance() public view returns(uint256)
    {
        return msg.sender.balance;
    }

}