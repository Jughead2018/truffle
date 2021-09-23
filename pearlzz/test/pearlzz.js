const pearlzz = artifacts.require("pearlzz");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("pearlzz", function (/* accounts */) {
  it("should assert true", async function () {
    await pearlzz.deployed();
    return assert.isTrue(true);
  });
});
