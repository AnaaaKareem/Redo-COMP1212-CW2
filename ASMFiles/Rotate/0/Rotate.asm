// Create and store the masking bit
@16384
D=A
M=D+A

(ROTATE)
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
// If bit is 0 shift
@SHIFT_BITS
D;JEQ

// Perform a bit rotation operation
@R3
D=M+1
M=M+D
@SUBTRACT_COUNTER
0;JMP

// Perform a bit shift operation
(SHIFT_BITS)
@R3
D=M
M=M+D

// Subtract from the counter
(SUBTRACT_COUNTER)
@R4
M=M-1
@ROTATE
0;JMP

// Store the final value in R5
(FINISHED)
@R3
D=M
@R5
M=D
// Jump back to the beginning
@ROTATE
0;JMP