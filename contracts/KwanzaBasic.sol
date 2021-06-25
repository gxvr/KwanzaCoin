// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./internals/ERC20Basic.sol";
import "./externals/SafeMath";

/**
 * @title KwanzaCoin
 * @dev This code holds the logic for the KwanzaCoin
 */

contract KwanzaBasic is ERC20Basic {

    using SafeMath for uint256;

    mapping(address => uint256) balances;

    uint256 totalSupply_;

    // Total number of tokens in existence
    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }

    // Transfer token for specified address
    function transfer(address _to, uint256 _value) public returns(bool) {
        // _to is the address to send balance to
        require(_to != address(0));

        // _value is the amount to be sent
        // Checks if amount to be sent is less or equal to sender balance
        require(_value <= balances[msg.sender]);

        // SafeMath.sub will throw if there is not enough balance.
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(msg.sender, _to, _value);
        return true;
    }

    // Gets the balance of owner address and returns it
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner]
    }

}