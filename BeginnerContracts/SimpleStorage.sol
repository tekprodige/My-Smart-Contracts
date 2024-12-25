// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SimpleStorage 
{
    // Basic types: boolean(i.e. true or false), uint(i.e. 6), int(i.e. -6), address(i.e. 0xa6te...), bytes
    // bool hasFavoriteNumber = true;
    // uint256 favoriteNumber = 88;
    // string favoriteNumberInText = "88";
    // int256 favoriteInt = -88;
    // address myAddress = 0xddaAd340b0f1Ef65169Ae5E41A8b10776a75482d;
    // bytes32 favoriteBytes32 = "cat";
    // calldata - temporary variable that cannot be modified 
    // memory - temporary variable that can be modified
    // storage - perminant variable that can be modified

    //favoriteNumber gets initialized to 0 if no number is given
    uint256 myFavoriteNumber; // default to 0

    //Arrays
    uint256[] listOfFavoriteNumbers;

    //Custom data type
    struct Person
    {
        uint256 favoriteNumber;
        string name;
    }

    //Instance of array list of people
    Person[] public listOfPeople;

    //Creating an instance of Person 
    Person public pat = Person({favoriteNumber: 7, name: "Pat"});

    //Mapping user name to favorite number
    mapping(string => uint256) public nameToFavoriteNumber;

    //function to store favorite number
    function store(uint256 _favoriteNumber) public 
    {
        myFavoriteNumber = _favoriteNumber;
    }

    //view - only read state from blockchain, pure
    function retrieve() public view returns(uint256)
    {
        return myFavoriteNumber;
    }

    //Function to add new people to the list of Persons
    function addPerson(string memory _name, uint256 _favoriteNumber) public 
    {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}