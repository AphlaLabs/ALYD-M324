DECLARE SUB GenerateWheel (wheel%(), length%, seed!)
DECLARE SUB BitPackWheels (W1() AS INTEGER, P1 AS INTEGER, W2() AS INTEGER, P2 AS INTEGER, W3() AS INTEGER, P3 AS INTEGER, W4() AS INTEGER, P4 AS INTEGER, W5() AS INTEGER, P5 AS INTEGER, W6() AS INTEGER, P6 AS INTEGER, W7() AS INTEGER, P7 AS INTEGER, W8() AS INTEGER, P8 AS INTEGER, result%)
DECLARE SUB AdvanceWheel (wpos AS INTEGER, maxindex AS INTEGER)
DECLARE SUB printarr (Array() AS INTEGER)
DECLARE SUB manual ()


' Define Motor Wheels
DIM M1Wheel(58) AS INTEGER
DIM m2wheel(40) AS INTEGER
DIM m3wheel(46) AS INTEGER
DIM m4wheel(36) AS INTEGER

' Define Alpha Wheels
DIM A1Wheel(10) AS INTEGER
DIM A2Wheel(12) AS INTEGER
DIM A3Wheel(16) AS INTEGER
DIM A4Wheel(18) AS INTEGER
DIM A5Wheel(22) AS INTEGER
DIM A6Wheel(28) AS INTEGER
DIM A7Wheel(30) AS INTEGER
DIM A8Wheel(36) AS INTEGER

' Define Beta Wheels
DIM b1Wheel(40) AS INTEGER
DIM b2Wheel(42) AS INTEGER
DIM b3Wheel(46) AS INTEGER
DIM b4Wheel(52) AS INTEGER
DIM b5Wheel(58) AS INTEGER
DIM b6Wheel(60) AS INTEGER
DIM b7Wheel(16) AS INTEGER
DIM b8Wheel(28) AS INTEGER

' Define Gamma Wheels
DIM y1Wheel(12) AS INTEGER
DIM y2Wheel(18) AS INTEGER
DIM y3Wheel(22) AS INTEGER
DIM y4Wheel(30) AS INTEGER
DIM y5Wheel(36) AS INTEGER
DIM y6Wheel(40) AS INTEGER
DIM y7Wheel(42) AS INTEGER
DIM y8Wheel(46) AS INTEGER

' Define Delta Wheels
DIM d1wheel(10) AS INTEGER
DIM d2wheel(16) AS INTEGER
DIM d3wheel(18) AS INTEGER
DIM d4wheel(28) AS INTEGER
DIM d5wheel(30) AS INTEGER
DIM d6wheel(36) AS INTEGER
DIM d7wheel(52) AS INTEGER
DIM d8wheel(58) AS INTEGER

M1pos% = 0
A1pos% = 0
A2pos% = 0
A3pos% = 0
A4pos% = 0
A5pos% = 0
A6pos% = 0
A7pos% = 0
A8pos% = 0

m2pos% = 0
b1pos% = 0
b2pos% = 0
b3pos% = 0
b4pos% = 0
b5pos% = 0
b6pos% = 0
b7pos% = 0
b8pos% = 0

m3pos% = 0
y1pos% = 0
y2pos% = 0
y3pos% = 0
y4pos% = 0
y5pos% = 0
y6pos% = 0
y7pos% = 0
y8pos% = 0

m4pos% = 0
d1pos% = 0
d2pos% = 0
d3pos% = 0
d4pos% = 0
d5pos% = 0
d6pos% = 0
d7pos% = 0
d8pos% = 0

DIM spmessage(1499) AS INTEGER
DIM enmessage(1499) AS INTEGER
DIM decimessage$
DIM ogmessage$
DIM encipherlen AS INTEGER

SCREEN 0

spacer% = (80 - 38) \ 2

