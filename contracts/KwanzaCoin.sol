// SPDX-License-Identifier: MIT
pragma solidity ^0.4.18;

import "./internals/ERC20Basic.sol";
import "./externals/SafeMath";

/**
 * @title KwanzaCoin
 */

contract KwanzaCoin is ERC20Basic {

    using SafeMath for uint256;

    mapping(address => uint256) balances;

    uint256 totalSupply_;

    // Total number of tokens in existence
    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }

    // Transfer token for specified address
    function transfer(address _to, uint256 _amount) public returns(bool) {
        // _to is the address to send balance to
        require(_to != address(0));

        // _amount is the amount to be sent
        // Checks if amount to be sent is less or equal to sender balance
        require(_amount <= balances[msg.sender]);

        // SafeMath.sub will throw if there is not enough balance.
        balances[msg.sender] = balances[msg.sender].sub(_amount);
        balances[_to] = balances[_to].add(_amount);
        Transfer(msg.sender, _to, _amount);
        return true;
    }

    // Gets the balance of owner address and returns it
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner]
    }

}