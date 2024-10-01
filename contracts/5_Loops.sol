// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * Create a contract that has an array. initialize the array and loop trough its values
 */

// the assignment is to create a function to populate the array using .push(element) so that --> elements.push(newElement)
// and to loop trough the array and emit an event for each element


contract Loops {
       
      // that's an array: 
      string[] public elements;
      uint public counter;

      // Event to emit each time an element is added or looped through
      event ElementAdded(string element);
      event ElementEmitted(string element);

      // Constructor to initialize the contract with some elements
      constructor (string[] memory _elements) {
         elements = _elements;
         counter = _elements.length;
      }

      // Function to populate the array using .push()
      function addElement(string memory newElement) public {
        elements.push(newElement);
        counter++;

        // Emit event when an element is added
        emit ElementAdded(newElement);
      }

      // Function to loop through the array and emit an event for each element
      function loopAndEmit() public {
        for (uint i = 0; i < elements.length; i++) {
            // Emit an event for each element
            emit ElementEmitted(elements[i]);
        }
      }

         function getCounter() public view returns (uint){
         return counter;
      }





    }



    

