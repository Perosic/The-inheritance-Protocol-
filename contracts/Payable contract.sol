// SPDX-Lincense-Indetifier :MIT
pragma solidity ^0.8.0;
contract Playablecontract {
    function PayEther() payable public {
    TotalAmountOfEther += msg.value;
    }
}