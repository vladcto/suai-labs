SStack segment 'stack'
    DB 256 DUP (?)    
SStack ends

SData segment 'data'
    InputNum DW 11111
    DigitCount DD ?
    DigitCountText DW "Digit Count = $"
SData ends

SCode segment 'code'
    ASSUME CS:SCode, DS:SData, SS:SStack

    PrintNum PROC NEAR
        ; print ASCII num
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        MOV BX, 10
        XOR CX, CX
        OR AX, AX
        JNS @@DIV:
        NEG AX
        PUSH AX
        MOV AH, 02H
        MOV DL, '-'
        INT 21H
        POP AX
        @@DIV:
        XOR DX, DX
        DIV BX
        PUSH DX
        INC CX
        OR AX,AX
        JNZ @@DIV
        MOV AH, 02H
        @@STORE:
        POP DX
        ADD DL, '0'
        INT 21H
        LOOP @@STORE
        POP DX
        POP CX
        POP BX
        POP AX
        ; Print new line
        PUSH AX
        MOV AH, 0EH
        MOV AL, 0AH
        INT 10H
        MOV AH, 0EH
        MOV AL, 0DH
        INT 10H
        POP AX
        RET        
    PrintNum ENDP

    Main PROC FAR
        MOV AX, SData
        MOV DS, AX

        MOV AX, InputNum
        MOV CX, 0 

        CMP AX, 0
        JGE GetDigits
        NEG AX 
        GetDigits:

        CountDigitsLoop:
        MOV BX, 10
        XOR DX, DX
        DIV BX
        INC CX       
        TEST AX, AX
        JNZ CountDigitsLoop
        MOV DigitCount, CX
        MOV AX, DigitCount
        LEA DX, DigitCountText
        CALL PrintNum
        
        MOV AH, 0
        INT 21H
        RET
    Main ENDP

SCode ends
END Main