// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract School {
    uint[] public NumberOfSchoolBlocks = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    string[] public SchoolTutors = ["jake", "Ola", "Hamid", "John", "Obi"];
    string[] public SchoolColour = ["Green", "Yellow", "red"];
 }
contract MapBalance {
    mapping(address => uint256) private balance;
    function setBalance(uint256 _amount) private {
        balance[msg.sender] = _amount; 
  }
function getBalance() private view returns (uint256) {
    return balance[msg.sender];
}
}
                
                
  
  
   






