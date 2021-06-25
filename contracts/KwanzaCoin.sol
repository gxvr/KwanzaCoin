// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import './internals/StandardToken';

contract KwanzaCoin is StandardToken {
  string public name = "KwanzaCoin"; 
  string public symbol = "KCC";
  uint public decimals = 2;
  uint public INITIAL_SUPPLY = 100000;
  uint256 public totalSupply;

  function KwanzaCoin() public {
    totalSupply = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
  }
}
