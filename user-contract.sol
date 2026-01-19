//SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract user {
  
  //addresses
  address public constant feeCollector = /*fee collector*/;
  address public creator;
  address public escrow;

  //allocated balance
  uint256 public halfedValue;

  //contract intitalization
  constructor() {

  }

  fallback() external payable {

  }

}
