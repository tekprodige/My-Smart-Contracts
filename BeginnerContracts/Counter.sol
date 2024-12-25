// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Counter
{
    //initializing counter variable
    uint256 counter;

    //function to get counter value
    function getCounter () public view returns (uint256)
    {
        return counter;
    }

    //function to increase counter value
    function increaseCounter() public
    {
        counter = counter + 1;
    }

    //function to decrease counter value
    function decreaseCounter() public 
    {
        require(counter > 0, "Counter is already at zero!");
        counter = counter - 1;
    }

    //function to reset counter value
    function resetCounter() public 
    {
        delete counter;
    }
}