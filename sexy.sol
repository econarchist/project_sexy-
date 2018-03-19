pragma solidity^0.4.16;

import "https://github.com/econarchist/project_sexy-/Advanced.sol";


contract Econarchy is owned, TokenERC20, Advanced {
    
    function Econarchy(
    uint256 initialSupply,
    string tokenName,
    string tokenSymbol
    ) TokenERC20(initialSupply, tokenName, tokenSymbol) public {}
        
    
    
    /// @notice Allow users to buy tokens for `newBuyPrice` eth and sell tokens for `newSellPrice` eth
    /// @param newSellPrice Price the users can sell to the contract
    /// @param newBuyPrice Price users can buy from the contract
    
    function OpenLong(string ticker, uint volume) {}
    
    function CloseLong() {}
    
    function OpenShort() {}
    
    function CloseShort() {}
        
    
    
}
    function OpenShort() {}
    
    function CloseShort() {}
        
    
    
}
