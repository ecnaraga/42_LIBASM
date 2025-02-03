section         .text
    global          ft_strcmp

ft_strcmp:
    xor rax, rax

    debut:
        CMP byte [rdi],0
        JE end
        CMP byte [rsi],0
        JE end
        MOV al, byte [rdi]
        CMP al, byte [rsi]
        JNE end
        INC rdi
        INC rsi
        JMP debut
    
    end:
        MOV al, byte [rdi]
        MOV cl, byte [rsi]
        sub al, cl
        movsx rax, al ;=> le signe de al soit "maj" dans rax
        ret
