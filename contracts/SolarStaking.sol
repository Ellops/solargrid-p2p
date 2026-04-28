// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract SolarStaking is ReentrancyGuard {
    IERC20 public stakingToken;
    AggregatorV3Interface internal priceFeed;

    mapping(address => uint256) public balances;

    constructor(address _stakingToken) {
        stakingToken = IERC20(_stakingToken);
        // Sepolia ETH/USD Aggregator
        priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    }

    function stake(uint256 _amount) external nonReentrant {
        require(_amount > 0, "Amount must be greater than 0");
        stakingToken.transferFrom(msg.sender, address(this), _amount);
        balances[msg.sender] += _amount;
    }

    function withdraw(uint256 _amount) external nonReentrant {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        stakingToken.transfer(msg.sender, _amount);
    }

    // Retorna o preco do ETH em USD (8 casas decimais)
    function getLatestEthPrice() public view returns (int) {
        (, int price, , , ) = priceFeed.latestRoundData();
        return price;
    }
}