' Ask for Seed
CLS
PRINT ""
PRINT SPACE$(spacer%); "ษออออออออออออออออออออออออออออออออออออป"
PRINT SPACE$(spacer%); "บ WELCOME TO THE                     บ"
PRINT SPACE$(spacer%); "บ ALPHA LABS GAMMA DIVISION M324     บ"
PRINT SPACE$(spacer%); "ศออออออออออออออออออออออออออออออออออออผ"
PRINT ""
PRINT "The M324 program is a digital adapation of ALMD's M324 Enciphering machine."
PRINT "To view a manual press M, to continue press any other key."
DO
        key$ = INKEY$
        IF key$ = "m" OR key$ = "M" THEN CALL manual
        IF key$ = "x" OR key$ = "X" THEN END
        IF key$ <> "" THEN EXIT DO
LOOP

INPUT "Enter seed #: ", userSeed!

CALL GenerateWheel(M1Wheel(), 59, userSeed!)
CALL GenerateWheel(A1Wheel(), 11, userSeed!)
CALL GenerateWheel(A2Wheel(), 13, userSeed!)
CALL GenerateWheel(A3Wheel(), 17, userSeed!)
CALL GenerateWheel(A4Wheel(), 19, userSeed!)
CALL GenerateWheel(A5Wheel(), 23, userSeed!)
CALL GenerateWheel(A6Wheel(), 29, userSeed!)
CALL GenerateWheel(A7Wheel(), 31, userSeed!)
CALL GenerateWheel(A8Wheel(), 37, userSeed!)

CALL GenerateWheel(m2wheel(), 41, userSeed!)
CALL GenerateWheel(b1Wheel(), 41, userSeed!)
CALL GenerateWheel(b2Wheel(), 43, userSeed!)
CALL GenerateWheel(b3Wheel(), 47, userSeed!)
CALL GenerateWheel(b4Wheel(), 53, userSeed!)
CALL GenerateWheel(b5Wheel(), 59, userSeed!)
CALL GenerateWheel(b6Wheel(), 61, userSeed!)
CALL GenerateWheel(b7Wheel(), 17, userSeed!)
CALL GenerateWheel(b8Wheel(), 29, userSeed!)

CALL GenerateWheel(m3wheel(), 47, userSeed!)
CALL GenerateWheel(y1Wheel(), 13, userSeed!)
CALL GenerateWheel(y2Wheel(), 19, userSeed!)
CALL GenerateWheel(y3Wheel(), 23, userSeed!)
CALL GenerateWheel(y4Wheel(), 31, userSeed!)
CALL GenerateWheel(y5Wheel(), 37, userSeed!)
CALL GenerateWheel(y6Wheel(), 41, userSeed!)
CALL GenerateWheel(y7Wheel(), 43, userSeed!)
CALL GenerateWheel(y8Wheel(), 47, userSeed!)

CALL GenerateWheel(m4wheel(), 37, userSeed!)
CALL GenerateWheel(d1wheel(), 11, userSeed!)
CALL GenerateWheel(d2wheel(), 17, userSeed!)
CALL GenerateWheel(d3wheel(), 19, userSeed!)
CALL GenerateWheel(d4wheel(), 29, userSeed!)
CALL GenerateWheel(d5wheel(), 31, userSeed!)
CALL GenerateWheel(d6wheel(), 37, userSeed!)
CALL GenerateWheel(d7wheel(), 53, userSeed!)
CALL GenerateWheel(d8wheel(), 59, userSeed!)


INPUT "Display Wheels? (1/0): ", DisplayWheels%

IF DisplayWheels% = 1 THEN
        PRINT "M1 Wheel:"
        CALL printarr(M1Wheel())
        PRINT "A1 Wheel:"
        CALL printarr(A1Wheel())
        PRINT "A2 Wheel:"
        CALL printarr(A2Wheel())
        PRINT "A3 Wheel:"
        CALL printarr(A3Wheel())
        PRINT "A4 Wheel:"
        CALL printarr(A4Wheel())
        PRINT "A5 Wheel:"
        CALL printarr(A5Wheel())
        PRINT "A6 Wheel:"
        CALL printarr(A6Wheel())
        PRINT "A7 Wheel:"
        CALL printarr(A7Wheel())
        PRINT "A8 Wheel:"
        CALL printarr(A8Wheel())
END IF

PRINT "Do you want to E(ncipher), or D(ecipher): "
DO
        key$ = INKEY$
        IF key$ = "e" OR key$ = "E" THEN GOTO 20
        IF key$ = "d" OR key$ = "D" THEN GOTO 50
