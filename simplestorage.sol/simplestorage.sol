// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SimpleStorage {
    uint256 private favoriteNumber; // Stores the user's favorite number

    uint256[] public favoriteNumbers; // Dynamic array to store multiple favorite numbers

    // Struct to store a person’s name and their favorite number
    struct Person {
        string name; // Person's name
        uint256 favoriteNumber; // Their favorite number
    }

    Person[] public people; // Array of Person structs to store multiple people's data

    // Enum to manage contract states (Active or Inactive)
    enum ContractState {
        Active, // State representing an active contract
        Inactive // State representing an inactive contract
    }

    ContractState public state; // State variable to store the current contract state

    function storeNumber(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function getFavoriteNumber() public view returns (uint256) {
        return favoriteNumber;
    }

    function isGreaterThan(uint256 _compareValue) public view returns (bool) {
        if (favoriteNumber > _compareValue) {
            return true;
        } else {
            return false;
        }
    }

    // Loops allowing us to Calculates and returns the sum of all numbers from 1 to the stored favorite number.
    function sumFavorite() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 1; i <= favoriteNumber; i++) {
            sum += i;
        }
        return sum;
    }

    //Add functions with various visibilities such us Public, Private, Internal and External levels to demonstrate their usage

    function internalFunction() internal pure returns (string memory) {
        return "This is an internal function"; // Internal: can be accessed within this contract or derived contracts
    }

    //  Wrapper function to expose internalFuction for testing purposes
    function callInternalFuction() public pure returns (string memory) {
        return internalFunction(); // Callls the internal fuction from within the contract
    }

    function externalFunction() external pure returns (string memory) {
        return "This is an external function"; // Exyernals: Can only be called from outside the contract
    }

    function textExternalFuction() public view returns (string memory) {
        return this.textExternalFuction(); // Calls the external fuction within the contract using 'this'
    }

    function addFavoriteNumber(uint256 _number) public {
        favoriteNumbers.push(_number);
    }

    // Struct Funtion
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(Person(_name, _favoriteNumber));
    }

    // Implement an emum
    function activateContract() public {
        state = ContractState.Active;
    }

    function deactivateContract() public {
        state = ContractState.Inactive;
    }

    function isActive() public view returns (bool) {
        return state == ContractState.Active;
    }
}
