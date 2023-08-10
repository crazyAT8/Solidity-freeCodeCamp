// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FundMe1 {
    uint256 public number;

    function fund() public payable {
        // Want to be able to set a minimum fund amount in USD
        // 1. How do we send ETH to this contract?
        number = 5;
        require(msg.value > 1e18, "Didn't send enough!");  // 1e18 == 1 * 10 ** 18 == 1_000_000_000_000_000_000
        // if we had a tone of computation here, we would need to send alot of gas with our fund functtion

        // What is reverting?
        // undo any action before, and send remaining gas back
    }
}


// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";

contract FundMe1 {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 50 * 1e18;  // 1 * 10**18

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {
        require(msg.value.getConversionRate() >= minimumUsd, "Didn't send enough!");  // 1e18 == 1 * 10 ** 18 == 1_000_000_000_000_000_000
        funders.push(msg.sender); 
        addressToAmountFunded[msg.sender] += msg.value;
    }

// Loop through our objects
    function withdraw() public {
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            // code
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // resest the array
        // actually withdraw the funds

        funders = new address[](0);  

        // 3 different ways to send the ether to the person calling the contract

            // 1) transfer
                            // this refers to the whole contract
                // need to cast msg.sender from an address type to a payable type
                // msg.sender = address
                // payable(msg.sender) = payable address
        // payable(msg.sender).transfer(address(this).balance);
                    // if send fails it throws an error

            // 2) send
                    // if this send fails it sends a boolean response, thats why its wrapped as a boolean variable
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");

            // 3) call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");                                                    // we require call success is true otherwise we'll revert with an error
            // the call function returns 2 variables
                // 1. boolean object
                // 2. bytes object
                    //  data returns need to be in memory
                    // bytes memory dataReturned
                // for our code here we are actually not calling a function, so we don't need dataReturned
                    // but we leave the comma, telling solidity that we know the function retuns two variables but we only care about one

    }

}


        // for loop
        // [1, 2, 3, 4]
        // [a, b, c, d]
        //  0. 1. 2. 3. 
        // for(staring index, ending index, step amount)