LOOP

20 PRINT "Do you want to encipher from you K(eyboard) or from a F(ile)?"
DO
        key$ = INKEY$
        IF key$ = "k" OR key$ = "K" THEN GOTO 30
        IF key$ = "f" OR key$ = "F" THEN GOTO 35
LOOP


' Inputing words
30 INPUT "Enter Message: ", ogmessage$
31 IF LEN(ogmessage$) > 1501 THEN
        PRINT "Error 004 Message Too Long, Greater Than 1500 Char"
        GOTO 30
END IF

FOR I = 0 TO LEN(ogmessage$) - 1
        spmessage(I) = ASC(MID$(ogmessage$, I + 1, 1))
NEXT I
encipherlen = LEN(ogmessage$)
GOTO 40

35 CLS
PRINT "FILE Mode"
PRINT "Do you want a list of files that can be enciphered (Y/N): "
DO
        key$ = INKEY$
        IF key$ = "y" THEN
                FILES "*.TXT"
                EXIT DO
        END IF
        IF key$ = "n" THEN EXIT DO
LOOP
36 INPUT "Choose input file (File path if needed): "; infilename$
IF DIR$(infilename) <> "" THEN
        PRINT "File does not exist."
        BEEP
        PRINT "Press any key to continue ..."
        SLEEP
        GOTO 36
END IF
encipherlen = 0
OPEN infilename$ FOR INPUT AS #1
DO WHILE NOT EOF(1)
        LINE INPUT #1, line$
        ogmessage$ = ogmessage$ + line$
LOOP
CLOSE #1
GOTO 31

