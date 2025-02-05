section         .text
    global  ft_atoi_base
    extern  ft_strlen

    err :
        MOV rax, -1
        POP rbp
        RET

    ; rdi = string with the litteral int
    ; rsi = base
    ft_atoi_base:
        PUSH rbp
        CMP rsi, 0; Si pointeur base == NULL
        JE  err
        PUSH rdi
        PUSH rsi; NECESSAIRE DE SAUV RSI?
        MOV rdi, rsi
        SUB rsp, 8
        CALL ft_strlen ; rax = size of base
        ADD rsp, 8
        POP rsi
        POP rdi
        CMP rax, 0 ;Si base vide
        JE err


        POP rbp
        RET