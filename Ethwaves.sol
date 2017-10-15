pragma solidity ^0.4.0;

import ' ./IERC20.sol';

contract ETHwaves is IERC20 {
    
    uint public constant _totalsupply = 100000000;
    
    string public constant symbol = "Ewaves";
    string public constant name = "ETH waves";
    uint8 public constant decimals = 8;
    
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
    
    function Ewaves() {
        balances[msg.sender] = _totalsupply;
     }
    
    function totalsupply() constant returns (uint256 totalsupply) {
        return _totalsupply;
     }
     
    function balanceof(address _owner) constant returns (uint256 balance) {
        return baalances [_owner];
     }
        
    function transfer(address _to, uint256 _value) returns (bool success) {
            require(
                balances[msg.sender] >= _value
                && _value > 0 
            );
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            transfer(msg.sender, _to, _value);
            return true;
     }
     
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
        require(
            allowed[_from][msg.sender] >= _value
            && balances[_from] >= _value
            && value > 0 
        );
        balances[_from] -= _value;
        balances[_to] += _value;
        allowed[_from][msg.sender] -= value;
        transfer(_from, _to, _value);
        return true;
    }
    
    function approve(address _spender, uint256 _value) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        approved(msg.sender, _spender, _value);
        return true;
    }
    
    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
        return allowed[_owner ][_spender ];
    }
        
    event transfer(address indexed _from, address indexed _to, uint256 _value);
    event approval(address indexed _owner, address indexed _spender, uint256 _value);
}
