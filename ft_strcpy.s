section         .text
    global  ft_strcpy

    ft_strcpy:
        xor rax, rax
        mov r12, rdi

        start:
            mov al, byte [rsi]
            mov byte [rdi], al
            cmp byte [rsi], 0
            je end
            inc rdi
            inc rsi
            jmp start
        
        end:
            mov rax, r12
            ret
