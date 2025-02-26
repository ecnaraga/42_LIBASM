section         .text
    global  ft_atoi_base
    extern  ft_strlen

    err2 :
        POP r12
        JMP err1

    ALIGN 16
    err1 :
        POP rbp
        ADD rsp, 8 ; TO FORGET RETURN ADDRESS AFTER CALL FT_FORBIDDEN
        POP rbp
        ADD rsp, 8 ; TO FORGET RETURN ADDRESS AFTER CALL FT_CHECK_BASE
        POP rsi
        POP rdi
        POP rax
        JMP err

    ALIGN 16
    err :
        MOV rax, 0
        POP rbx
        POP rbp
        RET
    
    ; Check if forbidden char in base[i]
    ; rdi = base + i with i incremented in the loop of ft_check_base
    ALIGN 16
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
    ALIGN 16
    ft_check_double:
        PUSH rbp
        PUSH r12
        MOV rbp, rsp
        MOV r12, rdi
        MOV al, byte [rdi]
        ALIGN 16
        begin0:
            INC r12
            CMP al, byte [r12]
            JE err2
            CMP byte [r12], 0
            JNE begin0
            POP r12
            POP rbp
            RET

    ; rdi = base
    ALIGN 16
    ft_check_base:
        PUSH rbp
        MOV rbp, rsp
        ALIGN 16
        begin1:
            CALL ft_forbidden_char
            CALL ft_check_double
            INC rdi
            CMP byte [rdi], 0
            JNE begin1 
        POP rbp
        RET
    
    ; rdi = litteral string of int at index 0
    ALIGN 16
    ft_skip_space:
        PUSH rbp
        MOV rbp, rsp
        DEC rdi
        ALIGN 16
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
    ALIGN 16
    ft_sign:
        PUSH rbp
        MOV rbp, rsp
        DEC rdi
        MOV al, 1
        JMP begin3
        ALIGN 16
        jmp_neg:
            MOV ah, -1
            IMUL ah
            MOVSX rax, al
            JE begin3
        ALIGN 16
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
    ; rax : counter => IF == len_base => byte is absent of base
    ALIGN 16
    ft_position:
        PUSH rbp
        MOV rbp, rsp
        MOV rax, -1
        PUSH rbx
        MOV bl, byte [rdi]
        DEC rsi
        JMP begin5
        ALIGN 16
        begin5:
            INC rsi
            INC rax
            CMP byte [rsi], 0
            JE  end
            CMP byte [rsi], bl
            JNE begin5
        ALIGN 16
        end:
            POP rbx
            POP rbp
            RET
    
    ; rdi = string with the litteral int
    ; rsi = base
    ; rdx = sign of int
    ALIGN 16
    ft_atoi:
        PUSH rbp
        MOV rbp, rsp
        PUSH r12
        PUSH r13
        XOR r12, r12 ; r12 = result
        ALIGN 16
        begin4:
            CMP byte [rdi], 0
            JE end1
            PUSH rax
            PUSH rsi
            CALL ft_position
            POP rsi
            MOV r13, rax ; r13 = index position in base
            POP rax
            CMP r13, rax ; Check if byte is in base
            JE end1
            IMUL r12, rax
            ADD r12, r13
            INC rdi
            JMP begin4
        ALIGN 16
        end1: 
            MOV rax, r12
            IMUL rax, rdx
        POP r13
        POP r12
        POP rbp
        RET

    ; rdi = string with the litteral int
    ; rsi = base
    ALIGN 16
    ft_atoi_base:
        PUSH rbp
        MOV rbp, rsp
        PUSH rbx
        CMP rsi, 0 ; Check if pointeur base == NULL
        JE  err
        PUSH rdi
        MOV rdi, rsi
        CALL ft_strlen ; rax = size of base
        POP rdi
        CMP rax, 1 ; Check if len_base <= 1
        JLE err
        PUSH rax
        PUSH rdi
        PUSH rsi
        MOV rdi, rsi
        CALL ft_check_base ; Check if doubles or forbidden char in base
        POP rsi
        POP rdi
        POP rax
        PUSH rdi
        CALL ft_skip_space
        PUSH rax
        CALL ft_sign
        MOV rbx, rax ; rbx = sign of int
        POP rax
        MOV rdx, rbx
        PUSH rdx
        CALL ft_atoi
        POP rdx
        POP rdi
        POP rbx
        POP rbp
        RET

section .note.GNU-stack noalloc noexec nowrite progbits