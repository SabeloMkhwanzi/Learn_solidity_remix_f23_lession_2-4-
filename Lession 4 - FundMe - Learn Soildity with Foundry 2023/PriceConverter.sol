// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


library PriceConverter {
     function getPrice() internal  view  returns(uint256)  {
     // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
     // ABI 
     AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
     (,int256 price,,,) = priceFeed.latestRoundData();
     return uint256(price * 1e18);
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256)  {
        // 1 ETH?
        // 2000_0000000000000000
        uint256 ethPrice = getPrice();
        // (2000_0000000000000000 * 1_0000000000000000000) / 1e18
        // $2000 = 1 ETH
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}