section         .text
    global  ft_strcpy

    ALIGN 16
    condition:
        CMP rsi, 0
        JNE start
        JMP end

    ALIGN 16
    ft_strcpy:
        PUSH rbp
        MOV rbp, rsp
        XOR rax, rax
        MOV r12, rdi
        CMP rdi, 0
        JE condition

        ALIGN 16
        start:
            MOV al, byte [rsi]
            MOV byte [rdi], al
            CMP byte [rsi], 0
            JE  end
            INC rdi
            INC rsi
            JMP start
        
        ALIGN 16
        end:
            MOV rax, r12
            POP rbp
            RET

section .note.GNU-stack noalloc noexec nowrite progbits