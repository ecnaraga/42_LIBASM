section         .text
    global          ft_strcmp
    extern printf

ft_strcmp:
    xor rax, rax

    debut:
        cmp byte [rdi],0
        je end
        cmp byte [rsi],0
        je end
        mov al, [rdi]
        cmp al, byte [rsi]
        jne  end
        inc rdi
        inc rsi
        jmp debut
    
    end:
        mov rax, [rdi]
        mov rbx, [rsi]
        sub rax, rbx
        ret
