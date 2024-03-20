(TEST_PURPOSES)
@R3
D=!M

@R4
D=D&M

@NOT_A_AND_B
M=D


@R4
D=!M

@R3
D=D&M

@A_AND_NOT_B
M=D


@NOT_A_AND_B
D=D|M

@R5
M=D

@TEST_PURPOSES
0;JMP