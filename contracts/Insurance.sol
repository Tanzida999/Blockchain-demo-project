// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Insurance {
    address[] public policyholders;
    mapping(address => uint256) public policies;
    mapping(address => uint256) public claims;
    address payable public owner;
    uint256 public totalPremium;
    uint256 public contractCreationTime;
    uint256 public purchasePolicyTime;
    uint256 public policyClaimTime;
    uint256 public approveClaimTime;
    uint256 public contractDestructionTime;

    event PurchasePolicyEvent(uint256 timestamp);
    event PolicyClaimEvent(uint256 timestamp);
    event ApproveClaimEvent(uint256 timestamp);
    event ContractDestructionEvent(uint256 timestamp);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor() {
        owner = payable(msg.sender);
        contractCreationTime = block.timestamp;
    }

    function purchasePolicy(uint256 premium) public payable {
        purchasePolicyTime = block.timestamp;
        emit PurchasePolicyEvent(purchasePolicyTime);

        require(msg.value == premium, "Incorrect premium amount.");
        require(premium > 0, "Premium amount must be greater than 0.");
        policyholders.push(msg.sender);
        policies[msg.sender] = premium;
        totalPremium += premium;
    }

    function policyClaim(uint256 amount) public {
        policyClaimTime = block.timestamp;
        emit PolicyClaimEvent(policyClaimTime);

        require(policies[msg.sender] > 0, "Must have a valid policy to file a claim.");
        require(amount > 0, "Claim amount must be greater than 0.");
        require(amount <= policies[msg.sender], "Claim amount cannot exceed policy limit.");
        claims[msg.sender] += amount;
    }

    function approveClaim(address policyholder) public onlyOwner {
        approveClaimTime = block.timestamp;
        emit ApproveClaimEvent(approveClaimTime);

        require(claims[policyholder] > 0, "Policyholder has no outstanding claim.");
        payable(policyholder).transfer(claims[policyholder]);
        claims[policyholder] = 0;
    }

    function getPolicy(address policyholder) public view returns (uint256) {
        return policies[policyholder];
    }

    function getClaim(address policyholder) public view returns (uint256) {
        return claims[policyholder];
    }

    function getTotalPremium() public view returns (uint256) {
        return totalPremium;
    }

    function revokeAccess(address payable newOwner) public onlyOwner {
        owner = newOwner;
    }

    function destroy() public onlyOwner {
        contractDestructionTime = block.timestamp;
        emit ContractDestructionEvent(contractDestructionTime);

        require(msg.sender == owner, "Only the owner can destroy the contract");
        selfdestruct(owner);
    }
}
