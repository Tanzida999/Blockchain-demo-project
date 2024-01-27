// 5_HealthInsuranceContract.js
const HealthInsuranceContract = artifacts.require("HealthInsuranceContract.sol");

module.exports = function(deployer) {
  // Replace '0x3A7E227257F6Fa957d668D232B55e42178B627C6' with the actual address of the hospital
  deployer.deploy(HealthInsuranceContract, '0x3A7E227257F6Fa957d668D232B55e42178B627C6');
};
