section         .text
    global main
    extern ft_strcmp
    extern ft_strlen   ; Déclare la fonction externe
    extern ft_write   ; Déclare la fonction externe
    extern printf    ; Déclare printf de la libc

_start:
    ;xor rax, rax

main:
    push rbp
    lea rdi, [rel strsrc]
    ;mov rdi, strsrc
    push rbp
    call ft_strlen ; Appelle la fonction ft_test()
    pop rbp
;
    mov rdi, 1
    ;mov rsi, strsrc
    lea rsi, [rel strsrc]
    ;mov rsi, strsrc
    mov rdx, rax
    push rbp
    call ft_write 
    pop rbp

    lea rdi, [rel strsrc]
    lea rsi, [rel strsrcc]
    push rbp
    call ft_strcmp
    pop rbp
    lea rdi, [rel format]
    mov rsi, rax
    call printf wrt ..plt

    ; Quitter proprement
    pop rbp
    mov rax, 60      ; syscall: exit
    xor rdi, rdi     ; code de retour = 0
    syscall

   ;mov rax, 0         ; Valeur de retour = 0 (success)
    ret

section .data
    format db "Résultat de ft_test : %ld", 10, 0  ; Format de printf
    strsrc db "aaaa", 0
    strsrcc db "aaaa", 0

; POINT DE COURS :

; STACK ALIGNMENT
; => According to the manual, a SIGSEGV is acaused when the source or
;       destination operand is a memory operand, the operand must be 
;       aligned on a 16-byte boundary or a general-protection exception 
;       (#GP) is generated.


; PIE : Position independent executable
;   => Type d executable qui va etre charge par le systeme a n'importe 
;       quel endroit de la memoire => Amelioration de la secu car ainsi
;       on ne peut pas savoir a l avance l'adresse du programme dans la memoire
;       et donc on limite les attaques dependant de la conaissance des addresses
;       memoires fixes 
;   => Par default, gcc -v de l ecole a l option : --enable-default-pie
;   => Il genere donc des objets PIE par default
;   => Pour compiler du code assembleur en PIE, il faut que le code position-independant,
;       pour cela il faut utiliser des addresses relatives (ce qui va permettre
;       a l executable d etre charge a n importe quelle adresse memoire) avec :
;       - la relocation : Quand on va charger des variables constantes vu qu on
;           ne sait pas a l'avance ou elles seront stockee, on va utiliser l instruction
;           lea rax
; lea rdi, [rel format]