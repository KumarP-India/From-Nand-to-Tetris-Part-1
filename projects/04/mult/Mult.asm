// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.


        // This block of code is not necessary at all, but when I run the tst script in CPU emulator, It just checks the R2 register whose value is not 0 from first iteration.

        // Block starts here

        @R2

        M = 0

        // BLock ends here.


        @R0 // Aessing the Register 0

        D = M // Coping the Register 0 data into the Data register


        @num // Creating the new reference to empty register

        M = D // Coping the value from Data register to selected empty Register



        @val // To store computed values

        M = D // val = num




        // Doing same for the second number: multiplier - multiplier; from Register R1

        @R1

        D = M


        @mul

        M = D









// This is the section where addition loop is done
(LOOP)

        @mul // We acess the second value in multiplication

        // We will check the value and if it <= 1, we will stop.
        // We do this to ensure x*1 gives same result as x

        D = M // For Jumping A register needs to refer to STOP section so we save value to Data register

        


        @STOP // Address to jump loaction if Data register - 1 equals to 0


        D - 1; JLE // First part yield D - 1 and second part compares D - 1 to 0 for equality.






        // If not D - 1 equals to 0, Addtion is done and mul is decresed by 1.

        // Addtion
        @num // Acessing the value for our var num, this stores the intial value of Register 0.

        D = M // Storing in Data Register for addition to val variable


        @val // Acessing the value of var val, this stores the previous computed value

        M = D + M // Seting the the computed value to var. val

        

        // Decresement
        @mul

        M = M - 1





        @LOOP // This is to jump back to the start of the loop; Acessing the Address of the LOOP section

        0; JMP // Unconditional jump









// This is where mulplication by 0 is done
(ZERO)

        @val // Acessing the val variable

        M = 0 // Seting the value of the val register to 0 for output as x*0 = 0



        @mul // Acessing the mul variable

        M = 1 // And Seting to 1 so we don't do ZERO loop infinitely



        @STOP // To go back, acessing the Address of STOP

        0; JMP // Unconditional jump



// This section runs after the loop. If the multiplication is by 0, then we output the result from ZERO
(STOP)

        @mul // First we call the multiplier to check if we have 0 or 1.

        D = M // This is to store the mul value in Data register for comparision.


        @ZERO // Acessing the address of ZERO to jump there if comparion yields true.

        D; JEQ // Comparing the Data register to 0, and jumping to ZERO, if true.





        @val // Acessing the computed value

        D = M // Coping the computed value into Data register

        @R2 // Acessing the Destination Register, ie. R2

        M = D // Coping the computed value from Data register to Destination Register.









// Ending loop
(END)

        @END

        0; JMP // Unconditional JMP










