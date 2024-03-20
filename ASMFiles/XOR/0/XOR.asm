(TEST_PURPOSES)
@R3
D=M

@R4
D=D|M

@A_OR_B
M=D

@R3
D=M

@R4
D=D&M

@NOT_A_AND_B
M=!D

@A_OR_B
D=M

@NOT_A_AND_B
D=D&M

@R5
M=D

@TEST_PURPOSES
0;JMP