section         .text
    global ft_list_size

    ft_list_size:
        PUSH rbp
        MOV rbp, rsp
        XOR rax, rax
        loop:
            CMP rdi, 0
            JE end
            MOV rdi, [rdi + 8]
            INC rax
            JMP loop
        end:
            POP rbp
            RET