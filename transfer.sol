pragma solidity ^0.4.0;
contract erc20
{
    address  owner;

    string public name;
    string public symbol;
    uint256 public totalSupply;
    mapping(address=>uint256)balance;
    mapping(address=>mapping(address=>uint256))allowed;
    function erc20()
    {
        owner=msg.sender;
        name="dharani";
        symbol="$";
        totalSupply=1000;
        owner=msg.sender;
          balance[owner]=totalSupply;
    }
    function mint(uint amt) public 
          {
              require((balance[owner]+amt)<totalSupply);
              balance[owner]+=amt;
           
          }
  
     function transfer(address to,uint256 amt)public returns(uint256,uint256)
    {
        balance[owner]-=amt;
        balance[to]+=amt;
        return(balance[owner],balance[to]);
    }
    
    function approval(address from,uint token)public  returns(uint)
          {
                    allowed[from][owner]=token;
          } 
           function allowance(address from)public view  returns(uint remain)
          {
              return allowed[from][owner];
          }
     function transferfrom(address from,address to,uint token)public  returns(uint,uint)
      {
        if(balance[from] >=token && token > 0 && allowed[from][to] >= token)
        {
             
          balance[from]=balance[owner]-token;
           balance[to]=balance[to]+token;
          allowed[from][owner]=allowed[from][owner]-token;
         
          return  (balance[from], balance[to]);
        }
       }
}
