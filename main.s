section         .text
    global main
    extern ft_test   ; Déclare la fonction externe
    extern printf    ; Déclare printf de la libc

main:
    call ft_test     ; Appelle la fonction ft_test()
    
    ; Préparer l'appel à printf
    mov rdi, format  ; 1er argument : adresse du format string
    mov rsi, rax     ; 2e argument : valeur retournée par ft_test()
    xor rax, rax     ; Remettre rax à 0 (nécessaire pour printf)
    call printf      ; Appel de printf

    ; Quitter proprement
    mov rax, 60      ; syscall: exit
    xor rdi, rdi     ; code de retour = 0
    syscall

    ;mov rax, 0         ; Valeur de retour = 0 (success)
    ;ret

section .data
    format db "Résultat de ft_test : %d", 10, 0  ; Format de printf
