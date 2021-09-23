var Pearlzzfixedsupply = artifacts.require("../contracts/pearlzz.sol")
//const _testPearlzzToken = artifacts.require('Pearlzztoken');


module.exports = function (deployer){
  deployer.deploy(Pearlzzfixedsupply);
}

/*
module.exports = async function(deployer){
    await deployer.deploy(_testPearlzzToken);
}

  
  // Deploy Mock Tether Token
  await deployer.deploy(_testPearlzzToken)
  const _pearlzz = await _testPearlzzToken.deployed()
*/