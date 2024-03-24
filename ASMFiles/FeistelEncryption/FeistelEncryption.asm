(START)

//// Setup masking for rotation ////

// Create 16th bit masker
@16384
D=A
M=D+A

// Create 8th bit masker
@128
M=A

//// Split the value stored in RAM[2] ////

/// Mask Right 8 bits ///
// Load the right 8 bits mask
@255
D=A

// Load the value and Use AND for masking
@R2
D=D&M

// Store the mask in R3
@R3
M=D

/// Mask Left 8 bits ///
// Create the left 8 bit mask
@32640
D=A
D=D+A

// Load the value and Use AND for masking
@R2
M=D&M

//// Rotate the left half to the right to perform operations ////

// Create Counter for rotation
@8
M=A

(LEFT_TO_RIGHT)
// Check if counter is zero
@R8
D=M
@FINISHED_LEFT_TO_RIGHT
D;JEQ

// Make 16th bit to check for possible rotation
@16384
D=M
@R2
D=D&M
// If bit exists rotate
@ROTATE_LEFT_TO_RIGHT
D;JNE

// Perform a bit shift operation
@R2
D=M
M=M+D
@SUBTRACT_LEFT_TO_RIGHT_COUNTER
0;JMP

// Perform a bit rotation operation
(ROTATE_LEFT_TO_RIGHT)
@R2
D=M+1
M=M+D

// Subtract from the counter
(SUBTRACT_LEFT_TO_RIGHT_COUNTER)
@8
M=M-1
@LEFT_TO_RIGHT
0;JMP
(FINISHED_LEFT_TO_RIGHT)
