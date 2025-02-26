section        .text
    global ft_list_sort

    ; end:
    ;     ADD rsp, 8
    ;     POP r14
    ;     POP r13
    ;     POP r12
    ;     POP rbp
    ;     RET
    
    ALIGN 16
    swap1:
        MOV [r14], r11
        MOV r13, [r11 + 8]
        MOV [r10 + 8], r13
        MOV [r11 + 8], r10
        JMP sort
    ALIGN 16
    swap:
        CMP r9, 0
        JE swap1
        MOV [r9 + 8], r11
        MOV r13, [r11 + 8]
        MOV [r10 + 8], r13
        MOV [r11 + 8], r10
        JMP sort
    ; rdi : double pointeur sur debut de list
    ; [rdi] : pointeur sur debut de list = adresse du premier element
    ; [[rdi]] : valeur stocke dans data -> pointeur sur int
    ; MOV ecx, [rax] => ecx : valeur de l int pointe par data (ecx et non rcx ou cl car int = 32 bit)
    ; rsi : pointeur sur fonction
    ALIGN 16
    ft_list_sort :
        PUSH rbp
        PUSH r12
        PUSH r13
        PUSH r14
        SUB rsp, 8
        MOV rbp, rsp
        CMP rdi, 0 ; si rdi = NULL
        JE end
        CMP rsi, 0  ; si rsi = NULL
        JE end
        MOV r8, rsi ; r8 = pointeur sur fonction
        MOV r14, rdi ; r14 = double pointeur sur debut de list
        ALIGN 16
        sort:
            XOR r9, r9
            MOV r11, [r14]
            CMP r11, 0
            JE end ; si liste vide = NULL
            MOV r12, [r11]
            XOR rsi, rsi
            MOV esi, [r12] ; rsi = valeur pointe par data -> Valeur a comparer 
            ALIGN 16
            loop:
                MOV r10, r11 ; r10 = pointeur sur l elem-1
                MOV r11, [r11 + 8] ; r11 = pointeur sur l elem0
                CMP r11, 0
                JE end ; si liste vide = NULL
                MOV r12, [r11]
                XOR rdi, rdi
                MOV edi, [r12] ; rdi = valeur pointe par data
                CALL r8 ; Call la fonction stockee dans le pointeur sur fonction
                JL swap
                MOV r9, r10 ; pointeur sur elem-2
                MOV esi, edi
                JMP loop
        ALIGN 16
        end:
            ADD rsp, 8
            POP r14
            POP r13
            POP r12
            POP rbp
            RET
