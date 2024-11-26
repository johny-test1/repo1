//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract AccountStore {
    // Mapping of account address -> balance
    mapping(address => uint256) public accounts;

    function addAccount(address _account, uint256 _balance) public {
        require(_balance >= 0);
        accounts[_account] = _balance;
    }

    function updateBalance(address _account, uint256 _new_balance) public {
        if (_new_balance < 0)
            revert("Invalid balance");
        
        // Only owner can modify the account's balance
        require(msg.sender == tx.origin || msg.sender == address(1));
        accounts[_account] = _new_balance;
    }

    function getBalance(address _account) view public returns (uint256){
       return  accounts [_account];
   }
}

