section         .text
    global main
    extern ft_strcmp
    extern ft_strlen   ; Déclare la fonction externe
    extern ft_write   ; Déclare la fonction externe
    extern printf    ; Déclare printf de la libc

_start:
    ;xor rax, rax

main:
    mov rdi, strsrc
    call ft_strlen    ; Appelle la fonction ft_test()

    mov rdi, 1
    mov rsi, strsrc
    mov rdx, rax
    call ft_write

    mov rdi, strsrc
    mov rsi, strsrcc
    call ft_strcmp
    mov rdi, format
    mov rsi, rax
    xor rax, rax
    ;call printf

    ; Quitter proprement
    mov rax, 60      ; syscall: exit
    xor rdi, rdi     ; code de retour = 0
    syscall

   ;mov rax, 0         ; Valeur de retour = 0 (success)
    ret

section .data
    format db "Résultat de ft_test : %ld", 10, 0  ; Format de printf
    strsrc db "aaaa", 0
    strsrcc db "aaaa", 0