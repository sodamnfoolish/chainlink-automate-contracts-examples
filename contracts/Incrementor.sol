// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Incrementor {
    uint256 public value;

    function increment() external {
        value++;
    }
}