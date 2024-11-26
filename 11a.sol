//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.;
contract Testing{

    function add(uint a , uint b) public pure returns(uint)
    {
        return a+b;
    } 

    function sub(uint a , uint b) public pure returns(uint)
    {
        return a-b;
    }

    function mul(uint a , uint b) public pure returns(uint)
    {
        return a*b;
    }

    function divide(uint a , uint b) public pure returns(uint)
    {
        return a / b;
    }
}


