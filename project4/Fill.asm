// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.


@i  //initialize counter
M=0 

(START)
@24576 //listen for keyboard
D=M
@WHITE //if no keyboard pressing, RAM[24576] would be 0，white every pixel
D;JEQ
@BLACK //else black every pixel
0;JMP


(BLACK)
@i
D=M
@SCREEN
A=A+D
M=-1     //black the word(16 pixels) i place away from the left,upmost pixel

@i
D=M
@8191
D=D-A
@START
D;JEQ   //if i-8191=0, every pixel on the screen is black, jump back to start
@i
M=M+1
@BLACK
0;JMP   //else increment counter and keep black other pixels


(WHITE)
@i
D=M
@SCREEN
A=A+D
M=0     //white the word(16 pixels) i place away from the right,downmost black pixel

@i
D=M
@START
D;JEQ   //if i=0, every pixel on the screen is white, jump back to start
@i
M=M-1  
@WHITE
0;JMP   //else decrement counter and keep white other pixels

