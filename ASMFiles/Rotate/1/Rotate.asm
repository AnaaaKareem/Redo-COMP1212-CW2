// Create and store the masking bit
@16384
D=A
M=D+A

// Store the value from R3 to R5
(ANOTHER)
@R3
D=M
@R5
M=D

(ROTATE)
// Cheack for the counter
@R4
D=M
@FINISHED
D;JEQ

// Check the 16th bit on the left
@16384
D=M
@R5
D=D&M
// If bit is 1 rotate
@ROTATE_BITS
D;JNE

// Perform a bit shift operation
@R5
D=M
M=M+D
@SUBTRACT_COUNTER
0;JMP

// Perform a bit rotation operation
(ROTATE_BITS)
@R5
D=M+1
M=M+D

// Subtract from the counter
(SUBTRACT_COUNTER)
@R4
M=M-1
@ROTATE
0;JMP

(FINISHED)
// Check if a new value is loaded
@R5
D=M
@ANOTHER
D;JEQ
@ROTATE
0;JMP