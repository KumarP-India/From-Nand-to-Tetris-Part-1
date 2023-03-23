// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// Row = 512; Column = 256;;  PC = 16bit; Row = 32 PC


        @i
        M=1
(LOOP0)
        @SCREEN
        D=A
        @j
        M=D
        @r
        M=0

        @i
        D=M         //D=i
        @END
        D;JLT       // If i < 0 goto END; infinite loop

        //@SCREEN      // Start of display
        //D=A
        //@j          // @j == @16384
        //A=D

        @KBD        // Keyboard input
        D=M
        @LOOP1
        D;JGT
        @LOOP2
        0;JMP

(LOOP1)
        @j
        D=M
        A=D
        M=-1         // Blacken screen

        @j
        D=M
        @1
        D=D+A
        @j
        M=D
        @r
        M=M+1

        @8192
        D=A
        @r
        D=M-D
        @LOOP0
        D;JGE

        @LOOP1
        0;JMP
(LOOP2)
        @j
        D=M
        A=D
        M=0         // Clear pixels

        @j
        D=M
        @1
        D=D+A
        @j
        M=D
        @r
        M=M+1

        @8192
        D=A
        @r
        D=M-D
        @LOOP0
        D;JGE

        @LOOP2
        0;JMP
(END)
        @END
        0;JMP