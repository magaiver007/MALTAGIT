// SPDX-License-Identifier: MIT

/* Smart contract that lets anyone deposit coins into the contract
    Only 2 specific addresses can withdraw the coins and only if both
    agree to do so 
*/

pragma solidity >=0.6.6 <0.9.0;


contract piggybank{

    //initialize agreement clauses
	//upon initialization the agreemnts are false by default
    bool agreement;
    bool a;
    bool b;
    uint256 _timenow;
    uint deploymentTime;
    uint256 withdrawalDate;
    
	
	constructor(){
        agreement = false;
		a = false;
		b = false;
        deploymentTime = block.timestamp;
    }

    //initialize struct childrenAddresses
    struct ChildrenAddresses {
        string name ;
        address childaddress;
    }
    ChildrenAddresses[] public childrenAddresses;

    //function with which the parents record the children's addresses that will be used to withdraw the funds 
    function addAddress(string memory _name, address _childaddress) public {
        childrenAddresses.push (ChildrenAddresses(_name,_childaddress));
        
    }

	
	//functions that with the input of the user become true 
	//each function costs gas fees
    //each function can become true after 5 years (the time that the kids must wait until thwy can withdraw the funds)
    function userone()public {
        require (block.timestamp >= deploymentTime + 157788000, "it's not the time yet");
        a = true;
    }

    function usertwo()public {
        require (block.timestamp >= deploymentTime + 157788000, "it's not the time yet");
        b = true;
    }

    //make agreement true only if both children are ready  
    function makeAgreementTrue()public{
        require (a == true, "The first child is not ready yet");
        require (b == true, "The second child is not ready yet");
        agreement = true ;
    }

    //initialization of the contributors array
	struct Contributors{
		address contributor;
		uint256 amount;
	}
	
    Contributors[] public contributors;
    
    //map which connects the address with the amount deposited
    mapping(address => uint256) public nameToAmount;

    //connects the amount with the sender and adds sender address to the list 
    function addFunds() public payable {
       contributors.push(Contributors(msg.sender, msg.value)); 
       nameToAmount[msg.sender] += msg.value;
    }

    
    function withdrawFunds() public payable {
        require (agreement == true,"Get your shit together");
        

    }


      
    /*
    function withdrawFunds() public payable{


    }
    */
    //////////////////////////////////////////////////
    /////////////////DEBUGGING SECTION/////////////////
    //////////////////////////////////////////////////
    //output functions (made for debugging)
    function outputa() public view returns(bool) {
        return a;
    }
    function outputb() public view returns(bool) {
        return b;
    }
    function outputagreement() public view returns(bool) {
        return agreement;
    }
    function timeOfDeployment() public view returns (uint){
        return deploymentTime;
    }
    //debugging function dont mind it 
    function clear() public {
        a = false;
        b = false;
        agreement = false;
    }

    function isnikoshere(string _childsname) public view returns (address){
        return ChildrenAddresses(address(childrenAddresses[_childsname])).retrieve;


    }
    



}