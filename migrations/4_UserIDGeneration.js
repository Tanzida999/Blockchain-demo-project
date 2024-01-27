const UserIDGeneration = artifacts.require("UserIDGeneration.sol");

module.exports = function(deployer) {
  deployer.deploy(UserIDGeneration);
};
