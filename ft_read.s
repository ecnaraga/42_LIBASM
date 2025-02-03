section         .text
    global ft_read
    extern  __errno_location

    error :
        MOV r10, rax
        call __errno_location wrt ..plt
        MOV [rax], r10
        MOV rax, -1
        ret

    ft_read:
        xor rax, rax
        syscall
        CMP rax, 0
        JL  error
        ret
