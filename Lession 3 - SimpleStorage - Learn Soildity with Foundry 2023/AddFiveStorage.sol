//SPDX-License-Identifier: MT
pragma solidity ^0.8.18; // SOLIDITY VERSION

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorege is SimpleStorage {
    // + 5
    // override
    // virtual on the contract we are inheriting from
   function store(uint256 _favoriteNumber) public override {
        myFavoriteNumber = _favoriteNumber + 5;
    }
}