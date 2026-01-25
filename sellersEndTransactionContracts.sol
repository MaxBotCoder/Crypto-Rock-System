//SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract cashConversionEscrow {

    //addresses
    address public contractPublisher;
    address public cashConversionDepositAddress;

    //balance
    uint256 public balance;

    //constructor 
    constructor(address _contractPublisher, address _cashConversionDepositAddress) {
        contractPublisher = _contractPublisher;
        cashConversionDepositAddress = _cashConversionDepositAddress;
    }

    //escrow import
    fallback() external payable {
        balance += msg.value;
    }

    //trade crypto for cash
    function exchangeEtheriumForCash(uint256 _amountToWithdraw) public {
        require(_amountToWithdraw <= balance);
        balance -= _amountToWithdraw;
        cashConversionDepositAddress.call{value: _amountToWithdraw, gas: 200000}("");
    }

}

contract senderAndCreationContract {

    //addresses
    address constant public feeCollector = 0x0000000000000000000000000000000000000000;
    address public contractPublisher;
    address public addressOfEC;

    //money alocation
    mapping(address => uint256) public moneyAlocatedToWhom; //alocates money to given person

    //contracts
    cashConversionEscrow public CCE; //escrow contract

    //constructor
    constructor(address _cashConversionDepositAddress) {
        contractPublisher = msg.sender;
        addressOfEC = address(CCE = new cashConversionEscrow(contractPublisher, _cashConversionDepositAddress));
    }

    //send money
    function sendMoney(uint256 _paymentType, uint256 _quantity) public {
        require(_paymentType == 0 || _paymentType == 1);
        if (_paymentType == 0) {
            payable(feeCollector).call{value: moneyAlocatedToWhom[feeCollector] = _quantity/10, gas: 200000}("");
            payable(contractPublisher).call{value: moneyAlocatedToWhom[contractPublisher] = _quantity -= moneyAlocatedToWhom[feeCollector], gas: 200000}("");
        } else if (_paymentType == 1) {
            payable(addressOfEC).call{value: moneyAlocatedToWhom[feeCollector] = _quantity/10, gas: 200000}("");
            payable(addressOfEC).call{value: moneyAlocatedToWhom[addressOfEC] = _quantity -= moneyAlocatedToWhom[feeCollector], gas: 200000}("");
        }
    }
}