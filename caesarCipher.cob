       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAESAR-CIPHER.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
         01 inputstring PIC A(10) VALUE "HelloWorld".
         01 ciphered PIC A(10) VALUE "HelloWorld".
         01 deciphered PIC A(10) VALUE "HelloWorld".
         01 k PIC 99 VALUE 4.
         01 i PIC 99 VALUE 1.
         01 i2 PIC 99 VALUE 1.
         01 n PIC 99.
         01 temp PIC A(1).
         01 aKey PIC 999.
         01 head PIC 999.
               
       PROCEDURE DIVISION.

       begin.

           MOVE FUNCTION LENGTH(inputstring) TO n.
        
           PERFORM encrypt WITH TEST AFTER UNTIL i > n.
           DISPLAY "Encrypt: " inputstring " => " ciphered.
        
           MOVE 1 TO i.
           MOVE ciphered TO inputstring.
           COMPUTE k = (26 - k).
           PERFORM encrypt WITH TEST AFTER UNTIL i > n.
           MOVE ciphered TO deciphered.
           DISPLAY "Decrypt: " inputstring  " => " deciphered.
    
           DISPLAY "Solve : ".
           MOVE 1 TO k.
           PERFORM solve WITH TEST AFTER UNTIL i2 > 26.
    
           STOP RUN.
   
       encrypt.
            
           IF k > 26 THEN
              MOVE FUNCTION MOD(k, 26) TO k.
           
           MOVE FUNCTION ORD(ciphered(i:1)) TO aKey.

           IF aKey > 91 THEN
               MOVE 98 TO head
           ELSE
               MOVE 66 TO head
           END-IF.
           
           COMPUTE aKey = (aKey + k - head).
           MOVE FUNCTION MOD(aKey, 26) TO aKey.
           ADD head TO aKey.

           MOVE FUNCTION CHAR(aKey) TO ciphered(i:1).
        
           ADD 1 TO i.

       solve.

           MOVE 1 TO i.
           PERFORM encrypt WITH TEST AFTER UNTIL i > n.
      
           DISPLAY i2 " " inputstring.
           ADD 1 TO i2.

       END PROGRAM CAESAR-CIPHER.         