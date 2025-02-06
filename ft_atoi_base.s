section         .text
    global  ft_atoi_base
    extern  ft_strlen

    err1 :
        POP rax 
        POP rsi
        POP rsi
        POP rdi
        POP rax
        JMP err

    err :
        XOR rax, rax
        POP rbp
        RET
    
    ft_forbidden_char:
        PUSH rsi
        PUSH rax
        XOR rax, rax ; rax = compteur = 0
        CMP byte [rsi], 0
        JNE begin1
        begin1 :
            LEA rdi, [rel forbidden_char]
            begin2 :
                MOV bl, byte [rsi]
                CMP byte [rdi], bl
                JE err1
                CMP byte [rdi], 0
                JE endloop2
                INC rdi
                JMP begin2
            endloop2 :
                INC rsi
                CMP byte [rsi], 0
                JNE begin1


        POP rax
        POP rsi

    ; rax = size of base
    ; rdi = string with the litteral int
    ; rsi = base
    ft_check_base:
        PUSH rax
        PUSH rdi
        PUSH rsi
        XOR rax, rax ; rax = compteur = 0
        ; XOR rax, rax ; rax = compteur = 0
        begin:
            JMP ft_forbidden_char
            INC rax

        POP rsi
        POP rdi
        POP rax


    ; rdi = string with the litteral int
    ; rsi = base
    ft_atoi_base:
        PUSH rbp
        CMP rsi, 0; Si pointeur base == NULL
        JE  err
        PUSH rdi
        MOV rdi, rsi
        SUB rsp, 8
        CALL ft_strlen ; rax = size of base
        ADD rsp, 8
        POP rdi
        CMP rax, 1 ;Si base vide
        JLE err
        JMP ft_check_base

        POP rbp
        RET

section         .data
    forbidden_char db "+- \b\t\n\v\f\r", 0
