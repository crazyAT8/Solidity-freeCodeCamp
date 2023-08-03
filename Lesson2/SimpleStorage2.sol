// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;


contract SimpleStorage {
    uint256  favoriteNumber; 
    // People public person = People({favoriteNumber: 2, name: "Will"});
    // this is the long way to write 
    // to keep it short and easy when there is a whole lot of people use an array

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // uint256[] public favoriteNumber;
    People[] public people;

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // people.push(People(_favoriteNumber, _name));
        // People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        People memory newPerson = People(_favoriteNumber, _name);
        people.push(newPerson);
    }
}