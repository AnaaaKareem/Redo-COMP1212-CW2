// This file is adapted from www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/mult/Mult.tst

load Rotate.asm,
output-file Rotate.out,
compare-to Rotate.cmp,
output-list RAM[5]%D2.6.2;

set RAM[3] -28968,   // Set test arguments tests a rotate MSB 0
set RAM[4] 4,
set RAM[5] 0,
repeat 600 {
  ticktock;
}
output;

set RAM[3] -28968,   // Set test arguments tests a rotate MSB 0
set RAM[4] 16,
set RAM[5] 0,
repeat 600 {
  ticktock;
}
output;

set RAM[3] -28968,   // Set test arguments tests a rotate MSB 0
set RAM[4] 1,
set RAM[5] 0,
repeat 600 {
  ticktock;
}
output;