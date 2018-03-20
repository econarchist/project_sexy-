pragma solidity^0.4.16;

import "https://github.com/econarchist/project_sexy-/Advanced.sol";





contract Econarchy is owned, TokenERC20, Advanced {
    
    struct Position {
        uint token_price;
        uint asset_price;
        uint volume;
        string direction;
        uint time;
    }
    
    //Each player can have a number of positions in different shadow assets. This is a mapping from ticker to Position(dir, vol,price, time)
    mapping(string => Position) public positions;
    
    //This is another mapping that will match each player to his/her mapping of positions 
    mapping(address => mapping(string => Position)) public accounts;
    
    //Each bet is an event on the blockchain
    event EnterContract(address _player, string _ticker, string _direction, uint _volume, uint _time );
    event PartialExecution(address _player, string _ticker, string _direction, uint _volume, uint _time );
    event FullExecution(address _player, string _ticker, string _direction, uint _time );
    
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
        
        //Quote current asset price and token price (express in big numbers tho)
        uint c;
        uint p;
        
        //Withdraw khi from balance
        balanceOf[msg.sender] -= c * _volume / p;
        
        //Record this position to message sender's account
        accounts[msg.sender][_ticker] = Position(c, p, _volume, "BUY", now);
        
        //Put this event on the blockchain  
        EnterContract(msg.sender, _ticker, 'BUY', _volume, now);
        
    }
    
    /// @notice Closes long position for shadow asset `_ticker`. `_volume` can be less or equal 
    /// @param _ticker kek
    /// @param _volume kek
    function CloseLong(string _ticker, uint _volume) onlyOwner {
        
        //Quote current asset price and token price (express in big numbers tho)
        uint c;
        uint p;
        
        // require(_volume <= /*the other volume */);
        
        //Update volume in message sender's account
        accounts[msg.sender][_ticker].volume -= _volume;
        
        //Delete position from message sender's account if it is executed in full ammount
        if (accounts[msg.sender][_ticker].volume == 0){
            delete accounts[msg.sender][_ticker];
            
            //Put this event on the blockchain
            FullExecution(msg.sender, _ticker, "BUY", now);
        } else { //If position is only partly executed put `PartialExecution` events on the blockchain
            PartialExecution(msg.sender, _ticker, "BUY", _volume, now);
        }
        
        //Player gets returns to his balance
        balanceOf[msg.sender] -= c * _volume / p;
        
    }
    
    
    function OpenShort(string _ticker, uint _volume) {
                
     
        
    }

    
    function CloseShort(string ticker, uint volume) {}
        
    
}
