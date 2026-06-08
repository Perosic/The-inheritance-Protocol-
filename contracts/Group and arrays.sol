// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract TheBank {
    string[] public BankBranches ;
    uint256[3] public BankID = [101,102,103];
    function addBankBranches (string memory _Branch) public {BankBranches.push( _Branch);
    }
    function updateBankBranches (uint256 _index, string memory  NewBranch ) public {
        require (_index < BankBranches.length, "index out of bound " ) ;
        BankBranches [_index ] = NewBranch;
    }
    function getBankBranches(uint256 _index) public view returns (string memory) {
        return BankBranches[_index];
   }
    function updateBankID (uint256 _index, uint256 _NewBankID) public {BankID [_index] = _NewBankID;
    }
    function getBankID(uint256 _index) public view returns (uint256) {
        return BankID[_index];
    }
 }
