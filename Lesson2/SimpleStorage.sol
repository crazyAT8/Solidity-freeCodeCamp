// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;


contract SimpleStorage {
    uint256 public favoriteNumber; 
    // lets create a function that takes this number and changes it to a new value
                            // underscores are used to distinguish btw parameter variables and state variables
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
}