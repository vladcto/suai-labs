SStack segment 'stack'
    DB 256 DUP (?)    
SStack ends

SData segment 'data'
    X1 DW -5
    X2 DW 160
    X3 DW -40
    X4 DW -20                  
    RES1 DD ?
    RES2 DD ?
    RES3 DD ?
    RES4 DD ?
    RES1Text DW "X1 = $"
    RES2Text DW "X2 = $" 
    RES3Text DW "X3 = $" 
    RES4Text DW "X4 = $"  
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

    
    Main proc FAR
        MOV AX, SData
        MOV DS, AX
        
        ; Calculations
        PUSH X3
        ; X1 * X4
        MOV AX, X1
        MUL X4
        MOV RES1, AX
        ; X2 + X3
        MOV AX, X2
        ADD AX, X3
        MOV RES2, AX
        ; X3 * 2
        MOV AX, 2
        MUL X3
        MOV RES3, AX
        ; X2 - X1
        MOV AX, X2
        SUB AX, X1
        MOV RES4, AX
        
        ; Output
        MOV AX, X3
        CALL PrintNum
        ; RES1
        MOV AH, 9h
        LEA DX, RES1Text
        INT 21H
        MOV AX, RES1
        CALL PrintNum
        ; RES2
        MOV AH, 9h
        LEA DX, RES2Text
        INT 21H
        MOV AX, RES2
        CALL PrintNum
        ; RES3
        MOV AH, 9h
        LEA DX, RES3Text
        INT 21H
        MOV AX, RES3
        CALL PrintNum
        ; RES4
        MOV AH, 9h
        LEA DX, RES4Text
        INT 21H
        MOV AX, RES4
        CALL PrintNum
        ; End output
        MOV AH, 0
        INT 21H               
        ret
    Main endp
    
SCode ends
END Main