40 FOR I = 0 TO encipherlen - 1
      AlphaVal% = 0
      BetaVal% = 0
      GammaVal% = 0
      DeltaVal% = 0
      CALL BitPackWheels(A1Wheel(), A1pos%, A2Wheel(), A2pos%, A3Wheel(), A3pos%, A4Wheel(), A4pos%, A5Wheel(), A5pos%, A6Wheel(), A6pos%, A7Wheel(), A7pos%, A8Wheel(), A8pos%, AlphaVal%)
      CALL BitPackWheels(b1Wheel(), b1pos%, b2Wheel(), b2pos%, b3Wheel(), b3pos%, b4Wheel(), b4pos%, b5Wheel(), b5pos%, b6Wheel(), b6pos%, b7Wheel(), b7pos%, b8Wheel(), b8pos%, BetaVal%)
      CALL BitPackWheels(y1Wheel(), y1pos%, y2Wheel(), y2pos%, y3Wheel(), y3pos%, y4Wheel(), y4pos%, y5Wheel(), y5pos%, y6Wheel(), y6pos%, y7Wheel(), y7pos%, y8Wheel(), y8pos%, GammaVal%)
      CALL BitPackWheels(d1wheel(), d1pos%, d2wheel(), d2pos%, d3wheel(), d3pos%, d4wheel(), d4pos%, d5wheel(), d5pos%, d6wheel(), d6pos%, d7wheel(), d7pos%, d8wheel(), d8pos%, DeltaVal%)
      enmessage(I) = spmessage(I) XOR AlphaVal%
      enmessage(I) = enmessage(I) AND 255
      enmessage(I) = enmessage(I) XOR BetaVal%
      enmessage(I) = enmessage(I) AND 255
      enmessage(I) = enmessage(I) XOR GammaVal%
      enmessage(I) = enmessage(I) AND 255
      enmessage(I) = enmessage(I) XOR DeltaVal%
      enmessage(I) = enmessage(I) AND 255

      IF M1Wheel(M1pos%) = 1 THEN
        CALL AdvanceWheel(A1pos%, 10)
        CALL AdvanceWheel(A2pos%, 12)
        CALL AdvanceWheel(A3pos%, 16)
        CALL AdvanceWheel(A4pos%, 18)
        CALL AdvanceWheel(A5pos%, 22)
        CALL AdvanceWheel(A6pos%, 28)
        CALL AdvanceWheel(A7pos%, 30)
        CALL AdvanceWheel(A8pos%, 36)
      END IF

      IF m2wheel(m2pos%) = 1 THEN
        IF A1Wheel(A1pos%) = 1 THEN CALL AdvanceWheel(b1pos%, 40)
        IF A2Wheel(A2pos%) = 1 THEN CALL AdvanceWheel(b2pos%, 42)
        IF A3Wheel(A3pos%) = 1 THEN CALL AdvanceWheel(b3pos%, 46)
        IF A4Wheel(A4pos%) = 1 THEN CALL AdvanceWheel(b4pos%, 52)
        IF A5Wheel(A5pos%) = 1 THEN CALL AdvanceWheel(b5pos%, 58)
        IF A6Wheel(A6pos%) = 1 THEN CALL AdvanceWheel(b6pos%, 60)
        IF A7Wheel(A7pos%) = 1 THEN CALL AdvanceWheel(b7pos%, 16)
        IF A8Wheel(A8pos%) = 1 THEN CALL AdvanceWheel(b8pos%, 28)
      END IF

      IF m3wheel(m3pos%) = 1 THEN
        IF b1Wheel(b1pos%) = 1 THEN CALL AdvanceWheel(y1pos%, 12)
        IF b2Wheel(b2pos%) = 1 THEN CALL AdvanceWheel(y2pos%, 18)
        IF b3Wheel(b3pos%) = 1 THEN CALL AdvanceWheel(y3pos%, 22)
        IF b4Wheel(b4pos%) = 1 THEN CALL AdvanceWheel(y4pos%, 30)
        IF b5Wheel(b5pos%) = 1 THEN CALL AdvanceWheel(y5pos%, 36)
        IF b6Wheel(b6pos%) = 1 THEN CALL AdvanceWheel(y6pos%, 40)
        IF b7Wheel(b7pos%) = 1 THEN CALL AdvanceWheel(y7pos%, 42)
        IF b8Wheel(b8pos%) = 1 THEN CALL AdvanceWheel(y8pos%, 46)
      END IF

      IF m4wheel(m4pos%) = 1 THEN
        IF y1Wheel(y1pos%) = 1 THEN CALL AdvanceWheel(d1pos%, 10)
        IF y2Wheel(y2pos%) = 1 THEN CALL AdvanceWheel(d2pos%, 16)
        IF y3Wheel(y3pos%) = 1 THEN CALL AdvanceWheel(d3pos%, 18)
        IF y4Wheel(y4pos%) = 1 THEN CALL AdvanceWheel(d4pos%, 28)
        IF y5Wheel(y5pos%) = 1 THEN CALL AdvanceWheel(d5pos%, 30)
        IF y6Wheel(y6pos%) = 1 THEN CALL AdvanceWheel(d6pos%, 36)
        IF y7Wheel(y7pos%) = 1 THEN CALL AdvanceWheel(d7pos%, 52)
        IF y8Wheel(y8pos%) = 1 THEN CALL AdvanceWheel(d8pos%, 58)
      END IF


      CALL AdvanceWheel(M1pos%, 58)
      CALL AdvanceWheel(m2pos%, 40)
      CALL AdvanceWheel(m3pos%, 46)
      CALL AdvanceWheel(m4pos%, 36)
      ' PRINT M1pos%
      ' PRINT spmessage(I); AlphaVal%; BetaVal%; GammaVal%; DeltaVal%; enmessage(I)
      CLS
      PRINT ""
      PRINT "ENCIPHERING IN PROGRESS ";
      Progress% = INT((I / (encipherlen - 1)) * 100)
      PRINT Progress%; "% Finshed"
      PRINT ""
      PRINT "Motor Wheels Pos:", M1pos%, m2pos%, m3pos%, m4pos%
      PRINT "Alpha Wheels Pos:", A1pos%, A2pos%, A3pos%, A4pos%, A5pos%, A6pos%, A7pos%, A8pos%
      PRINT "Beta Wheels Pos :", b1pos%, b2pos%, b3pos%, b4pos%, b5pos%, b6pos%, b7pos%, b8pos%
      PRINT "Gamma Wheels Pos:", y1pos%, y2pos%, y3pos%, y4pos%, y5pos%, y6pos%, y7pos%, y8pos%
      PRINT "Delta Wheels Pos:", d1pos%, d2pos%, d3pos%, d4pos%, d5pos%, d6pos%, d7pos%, d8pos%
      PRINT ""
      PRINT "Current Letter:", spmessage(I)
      PRINT "Post-Enciphering", enmessage(I)
      

