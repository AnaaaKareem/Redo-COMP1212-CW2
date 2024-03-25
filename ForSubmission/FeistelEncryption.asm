(START)

@R0
D=M
@START
D;JNE

//// Setup masking for rotation ////

// Create 16th bit masker
@16384
D=A
M=D+A

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
@8
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

//// Start Encryption Process ////

// Negate the Key and mask 8 bits on the right
@R1
D=!M
@255
D=D&A
@R1
M=D

@4
M=A

(ENCRYPT)

@4
D=M
@FINISHED_ENCRYPTION
D;JEQ

/// Store Li ///
@R2
D=M
@Li
M=D

/// Create Li+1 ///
@R3
D=M
@R2
M=D

/// Create Function Ri ⊕ ¬Ki ///
@R3
D=!M

@R1
D=D&M

@NOT_Ri_AND_NKi
M=D

@R1
D=!M

@R3
D=D&M

@Ri_AND_NOT_NKi
M=D

@NOT_Ri_AND_NKi
D=D|M

@FUNCTION
M=D

/// Create Ri+1 ///
@Li
D=!M

@FUNCTION
D=D&M

@NOT_Li_AND_FUNCTION
M=D

@FUNCTION
D=!M

@Li
D=D&M

@Li_AND_NOT_FUNCTION
M=D

@NOT_Li_AND_FUNCTION
D=D|M

@R3
M=D

/// Rotate Negated Key ///
// Check for 8th bit 
@128
D=A
@R1
D=D&M
@ROTATE_KEY
D;JNE

// Shift bits
@R1
D=M
M=M+D
@SUBTRACT_COUNTER
0;JMP

// Rotate bits
(ROTATE_KEY)
@R1
D=M+1
M=M+D
// Mask 8 bits on the right
@255
D=A
@R1
M=M&D

(SUBTRACT_COUNTER)
// Subtract from counter
@4
M=M-1
@ENCRYPT
0;JMP

(FINISHED_ENCRYPTION)

//// Shift Right to Left ////

// Set shift counter
@8
M=A

(RIGHT_TO_LEFT)
// Check counter
@8
D=M
@FINISHED_RIGHT_TO_LEFT
D;JEQ

// Shift right half
@R3
D=M
M=M+D

// Subtract from counter
@8
M=M-1

@RIGHT_TO_LEFT
0;JMP

(FINISHED_RIGHT_TO_LEFT)

//// Finish Encryption ////

// Merge two halves and store them in R0
@R2
D=M
@R3
D=D|M
@R0
M=D

// Reset Key
@R0
D=A
@R1
M=D

@START
0;JMP