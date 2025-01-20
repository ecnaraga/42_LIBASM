
section         .text
        global          _start
        extern  printf

_start:
        xor rax,rax
        mov rdi, strsrc

debut:
        cmp byte [rdi],0
        je fin
        inc rax
        inc rdi
        jmp debut

fin:
        ;mov rdi , format
        ;mov rsi , rax
        ;xor rax,rax
        ;call printf
        mov rax, 60             
        xor rdi, rdi           
        syscall                 

section .data
        strsrc db "premiere chaine",0x0A,0
        format db "La longueur de la chaîne est : %ld", 10, 0