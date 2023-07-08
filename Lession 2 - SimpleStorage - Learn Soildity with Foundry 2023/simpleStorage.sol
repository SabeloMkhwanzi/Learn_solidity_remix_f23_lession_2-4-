//SPDX-License-Identifier: MT
pragma solidity 0.8.18; // SOLIDITY VERSION
// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;

contract  SimpleStorgage {
    // Basic types: boolan, unit, int, address, bytes
    // bool hasFavoriteNumber = true;
    // uint256 favoriteNumber = 88;
    // string favoriteNumberInText = "eight-eight";
    // int256 favoriteInt = -88;
    // address myAddress = 0x2BE1CA5900044187536D31B1a28cC6bb2bd88772;
    // bytes32 favoriteBytes32 = "cat";
    
    // favoriteNumber get initialized to 0 if no value give
    uint256 myFavoriteNumber ;

    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    // dynamic array
    Person[] public listOfPeople; //[]

    // mapping array
    mapping(string => uint256) public nameToFavoiteNumber;

    // Person public pat = Person({favoriteNumber:7, name: "pat"}); 
    // Person public mariah = Person({favoriteNumber:7, name: "mariah"}); 
    // Person public john = Person({favoriteNumber:7, name: "john"}); 

    // Storing Function
    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    } 
    
    // view, pure 
    function retrieve() public view returns(uint256) {
        return myFavoriteNumber;
    }

    // Adding & update Person Function  - EVM store and access places memory(Temporal), callback(Temporal), storage(Permanent)
   function addPerson(string memory _name, uint256 _favoriteNumber) public {
       listOfPeople.push(Person(_favoriteNumber, _name));
       nameToFavoiteNumber[_name] = _favoriteNumber;
   }

}







