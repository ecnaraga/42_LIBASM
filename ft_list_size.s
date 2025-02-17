section         .text
    global ft_list_size

    ALIGN 16
    ft_list_size:
        PUSH rbp
        MOV rbp, rsp
        XOR rax, rax
        ALIGN 16
        loop:
            CMP rdi, 0
            JE end
            MOV rdi, [rdi + 8]
            INC rax
            JMP loop
        ALIGN 16
        end:
            POP rbp
            RET