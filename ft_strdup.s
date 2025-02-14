section         .text
    global ft_strdup
    extern malloc
    extern ft_strlen
    extern ft_strcpy

    err:
        POP rax
        XOR rax, rax
        POP rbp
        ret

    ALIGN 16
    ft_strdup :
        PUSH rbp
        MOV rbp, rsp
        PUSH rdi
        SUB rsp, 8
        CALL ft_strlen ;rax = len de rdi
        ADD rsp, 8
        POP rdi
        ADD rax, 1
        PUSH rax
        PUSH rdi
        MOV rdi, rax
        SUB rsp, 8
        CALL malloc wrt ..plt
        ADD rsp, 8
        POP rdi
        CMP rax, 0
        JE err
        MOV rsi, rdi
        MOV rdi, rax
        POP rax
        CALL ft_strcpy
        POP rbp
        RET
        
section .note.GNU-stack noalloc noexec nowrite progbits