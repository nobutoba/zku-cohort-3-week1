pragma circom 2.0.0;

include "../../node_modules/circomlib/circuits/comparators.circom";

template RangeProof(n) {
    assert(n <= 252);
    signal input in; // this is the number to be proved inside the range
    signal input range[2]; // the two elements should be the range, i.e. [lower bound, upper bound]
    signal output out;

    component low = LessEqThan(n);
    component high = GreaterEqThan(n);

    // [assignment] insert your code here

    // Range validity check.
    component validRange = LessEqThan(n);
    validRange.in[0] <== range[0];
    validRange.in[1] <== range[1];
    validRange.out === 1;

    // We check whether `range[0]` is `LessEqThan` (i.e. greater than or equal to) `in`.
    low.in[0] <== range[0];
    low.in[1] <== in;
    // We check whether `range[1]` is `GreaterEqThan` (i.e. less than or equal to) `in`.
    high.in[0] <== range[1];
    high.in[1] <== in;

    // `out` is 1 if `in` lies within the range [lower bound, upper bound],
    // i.e. if `range[0] <= in` and `range[1] >= in`.
    // `out` is 0 otherwise.
    out <== low.out * high.out;
}
