// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract HealthInsuranceContract {
    address public insuranceCompany;
    address public hospital;
    bool public userVerificationStatus;
    bool public dataUploaded;

    mapping(uint256 => bool) public patientDataUploaded;

    modifier onlyInsuranceCompany() {
        require(msg.sender == insuranceCompany, "Only the insurance company can call this function");
        _;
    }

    modifier onlyHospital() {
        require(msg.sender == hospital, "Only the hospital can call this function");
        _;
    }

    modifier userVerified() {
        require(userVerificationStatus, "User is not verified with the hospital");
        _;
    }

    modifier dataNotUploaded(uint256 _patientId) {
        require(!patientDataUploaded[_patientId], "Data has already been uploaded for this patient");
        _;
    }

    constructor(address _hospital) {
        insuranceCompany = msg.sender;
        hospital = _hospital;
    }

    function verifyUser() external onlyInsuranceCompany {
        // Add logic to verify user with the hospital
        // For example, you can use an oracle or an off-chain process for this
        userVerificationStatus = true;
    }

    function uploadData(uint256 _patientId) external onlyHospital userVerified dataNotUploaded(_patientId) {
        // Add logic to upload encrypted patient information to the blockchain
        // For simplicity, I'm using a boolean variable to represent data upload success
        patientDataUploaded[_patientId] = true;
    }

    function checkDataUploadStatus(uint256 _patientId) external view returns (string memory) {
        if (patientDataUploaded[_patientId]) {
            return "Data is uploaded successfully";
        } else {
            return "Failed to upload data";
        }
    }
}


