// This file is adapted from www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/mult/Mult.tst

load FeistelEncryption.asm,
output-file FeistelEncrytion.out,
compare-to FeistelEncryption.cmp,
output-list RAM[0]%D2.6.2;

set RAM[0] 0,   // Set test arguments
set RAM[1] 0,
set RAM[2] 0;
repeat 1000 {
  ticktock;
}
output;

set RAM[0] 0,   // Set test arguments
set RAM[1] 204,
set RAM[2] 54703;
repeat 1000 {
  ticktock;
}
output;

set RAM[0] 0,   // Set test arguments
set RAM[1] 213,
set RAM[2] 47986;
repeat 1000 {
  ticktock;
}
output;