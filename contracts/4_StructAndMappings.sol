// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * Create a contract to store a list of animals using a struct and a mapping, and implement functions to add and retrieve data.
 */


contract StructAndMappings {
        /*
        a struct is something like that:
        */
        struct Person {
            string name;
            uint age;
            // and so on
        }

        // that's a mapping: this is mapping a number (an index) to a person, so that when I add a person, this would be tied to an index: 
        // eg: 1 -> Fabrizio, 2 -> Chiara, 3 -> Francesco
        // hint: you need to keep the count of the index. how?
        mapping (uint => Person) public people;

        

        // assignment: create a struct for animals, make a mapping of Animals 
        // you need to declare the struct and the mapping. then you need to create a function to add elements to the mapping and a function to get the element at the nth index

        struct Animal {
            string name;
            string species;
        }

        // Mapping to store animals, using an index as the key
        mapping(uint => Animal) public animals;
    
        // Variable to keep track of the number of animals added
        uint public animalCount;

        // Function to add an animal to the mapping
        function addAnimal(string memory _name, string memory _species) public {
            
            // Create a new Animal instance
            Animal memory newAnimal = Animal({
                name: _name,
                species: _species
            });
            
            // Add the new animal to the mapping
            animals[animalCount] = newAnimal;

            // Increment the animal count
            animalCount++;
        }

        // Function to get the animal at the nth index
        function getAnimal(uint _index) public view returns (string memory, string memory) {
            // Ensure the index is valid
            require(_index < animalCount, "Animal not found at this index");
            
            // Retrieve the animal from the mapping
            Animal memory retrievedAnimal = animals[_index];
            
            // Return the name and species of the animal
            return (retrievedAnimal.name, retrievedAnimal.species);
        }

    }



    

