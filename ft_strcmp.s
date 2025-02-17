section         .text
    global          ft_strcmp

    ALIGN 16
    ft_strcmp:
        PUSH rbp
        MOV rbp, rsp
        XOR rax, rax

        ALIGN 16
        debut:
            CMP byte [rdi],0
            JE end
            CMP byte [rsi],0
            JE end
            MOV al, byte [rdi]
            CMP al, byte [rsi]
            JNE end
            INC rdi
            INC rsi
            JMP debut
        
        ALIGN 16
        end:
            MOV al, byte [rdi]
            MOV cl, byte [rsi]
            SUB al, cl
            MOVSX rax, al ;=> le signe de al soit "maj" dans rax
            POP rbp
            RET

section .note.GNU-stack noalloc noexec nowrite progbits