//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Array{
    uint256 [] public arr;
    function push(uint256 i)public {
        arr.push(i);
    }  
    function pop()public{
        arr.pop();
    }
    function getArray() public view returns(uint256[] memory)
    {
        return arr;
    }
    function get(uint256 i)public view returns(uint256)
    {
        return arr[i];
    }
}