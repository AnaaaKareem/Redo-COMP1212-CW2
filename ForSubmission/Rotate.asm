// Create and store the masking bit
@16384
D=A
M=D+A

(LOOP)
// Cheack for the counter
@R4
D=M
@FINISHED
D;JEQ

// Check the 16th bit on the left
@16384
D=M
@R3
D=D&M
// If bit is 1 rotate
@ROTATE_BITS
D;JNE

// Perform a bit shift operation
@R3
D=M
M=M+D
@SUBTRACT_COUNTER
0;JMP

// Perform a bit rotation operation
(ROTATE_BITS)
@R3
D=M+1
M=M+D

// Subtract from the counter
(SUBTRACT_COUNTER)
@R4
M=M-1
@LOOP
0;JMP

// Store the final value in R5
(FINISHED)
@R3
D=M
@R5
M=D
// Jump back to the beginning
@LOOP
0;JMP