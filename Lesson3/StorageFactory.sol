// SPDX-License-Identifier: MIT
pragma 0.8.0;

// you cant import the SimpleStorage contract just by pasteing it here
//  and after you deploy it, you can choose which contract you want to interact with

contract SimpleStorage {

    // This gets initialized to zero!
    // <- This means that this section is a comment
    uint256 favoriteNumber;

    mapping(string => uint256) public nameToFavoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // uint256[] public favoriteNumberList;
    People[] public people;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // view, pure
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    // calldata, memory, storage
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

contract StorageFactory {

    SimpleStorage public simpleStorage;

    function createSimpleStorageContract() public {
        // How does storage factory know what simple storage looks like?
        simpleStorage = new SimpleStorage();
    }

}