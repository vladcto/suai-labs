SumOddElements MACRO ArrayPtr, ArraySize
    MOV SI, OFFSET ArrayPtr  
    MOV CX, ArraySize  
    XOR AL, AL

    Iterate:
        MOV AH, [SI]
        TEST AH, 1
        JZ NextElement
        ADD AL, AH 
    NextElement:
        INC SI        
        LOOP Iterate  

    ENDM


.data
    Array DB 1, 2, 3, 4, 5, 6, 7, 8, 9
    ArraySize DW 9

.code

    START:
        MOV AX, @data
        MOV DS, AX

        SumOddElements Array, ArraySize

        MOV AH, 02h
        MOV DL, AL
        INT 21h

        MOV AH, 4CH
        INT 21H
    END START
