// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";

contract FundMe1 {
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 50 * 1e18;  // 1 * 10**18
        // 351 - constant       = .01
        // 2451 - non-constant  = .09

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    } 

    function fund() public payable {
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough!");  
        funders.push(msg.sender); 
        addressToAmountFunded[msg.sender] += msg.value;
    }

// Loop through our objects
    function withdraw() public onlyOwner {
        // require(msg.sender == i_owner, "Sender is not owner!");

        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            // code
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        funders = new address[](0);  
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");                              
    }

    modifier onlyOwner {
        require(msg.sender == i_owner, "Sender is not owner!");
        _;
    }

}