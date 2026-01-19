//SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract user {
  
  //addresses
  address public constant feeCollector = /*fee collector*/;
  address public creator;
  address public escrow;

  //allocated balance
  uint256 public halvedValue;

  //contract intitalization
  constructor() {
    creator = msg.sender;
  }

  //recieve payment
  function sendMoney(uint256 paymentType, uint256 amount) public {
      halvedValue = msg.value/2;
      if (paymentType == 1) {
        
      } else if (paymentType == 2) {

      }
  }

}
