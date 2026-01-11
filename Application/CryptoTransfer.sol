//SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract EtheriumSender {

    //address
    address constant public admin = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;

    //amount for admin
    uint public total;
    uint256 public halfed;
    uint256 public amountAtEnd;

    //send eth
    function sendEth(uint256 _amount, address _to) public {
        total = _amount;
        halfed = _amount/2;
        amountAtEnd = _amount;
        _to.call{value: halfed, gas: 100000}("");
        amountAtEnd -= halfed;
        admin.call{value: halfed, gas: 100000}("");
        amountAtEnd -= halfed;
    }

}
