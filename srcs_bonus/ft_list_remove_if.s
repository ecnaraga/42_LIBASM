section         .text
    global  ft_list_remove_if
    extern  free

    ALIGN 16
    ft_link:
        MOV [r10], r15
        JMP free_end

    ALIGN 16
    ft_free:
        MOV rdi, r12
        PUSH r11
        SUB rsp, 8
        CALL r9
        ADD rsp, 8
        POP r11
        MOV r15, [r11 + 8]
        CMP r14, 0
        JE ft_link
        MOV [r14 + 8], r15
        free_end:
            MOV rdi, r11
            CALL free wrt ..plt
            MOV r11, r15
            JMP loop

    ; rdi : double pointeur sur list
    ; [rdi] : pointeur sur debut de list
    ; rsi : pointeur sur valeur a comparer
    ; rdx : pointeur sur fonction ft_cmp
    ; rcx : pointeur sur fonction free_fct
    ALIGN 16
    ft_list_remove_if:
        PUSH rbp
        MOV rbp, rsp
        PUSH r12
        PUSH r13
        PUSH r14
        PUSH r15
        CMP rdi, 0
        JE end
        CMP rsi, 0
        JE end
        CMP rdx, 0
        JE end
        CMP rcx, 0
        JE end
        MOV r8, rdx ; r8 : pointeur sur fonction ft_cmp 
        MOV r9, rcx ; r9 : pointeur sur fonction free_fct
        MOV r10, rdi ; r10 : double pointeur sur list
        MOV rsi, [rsi] ; rsi : valeur a comparer
        MOV r11, [rdi] ; r11 : pointeur sur 1er elem list
        XOR r14, r14
        ALIGN 16
        loop :
            CMP r11, 0
            JE end
            MOV r12, [r11] ; r12 : void *data
            MOV r13, [r12] ; r12 : data dereference
            CMP r13d, esi
            JE ft_free
            MOV r14, r11 ; r14 : elem-1
            MOV r11, [r11 + 8] ; begin = begin->next
            JMP loop
        ALIGN 16
        end:
            POP r15
            POP r14
            POP r13
            POP r12
            POP rbp
            RET