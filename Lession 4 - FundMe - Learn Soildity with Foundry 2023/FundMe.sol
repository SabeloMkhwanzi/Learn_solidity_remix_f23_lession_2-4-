// 1. Get funds from users
// 2. Withdraw funds
// 3. Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import { PriceConverter } from "PriceConverter.sol";

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    // State Variable
    uint256 public constant MINIMUMUSD = 5e18;
    address[] public funders;
    mapping(address funder => uint256 amountFunded ) public addressToAmountFunded;
    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    // Main function Get funds from users
    function fund() public payable {
        require(msg.value.getConversionRate() >= MINIMUMUSD, "didn't send enough ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    // Main function Withdraw funds
    function withdraw() public onlyOwner {
        // for loop
        // [1, 2, 3, 4] elements
        // 0, 1, 2,  indexes
        // for(/* starting index, end index, step amount*/)
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // rest the array 
        funders = new address[] (0);

        // actually withdraw the funds 
        // how do we withdraw funds
        // there three ways to transfer funds  1. transfer,  2. send, 3. call

        // transfer
        // payable(msg.sender).transfer(address(this).balance);

        // send
        // bool sendeScucess = payable(msg.sender).send(address(this).balance);
        // require(sendeScucess, "send failed");

        // call
           (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
           require(callSuccess, "call failed");

    }

   modifier onlyOwner() {
       //require(msg.sender == i_owner, "Must be ower!");
       if(msg.sender == i_owner){revert NotOwner();}
      _;
   }

   // What happens if someone sends this contract ETH without calling the fund function?
    // Explainer from: https://solidity-by-example.org/fallback/
    // Ether is sent to contract
    //      is msg.data empty?
    //          /   \ 
    //         yes  no
    //         /     \
    //    receive()?  fallback() 
    //     /   \ 
    //   yes   no
    //  /        \
    //receive()  fallback()

    fallback() external payable {
        fund();
    }

    receive() external payable {
        fund();
    }
    
}

// Concepts we didn't cover yet (will cover in later sections)
// 1. Enum
// 2. Events
// 3. Try / Catch
// 4. Function Selector
// 5. abi.encode / decode
// 6. Hash with keccak256
// 7. Yul / Assembly

