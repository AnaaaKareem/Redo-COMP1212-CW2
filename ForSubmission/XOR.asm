(TEST_PURPOSES)

// Load the negated first value
@R3
D=!M

// Use AND operation with the second value
@R4
D=D&M

// Store the AND value
@NOT_A_AND_B
M=D

// Load the negated second value
@R4
D=!M

// Use AND operation with the first value
@R3
D=D&M

// Store the AND value
@A_AND_NOT_B
M=D

// Use the OR operation 
@NOT_A_AND_B
D=D|M

// Store the final value in R5
@R5
M=D

// Get back to the start for testing purposes
@TEST_PURPOSES
0;JMP