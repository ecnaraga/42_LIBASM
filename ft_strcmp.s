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
        mov al, byte [rdi]
        cmp al, byte [rsi]
        jne  end
        inc rdi
        inc rsi
        jmp debut
    
    end:
        mov al, byte [rdi]
        mov cl, byte [rsi]
        sub al, cl
        movsx rax, al ;=> le signe de al soit "maj" dans rax
        ret
