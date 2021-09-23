// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

/**
** Implementing a standard Pearlzz contract, ERC 20 interface, 6 M, 2 O
** Loyalty based DAO, which allows for transacting points across several different loyalty systems
** function totalSupply() public constant returns (uint);
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
 
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
*/
contract pearlzz {

constructor() {
        balanceOf[msg.sender] = __totalSupply;
    }

    string public name = "Pearlzz Token"; 
    uint8 public decimals = 8;     
    string public symbol = "PZZ";  
    string public version = '1.0'; 

    mapping (address => uint256) balanceOf;
    mapping (address => mapping (address => uint256)) allowed;
    uint256 private __totalSupply = 1000000000000000000000000; // 1 million tokens

  event Transfer(
        address indexed _from,
        address indexed _to, 
        uint _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender, 
        uint _value
    );

    /*  function allowance(address _owner, address _spender) public returns (uint256 remaining) {
      return allowed[_owner][_spender];
    }*/

/**
  * @dev Total number of tokens in existence
  */
  function totalSupply() public view returns (uint256 _totalSupply) {
    _totalSupply = __totalSupply ;
  }

    // transfer A to B and the value, but check if A has value and if it is GT Zero, Add the value to B and send trx to chain
    function transfer(address _to, uint256 _value) public returns (bool success) {
        if (balanceOf[msg.sender] >= _value && _value > 0) {
            balanceOf[msg.sender] -= _value;
            balanceOf[_to] += _value;
            emit Transfer(msg.sender, _to, _value);
            return true;
        } else { return false; }
    }


    // transfer A to B and the value, but check if A has value and if it is GT Zero, Add the value to B and send trx to chain
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        if (balanceOf[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0) {
            balanceOf[_to] += _value;
            balanceOf[_from] -= _value;
            allowed[_from][msg.sender] -= _value;
            emit Transfer(_from, _to, _value);
            return true;
        } else { return false; }
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

}
