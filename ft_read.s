section         .text
    global ft_read
    extern  __errno_location

    error :
        MOV r10, rax
        CALL __errno_location wrt ..plt
        MOV [rax], r10
        MOV rax, -1
        POP rbp
        RET

    ft_read:
        PUSH rbp
        XOR rax, rax
        SYSCALL
        CMP rax, 0
        JL  error
        POP rbp
        RET
