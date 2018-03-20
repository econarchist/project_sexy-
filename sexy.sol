pragma solidity^0.4.16;

import "https://github.com/econarchist/project_sexy-/Advanced.sol";





contract Econarchy is owned, TokenERC20, Advanced {
    
    struct Position {
        string ticker;
        string direction;
        uint volume;
        uint time;
    }
    
    //Each player can have a number of positions in different shadow assets. This is a mapping from ticker to Position(dir, vol,price, time)
    mapping(string => Position) public positions;
    
    //This is another mapping that will match each player to his/her mapping of positions 
    mapping(adress => mapping(string => Position)) public accounts;
    
    
    
    
    //Each player may have an array of positions 
    //mapping(address => Position[]) public positions;
    
    //Each position has corresponding ticker (defined as mapping for computational efficiencty)
    //mapping(string => mapping(address => Position[])) public ticker;
    
    //Each bet is an event on the blockchain
    event Bet(address _player, string _ticker, string _direction, uint _volume, uint _time );
    
    //Constructor
    function Econarchy(
    uint256 initialSupply,
    string tokenName,
    string tokenSymbol
    ) TokenERC20(initialSupply, tokenName, tokenSymbol) public {}
        
    
    
    /// @notice Opens long position for shadow asset `_ticker` of size `_volume`
    /// @param _ticker kek
    /// @param _volume kek
    function OpenLong(string _ticker, uint _volume) onlyOwner {
        
        //Quote asset price and token price (express in big numbers tho)
        uint c;
        uint p;
        
        //Withdraw khi from balance
        balanceOf[msg.sender] -= c * _volume / p;
        
        //New position expressed as struct
        //Position new_position = Position(_ticker, 'BUY', _volume, now);
        
        //append new position to positions array
        positions[msg.sender].push( Position(_ticker, 'BUY', _volume, now) );
        
        //put this event on the blockchain  
        Bet(msg.sender, _ticker, 'BUY', _volume, now);
        
    }
    
    /// @notice Closes long position for shadow asset `_ticker`. `_volume` can be less or equal 
    /// @param _ticker kek
    /// @param _volume kek
    function CloseLong(string _ticker, uint _volume) {
        
        // require(_volume <= /*the other volume */);
        //positions[msg.sender][_ticker].volume -= _volume;
        
        //Player gets returns 
        //balanceOf[msg.sender] -= c * _volume / p;
        
    }
    
    
    function OpenShort(string _ticker, uint _volume) {
                
        //Quote asset price and token price (express in big numbers tho)
        uint c;
        uint p;
        
        //Withdraw khi from balance
        balanceOf[msg.sender] -= c * _volume / p;
        
        //Push new position to positions array
        positions[msg.sender].push( Position(_ticker, 'SELL', _volume, now) );
        
        //Put this event on the blockchain  
        Bet(msg.sender, _ticker, 'SELL', _volume, now);
        
    }

    
    function CloseShort(string ticker, uint volume) {}
        
    
}
    