NEXT I
BEEP
PRINT "Enciphering Finished"
GOTO 103

50 CLS
PRINT "Decipher Mode"
PRINT "Do you want a list of files that can be deciphered (Y/N): "
DO
        key$ = INKEY$
        IF key$ = "y" THEN
                FILES "*.TXT"
        END IF
        IF key$ = "n" THEN EXIT DO
LOOP
60 INPUT "Choose input file (File path if needed): "; infilename$
IF DIR$(infilename) <> "" THEN
        PRINT "File does not exist."
        PRINT CHR$(7)
        PRINT "Press any key to continue ..."
        STOP
        GOTO 60
END IF
DIM decipherlen AS INTEGER
DIM charNum AS INTEGER
DIM charCode AS INTEGER
decipherlen = 0
charNum = 0
charCode = 0
OPEN infilename$ FOR INPUT AS #1
DO WHILE NOT EOF(1)
        INPUT #1, charNum, charCode
        spmessage(charNum) = charCode
        decipherlen = decipherlen + 1
        PRINT decipherlen
        WRITE charNum, charCode
LOOP
CLOSE #1

FOR I = 0 TO decipherlen - 1
      AlphaVal% = 0
      BetaVal% = 0
      GammaVal% = 0
      DeltaVal% = 0
      CALL BitPackWheels(A1Wheel(), A1pos%, A2Wheel(), A2pos%, A3Wheel(), A3pos%, A4Wheel(), A4pos%, A5Wheel(), A5pos%, A6Wheel(), A6pos%, A7Wheel(), A7pos%, A8Wheel(), A8pos%, AlphaVal%)
      CALL BitPackWheels(b1Wheel(), b1pos%, b2Wheel(), b2pos%, b3Wheel(), b3pos%, b4Wheel(), b4pos%, b5Wheel(), b5pos%, b6Wheel(), b6pos%, b7Wheel(), b7pos%, b8Wheel(), b8pos%, BetaVal%)
      CALL BitPackWheels(y1Wheel(), y1pos%, y2Wheel(), y2pos%, y3Wheel(), y3pos%, y4Wheel(), y4pos%, y5Wheel(), y5pos%, y6Wheel(), y6pos%, y7Wheel(), y7pos%, y8Wheel(), y8pos%, GammaVal%)
      CALL BitPackWheels(d1wheel(), d1pos%, d2wheel(), d2pos%, d3wheel(), d3pos%, d4wheel(), d4pos%, d5wheel(), d5pos%, d6wheel(), d6pos%, d7wheel(), d7pos%, d8wheel(), d8pos%, DeltaVal%)
      enmessage(I) = spmessage(I) XOR DeltaVal%
      enmessage(I) = enmessage(I) AND 255
      enmessage(I) = enmessage(I) XOR GammaVal%
      enmessage(I) = (enmessage(I) XOR BetaVal%) AND 255
      enmessage(I) = enmessage(I) AND 255
      enmessage(I) = (enmessage(I) XOR AlphaVal%) AND 255
      enmessage(I) = enmessage(I) AND 255

      IF M1Wheel(M1pos%) = 1 THEN
        CALL AdvanceWheel(A1pos%, 10)
        CALL AdvanceWheel(A2pos%, 12)
        CALL AdvanceWheel(A3pos%, 16)
        CALL AdvanceWheel(A4pos%, 18)
        CALL AdvanceWheel(A5pos%, 22)
        CALL AdvanceWheel(A6pos%, 28)
        CALL AdvanceWheel(A7pos%, 30)
        CALL AdvanceWheel(A8pos%, 36)
      END IF

      IF m2wheel(m2pos%) = 1 THEN
        IF A1Wheel(A1pos%) = 1 THEN CALL AdvanceWheel(b1pos%, 40)
        IF A2Wheel(A2pos%) = 1 THEN CALL AdvanceWheel(b2pos%, 42)
        IF A3Wheel(A3pos%) = 1 THEN CALL AdvanceWheel(b3pos%, 46)
        IF A4Wheel(A4pos%) = 1 THEN CALL AdvanceWheel(b4pos%, 52)
        IF A5Wheel(A5pos%) = 1 THEN CALL AdvanceWheel(b5pos%, 58)
        IF A6Wheel(A6pos%) = 1 THEN CALL AdvanceWheel(b6pos%, 60)
        IF A7Wheel(A7pos%) = 1 THEN CALL AdvanceWheel(b7pos%, 16)
        IF A8Wheel(A8pos%) = 1 THEN CALL AdvanceWheel(b8pos%, 28)
      END IF

      IF m3wheel(m2pos%) = 1 THEN
        IF b1Wheel(b1pos%) = 1 THEN CALL AdvanceWheel(y1pos%, 12)
        IF b2Wheel(b2pos%) = 1 THEN CALL AdvanceWheel(y2pos%, 18)
        IF b3Wheel(b3pos%) = 1 THEN CALL AdvanceWheel(y3pos%, 22)
        IF b4Wheel(b4pos%) = 1 THEN CALL AdvanceWheel(y4pos%, 30)
        IF b5Wheel(b5pos%) = 1 THEN CALL AdvanceWheel(y5pos%, 36)
        IF b6Wheel(b6pos%) = 1 THEN CALL AdvanceWheel(y6pos%, 40)
        IF b7Wheel(b7pos%) = 1 THEN CALL AdvanceWheel(y7pos%, 42)
        IF b8Wheel(b8pos%) = 1 THEN CALL AdvanceWheel(y8pos%, 46)
      END IF

      IF m4wheel(m4pos%) = 1 THEN
        IF y1Wheel(y1pos%) = 1 THEN CALL AdvanceWheel(d1pos%, 10)
        IF y2Wheel(y2pos%) = 1 THEN CALL AdvanceWheel(d2pos%, 16)
        IF y3Wheel(y3pos%) = 1 THEN CALL AdvanceWheel(d3pos%, 18)
        IF y4Wheel(y4pos%) = 1 THEN CALL AdvanceWheel(d4pos%, 28)
        IF y5Wheel(y5pos%) = 1 THEN CALL AdvanceWheel(d5pos%, 30)
        IF y6Wheel(y6pos%) = 1 THEN CALL AdvanceWheel(d6pos%, 36)
        IF y7Wheel(y7pos%) = 1 THEN CALL AdvanceWheel(d7pos%, 52)
        IF y8Wheel(y8pos%) = 1 THEN CALL AdvanceWheel(d8pos%, 58)
      END IF

      CALL AdvanceWheel(M1pos%, 58)
      CALL AdvanceWheel(m2pos%, 40)
      CALL AdvanceWheel(m3pos%, 46)
      CALL AdvanceWheel(m4pos%, 36)
      ' PRINT M1pos%
      ' PRINT spmessage(I); AlphaVal%; BetaVal%; GammaVal%; DeltaVal%; enmessage(I)
      CLS
      PRINT ""
      PRINT "DECIPHERING IN PROGRESS ";
      Progress% = INT((I / decipherlen) * 100)
      PRINT Progress%; "% Finshed"
      PRINT ""
      PRINT "Motor Wheels Pos:", M1pos%, m2pos%, m3pos%, m4pos%
      PRINT "Alpha Wheels Pos:", A1pos%, A2pos%, A3pos%, A4pos%, A5pos%, A6pos%, A7pos%, A8pos%
      PRINT "Beta Wheels Pos :", b1pos%, b2pos%, b3pos%, b4pos%, b5pos%, b6pos%, b7pos%, b8pos%
      PRINT "Gamma Wheels Pos:", y1pos%, y2pos%, y3pos%, y4pos%, y5pos%, y6pos%, y7pos%, y8pos%
      PRINT "Delta Wheels Pos:", d1pos%, d2pos%, d3pos%, d4pos%, d5pos%, d6pos%, d7pos%, d8pos%
      PRINT ""
      PRINT "Current Letter:", spmessage(I)
     
      IF enmessage(I) >= 32 AND enmessage(I) <= 126 THEN
        PRINT "Post-Enciphering:", CHR$(enmessage(I))
        decimessage$ = decimessage$ + CHR$(enmessage(I))
      ELSE
        PRINT "Post-Enciphering:", enmessage(I)
        decimessage$ = decimessage$ + STR$(enmessage(I))
      END IF
      

