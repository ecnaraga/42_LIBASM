
section         .text
        global          _start
        extern  printf

_start:
        xor rax,rax ; ca permet de mettre la valeur 0 dans registre rax => idem xor rax,0
        mov rdi, strsrc

debut:
        cmp byte [rdi],0
        je fin
        inc rax
        inc rdi
        jmp debut

fin:
        mov rax, rax
        ret
        ;mov rdi, format
        ;mov rsi, rax
        ;xor rax, rax
        ;call printf
        ;mov rax, 60             
        ;xor rdi, rdi           
        ;syscall                 

section .data
        strsrc db "premiere chaine", 0
        format db "La longueur de la chaîne est : %ld", 0x0A, 0 ; 0x0A ou 10 pour le \n, 0 pour le \0
        formatt db "%d", 10, 0