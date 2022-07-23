PIGGY BANK FOR 2 TWINS THAT WILL BE ABLE TO BE OPENED AFTER 5 YEARS AND ONLY IF BOTH OF THEM AGREE TO OPEN IT 

-> function that initiates the piggybank and allows the parents to add money to it (ponly one parent)
-> show how much money does the piggybank have only if you are the parent 
-> make the piggybank available only after 5 years (it started when the kids were 15)
-> open the piggybank and distribute the money to the kids only if they both agree to it 


//////////
1 contract upon initialization: after 5 years of its creation it will create/enable the other contracts (this contract will be responsible for deposit and withdrawal)
1 for kid one to accept (save the sender's address and compare it to what the parents have set if not the same the contract cannot be fulfilled)
1 for kid 2 to accept (save the sender's address and compare it to what the parents have set if not the same the contract cannot be fulfilled)
//////////





store the amount of funds each user added and the users address 
check if the user has put already funds and if so just up the index value without adding a new user index


 
table with 3 rows example


user.address|	user.index|	funds.amount|
0x23984		1		123
		2		123123
0x53453		1		1235
0x45364		1		2345						

	

struct Funds{
	address user.address;
	uint256 user.index;
	uint256 funds.amount;
}
Funds[] public funds;


//make a view function that searches if the address exists in the table 
function addressKey(address msg.sender) public view returns(bool){
	for (uint i = 0; i < address.length; i++
		return true 
	)


}


//if user address is the same with msg.sender make key true 





if key is true get push user.index and add dunds.amount data
if key is false push user.address and initialize user.index and add funds.amount









retrieve elements from the array depenting on the user.address or user.id

function getDataWithId(uint256 _id) public view returns {
	return user[_id].[];

}





