NEXT I
BEEP
PRINT "Deciphering finished. :3"
GOTO 120

103 INPUT "Chose output file (File Path if needed): "; otfilename$
IF DIR$(otfilename) <> "" THEN
        PRINT "Warning: File alread exists and will be overwritten."
        PRINT CHR$(7)
        PRINT "Type 1 to overwrite file, Type 0 to chose a differnt file"
        DO
                key$ = INKEY$
                IF key$ = "1" THEN EXIT DO
                IF key$ = "0" THEN GOTO 103
        LOOP
END IF
OPEN otfilename$ FOR OUTPUT AS #1
FOR I = 0 TO encipherlen - 1
        WRITE #1, I, enmessage(I)
NEXT I
CLOSE #1
SHELL "CD > tempfile.txt"
OPEN "tempfile.txt" FOR INPUT AS #2
LINE INPUT #2, path$
CLOSE #2
KILL "tempfile.txt"

PRINT CHR$(7)
PRINT "Writing Complete :3"
PRINT "File saved to: "; path$
SLEEP
END

120 INPUT "Chose output file (File Path if needed): "; otfilename$
IF DIR$(otfilename) <> "" THEN
        PRINT "Warning: File alread exists and will be overwritten."
        PRINT CHR$(7)
        PRINT "Type 1 to overwrite file, Type 0 to chose a differnt file"
        DO
                key$ = INKEY$
                IF key$ = "1" THEN EXIT DO
                IF key$ = "0" THEN GOTO 120
        LOOP
