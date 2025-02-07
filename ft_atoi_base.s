section         .text
    global  ft_atoi_base
    extern  ft_strlen

    err1 :
        POP rbp
        ADD rsp, 8 ; POUR OUBLIER L ADRESSE DE RETOUR APRES UN CALL FT_FORBIDDEN
        POP rbp
        ADD rsp, 8 ; POUR OUBLIER L ADRESSE DE RETOUR APRES UN CALL FT_CHECK_BASE
        ADD rsp, 8
        POP rsi
        POP rdi
        POP rax
        JMP err

    err :
        MOV rax, 0
        POP rbp
        RET
    
    ; Check if forbidden char in base[i]
    ; rdi = base + i with i incremented in the loop of ft_check_base
    ft_forbidden_char:
        PUSH rbp
        MOV rbp, rsp
        CMP byte [rdi], 8
        JE err1
        CMP byte [rdi], 9
        JE err1
        CMP byte [rdi], 10
        JE err1
        CMP byte [rdi], 11
        JE err1
        CMP byte [rdi], 12
        JE err1
        CMP byte [rdi], 13
        JE err1
        CMP byte [rdi], 32
        JE err1
        CMP byte [rdi], 43
        JE err1
        CMP byte [rdi], 45
        JE err1
        POP rbp
        RET
    
    ; rdi = base + i with i incremented in the loop of ft_check_base
    ft_check_double:
        PUSH rbp
        MOV rbp, rsp
        MOV rsi, rdi
        MOV al, byte [rdi]
        begin0:
            INC rsi
            CMP al, byte [rsi]
            JE err1
            CMP byte [rsi], 0
            JNE begin0
            POP rbp
            RET

    ; rdi = base
    ft_check_base:
        PUSH rbp
        MOV rbp, rsp
        begin1:
            CALL ft_forbidden_char
            CALL ft_check_double
            INC rdi
            CMP byte [rdi], 0
            JNE begin1 
        POP rbp
        RET
    
    ft_skip_space:
        PUSH rbp
        MOV rbp, rsp
        DEC rdi
        begin2:
            INC rdi
            CMP byte [rdi], 8
            JE begin2
            CMP byte [rdi], 9
            JE begin2
            CMP byte [rdi], 10
            JE begin2
            CMP byte [rdi], 11
            JE begin2
            CMP byte [rdi], 12
            JE begin2
            CMP byte [rdi], 13
            JE begin2
            CMP byte [rdi], 32
            JE begin2
        POP rbp
        RET

    ; rdi : litteral string of int at the beginning of potential + or -
    ; return rax = 1 or -1 according to the number of "-" present
    ft_sign:
        PUSH rbp
        MOV rbp, rsp
        DEC rdi
        MOV al, 1
        JMP begin3
        jmp_neg:
            MOV ah, -1
            IMUL ah
            MOVSX rax, al
            JE begin3
        begin3:
            INC rdi
            CMP byte [rdi], 43
            JE begin3
            CMP byte [rdi], 45
            JE jmp_neg
        POP rbp
        RET
    
    ; rdi : litteral string of int incremented where the char is part of the int
    ; rsi : base
    ; rax : compteur => SI == len_base - 1 => char ne fait pas partie de la base
    ft_position:; A TESTER
        PUSH rbp
        MOV rbp, rsp
        MOV rax, -1
        MOV bl, byte [rdi]
        DEC rsi
        JMP begin5
        begin5:
            INC rsi
            INC rax
            CMP byte [rsi], 0
            JE  end
            CMP byte [rsi], bl
            JNE begin5
        end:
            POP rbp
            RET

    ; rdi = string with the litteral int
    ; rsi = base
    ft_atoi_base:
        PUSH rbp
        MOV rbp, rsp
        CMP rsi, 0; If pointeur base == NULL
        JE  err
        PUSH rdi
        MOV rdi, rsi
        SUB rsp, 8
        CALL ft_strlen ; rax = size of base
        ADD rsp, 8
        POP rdi
        CMP rax, 1 ; If len_base <= 1
        JLE err
        PUSH rax
        PUSH rdi
        PUSH rsi
        MOV rdi, rsi
        SUB rsp, 8
        CALL ft_check_base ; If doubles or forbidden char in base
        ADD rsp, 8
        POP rsi
        POP rdi
        POP rax
        PUSH rdi
        SUB rsp, 8
        CALL ft_skip_space
        ADD rsp, 8
        PUSH rax
        SUB rsp, 8
        CALL ft_sign
        ADD rsp, 8
        MOV rbx, rax ; rbx = signe de l int
        POP rax

        POP rdi
        POP rbp
        RET
