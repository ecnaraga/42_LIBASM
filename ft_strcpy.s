section         .text
    global  ft_strcpy

    ft_strcpy:
        PUSH rbp
        XOR rax, rax
        MOV r12, rdi

        start:
            MOV al, byte [rsi]
            MOV byte [rdi], al
            CMP byte [rsi], 0
            JE  end
            INC rdi
            INC rsi
            JMP start
        
        end:
            MOV rax, r12
            POP rbp
            RET