END IF
OPEN otfilename$ FOR OUTPUT AS #1
PRINT #1, decimessage$
CLOSE #1
SHELL "CD > tempfile.txt"
OPEN "tempfile.txt" FOR INPUT AS #2
LINE INPUT #2, path$
CLOSE #2
KILL "tempfile.txt"

PRINT CHR$(7)
PRINT "Writing Complete :3"
PRINT "File saved to: "; path$
SLEEP
END

SUB AdvanceWheel (wpos AS INTEGER, maxindex AS INTEGER)
        wpos = wpos + 1
        IF wpos > maxindex THEN wpos = 0
END SUB

SUB BitPackWheels (W1() AS INTEGER, P1 AS INTEGER, W2() AS INTEGER, P2 AS INTEGER, W3() AS INTEGER, P3 AS INTEGER, W4() AS INTEGER, P4 AS INTEGER, W5() AS INTEGER, P5 AS INTEGER, W6() AS INTEGER, P6 AS INTEGER, W7() AS INTEGER, P7 AS INTEGER, W8() AS INTEGER, P8 AS INTEGER, result%)
        result% = W1(P1) * 128 + W2(P2) * 64 + W3(P3) * 32 + W4(P4) * 16 + W5(P5) * 8 + W6(P6) * 4 + W7(P7) * 2 + W8(P8)
END SUB

SUB GenerateWheel (wheel%(), length%, seed!)
        RANDOMIZE seed!
        FOR I = 0 TO length% - 1
                wheel%(I) = INT(RND * 2)
        NEXT I
END SUB

SUB manual
        CLS
        PRINT ""
        PRINT "Welcome to the M324 User Guide."
        PRINT "Using this program is quite easy."
        PRINT "Here's a step by step guide on how to Encipher and Decipher Messages."
        PRINT ""
        PRINT "Step 1: Enter a seed when prompted. This seed should be an integer between -32,767 and 32,767."
        PRINT "        The seed determines the pattern of 1s & 0s on the wheels. Make sure to write down this number so you decipher the message later."
        PRINT "Step 2: Choose the encipher option."
        PRINT "Step 3: Choose the keyboard option."
        PRINT "Step 4: Enter your message."
        PRINT "Step 5: Choose where to put the enciphered message."

        PRINT "Press any key to return to program"
        SLEEP
END SUB

SUB printarr (Array() AS INTEGER)
        FOR I = 0 TO UBOUND(Array)
                PRINT Array(I); ",";
        NEXT I
        PRINT " "
END SUB

