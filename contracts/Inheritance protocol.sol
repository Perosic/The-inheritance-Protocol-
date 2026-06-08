// SDPX-Lincense-indetifier : MIT
pragma solidity ^0.8.13;
// Contract WRITING ORDER 
// 1 STATE VARIABLES 
// 2 EVENTS 
// 3 CONSTRUCTOR
// 4 MODIFIERS
// 5 FUNCTIONS


contract DeadManInheritance {
    // STATE VARIABLES FIRST 
    // Owners Address 
    // beneficiary adress 
    // Balance of Contract ETH
    // last check in interval 
    // check in interval 


    address public owner;
    uint256 public LastCheckIn;
    uint256 public CheckInInterval;
    uint256 public TotalShares;
    mapping (address => uint256 ) public beneficiaryShares;
    address [] public beneficiaryList;


    // ADD YOUR EVENTS TO MAKE THE FUNCTIONS READABLE AND SEARCHABLE 

    event checkedin (address indexed owner, uint256 timestamp);
    event Deposit (address indexed depositor, uint256 Amount);
    event addBeneficiary (address indexed beneficiary, uint256 beneficiaryShare);
    event removeBeneficiary (address indexed beneficiary);
    event withdrawl (address indexed beneficiary, uint256 withdrawnAmoun);
    event updatebeneficiaryshares (address indexed beneficiary, uint256 NewShare);
    event EmergencyWithdrawal  (address indexed Owner, uint256 amount);


    // ADD YOUR CONSTRUCTOR SO YOU CAN DEPLOY THE IMPORTANT STATE VARIABLES ONCE . 


    constructor (uint256 _checkInInterval){
        owner = msg.sender;
        LastCheckIn =block.timestamp;
        CheckInInterval = _checkInInterval;
        TotalShares= 0;
    }


    // MODIFIERS
    modifier TheOwner() {
        if (msg.sender!= owner)
        revert ("oga no be your contract"); 
        _;
    }
    modifier TheBeneficiary() {
        require (beneficiaryShares [msg.sender] >0, "Your Share nah 0% so no be your inheritance, fit be say dem no rate you ");
        _;
    }
    
    // FUNCTIONS
   // fomular = function name () visibility payable modifier 
   // then Check, Effect, interactions, and events 
   function MakADeposit () external payable TheOwner {
    if (block.timestamp > LastCheckIn + CheckInInterval) 
    revert ("Your Check in Time don expored so you're presumed kpaied , you can't deposit cause dead man no fit call this function ");
    if(msg.value < 0 ether)
    revert ("This money too small for inheritance funds ,play your life well and come back");
    // INTERACTIONS/EVENTS 
    emit Deposit(msg.sender, msg.value );
   }
   // CHECK
   function EmergencyWithdraw (uint256 amount ) external TheBeneficiary {
    if (block.timestamp > LastCheckIn + CheckInInterval)
    revert ("The inheritance still dey active, everywhere dey cool");
    if(amount >address(this).balance)
    revert ("insufficient funds");
    // INTERACTIONS /EVENT
    (bool success, ) = payable(owner).call{value: amount}("");
    if (!success)
    revert ("Emergency withdrawal failed");
    emit EmergencyWithdrawal (owner, amount);
   }


  // formula= function name () viability look, mmm p kk
   function Checkin () external TheOwner{
    require (block.timestamp < LastCheckIn + CheckInInterval, "Be like say you don die as check in time don passingly");
    // Effect to update the stete variable Timer 
    LastCheckIn = block.timestamp;
    // interactions and Event 
    emit checkedin (msg.sender, block.timestamp);
   }


   function AddBeneficiary (address _beneficiary, uint256 _beneficiaryShare) external TheOwner{
    //CHECKS 
    if (_beneficiary == address (0))
    revert ("Abeg this nah Burn wallet address you wan make your morney disappear??");
    if (_beneficiaryShare == 0)
    revert ("No Add beneficiary wey no get allocation from your inheritance abeg");
    if (_beneficiary == address (this))
    revert ("oga How wan take inherit your own contract, em sharp ???");
    if (beneficiaryShares[_beneficiary] > 0)
        revert("This address is already a beneficiary");
    if (TotalShares + _beneficiaryShare > 100)
    revert ("Share no suppose pass 100% we no go fit give Wetin we no get");
    // EFFECTS
    beneficiaryShares[_beneficiary] = _beneficiaryShare;
    beneficiaryList.push (_beneficiary);
    TotalShares += _beneficiaryShare;
    // INTERACTIONS/EVENT 
    emit addBeneficiary(_beneficiary, _beneficiaryShare);
   }


   function RemoveBeneficiary (address _beneficiary) external TheOwner{
    // CHECK
    if (beneficiaryShares[_beneficiary]== 0)
    revert ("This address no be benefactor oooh");
    // EFFECTS 
    TotalShares -= beneficiaryShares[_beneficiary];
    beneficiaryShares[_beneficiary] = 0;
    // Remove user from Array list with a For loop
    for (uint256 i =0;  i < beneficiaryList.length; i++) {
        if(beneficiaryList[i] == _beneficiary){
            beneficiaryList[i] = beneficiaryList [beneficiaryList.length - 1] ;
            beneficiaryList.pop();
            break;
        }
    }
    // INTERACTIONS/EMIT
    emit removeBeneficiary (_beneficiary);
   }

   function UpdateShare (address _beneficiary, uint256 _newShare ) external TheOwner {
    // CHECKS 
    if (beneficiaryShares [_beneficiary]==0)
    revert ("This adddress no be benefactor");
    if (_newShare ==0 )
    revert ("This Benefactor no get share ");
    if (TotalShares - beneficiaryShares [_beneficiary] + _newShare > 100)
    revert ("Total share no fit pass 100");
    // EFFECTS 
    TotalShares = TotalShares - beneficiaryShares[_beneficiary] + _newShare;
    beneficiaryShares[_beneficiary] = _newShare;
    // INTERACTIONS/ EMIT
    emit updatebeneficiaryshares(_beneficiary , _newShare);
   }


   function Withdraw () external TheBeneficiary {
    // CHECKs
    require (block.timestamp >LastCheckIn +CheckInInterval, "Owner of the contract still dey Alive nothing for you to inherit" );
    require (address(this).balance >0 ,"No funds to be inherited ");
    // EFECTS 
    uint256 Share = beneficiaryShares [msg.sender];
    beneficiaryShares[msg.sender] =0;
    uint256 amount = (address(this).balance * Share) /100 ;
    // INTERACTIONS AND EVENTS 
    (bool success,) = payable (msg.sender).call {value: amount} ("");
    if (!success)
    revert ("Your withdrawal don fail");
    emit withdrawl (msg.sender, amount);
   }


   // Getter functions to get the Balance of the adress and check in time 


   function GetTimeLeft () external view returns (uint256 ) {
    if(block.timestamp >= LastCheckIn + CheckInInterval ) {
        return 0;
    }
    return (LastCheckIn + CheckInInterval) - block.timestamp;
   }
 
 function GetBalance() external view returns (uint256){
    return address(this).balance;
 }     
    }

















