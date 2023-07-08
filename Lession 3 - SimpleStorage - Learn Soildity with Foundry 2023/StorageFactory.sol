// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public listOfSimpleStorageContracts;
  
    // Creates or deploys a new contract instance
    function createSimpleStorageContract() public {
         SimpleStorage newSimpleStorageContracts = new SimpleStorage();
         listOfSimpleStorageContracts.push(newSimpleStorageContracts);
    }

    // interacting with other contracts function - when interacting contracts we 1. Address,  2. ABI- Application Binary Interface
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
       // SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        listOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }
  
  function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
      //SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
      return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
      
  }

}

