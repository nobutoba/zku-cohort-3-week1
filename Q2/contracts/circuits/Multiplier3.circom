pragma circom 2.0.0;

// [assignment] Modify the circuit below to perform a multiplication of three signals

// Copied from HelloWorld.circom.
// The file cannot be included here like
//    `include "./HelloWorld.circom"`
// because it results in
//    error[P1002]: Multiple main components in the project structure
template Multiplier2 () {

   // Declaration of signals.
   signal input a;
   signal input b;
   signal output c;

   // Constraints.
   c <== a * b;
}

template Multiplier3 () {

   // Declaration of signals.
   signal input a;
   signal input b;
   signal input c;
   signal output d;

   // Declaration of components.
   component mult1 = Multiplier2();
   component mult2 = Multiplier2();

   // Step 1: Multiply a and b
   mult1.a <== a;
   mult1.b <== b;

   // Step 2: Multiply (a * b) and c
   mult2.a <== mult1.c;
   mult2.b <== c;
   d <== mult2.c;
}

component main = Multiplier3();
