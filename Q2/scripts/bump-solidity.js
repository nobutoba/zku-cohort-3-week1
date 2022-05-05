const fs = require("fs");
const solidityRegex = /pragma solidity \^\d+\.\d+\.\d+/

const verifierRegex = /contract Verifier/

// HelloWorldVerifier.sol
let content = fs.readFileSync("./contracts/HelloWorldVerifier.sol", { encoding: 'utf-8' });
let bumped = content.replace(solidityRegex, 'pragma solidity ^0.8.0');
bumped = bumped.replace(verifierRegex, 'contract HelloWorldVerifier');

fs.writeFileSync("./contracts/HelloWorldVerifier.sol", bumped);

// [assignment] add your own scripts below to modify the other verifier contracts you will build during the assignment

// Multiplier3Verifier.sol for Groth16
let contentGroth16 = fs.readFileSync("./contracts/Multiplier3Verifier.sol", { encoding: 'utf-8' });
let bumpedGroth16 = contentGroth16.replace(solidityRegex, 'pragma solidity ^0.8.0');
bumpedGroth16 = bumpedGroth16.replace(verifierRegex, 'contract Groth16Verifier');

fs.writeFileSync("./contracts/Multiplier3Verifier.sol", bumpedGroth16);

// No need to modify _plonkMultiplier3Verifier.sol for PLONK
