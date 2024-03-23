(TEST_PURPOSES)
// Load First Value
@R3
D=M

// Use OR operation for the first and second value
@R4
D=D|M

// Store the value of the OR operation
@A_OR_B
M=D

// Load the first value again
@R3
D=M

// Use AND operation for the first and second value
@R4
D=D&M

// Use the negation for the NAND gate and store the value
@NOT_A_AND_B
M=!D

// Load The OR value of the first and second value
@A_OR_B
D=M

// Load the NAND value and use the AND operation with the OR operation
@NOT_A_AND_B
D=D&M

// Store the final value in R5
@R5
M=D

// Get back to the start for testing purposes
@TEST_PURPOSES
0;JMP