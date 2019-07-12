//Write a smart contract that will take in an address and 
//a corresponding value that is assumed to be the amount of ethers stored at that address. 
//Create a function, that would return the address with maximum ethers in it.

pragma solidity ^0.5.0;

contract FindMax{
    
    mapping (address => int) addrmap;
    address[] public addr;
    
    function add(address adr, int value) public {
            if(addrmap[adr] > 0){
                addrmap[adr] += value;
            }
            else {
                addrmap[adr] = value;
                addr.push(adr);
            }
    }
    
    function findmax(address adr, int value) public returns(address){
        add(adr, value);
        uint len = addr.length;
        int max = 0;
        address maxAddr;
        for (uint i = 0; i < len; i++){
            if(addrmap[addr[i]] > max){
                max = addrmap[addr[i]];
                maxAddr = addr[i];
            }
        }
        return maxAddr;
    }
    
}
