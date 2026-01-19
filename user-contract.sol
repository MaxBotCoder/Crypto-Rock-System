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
        halvedValue = amount/2;
      if (paymentType == 1) {
        creator.send{value: halvedValue, gas: 100000}("");
      } else if (paymentType == 2) {
        escrow.send{value: halvedValue, gas: 100000}("");
      }
  }

}
