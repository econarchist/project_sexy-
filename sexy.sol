pragma solidity^0.4.16;

import "https://github.com/econarchist/project_sexy-/Advanced.sol";


contract Econarchy is owned, TokenERC20, Advanced {
    
    function Econarchy(
    uint256 initialSupply,
    string tokenName,
    string tokenSymbol
    ) TokenERC20(initialSupply, tokenName, tokenSymbol) public {}
        
    
    
    /// @notice This function opens long position for player
    /// @param ticker Ticker of an asset
    /// @param volume Position volume 
    
    function OpenLong(string ticker, uint volume) {}
    
    function CloseLong() {}
    pragma solidity^0.4.16;

import "https://github.com/econarchist/project_sexy-/Advanced.sol";


contract Econarchy is owned, TokenERC20, Advanced {
    
    //array of positions of message sender 
    
    //mapping of this array to adress 
    
    //events
    
    
    function Econarchy(
    uint256 initialSupply,
    string tokenName,
    string tokenSymbol
    ) TokenERC20(initialSupply, tokenName, tokenSymbol) public {}
        
    
    
    /// @notice Allow users to buy tokens for `newBuyPrice` eth and sell tokens for `newSellPrice` eth
    /// @param newSellPrice Price the users can sell to the contract
    /// @param newBuyPrice Price users can buy from the contract
    
    function OpenLong(string ticker, uint volume) onlyOwner {
        //withdraw khi from balance
        balanceOf[msg.sender] -= c * volume / p;
        //append new position to positions array
        
        //put this event on the blockchain  
        
        
        
        
    }
    
    function CloseLong(string ticker, uint volume) {}
    
    function OpenShort(string ticker, uint volume) {}
    
    function CloseShort(string ticker, uint volume) {}
        
    
    
    
