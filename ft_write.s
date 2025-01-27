section         .text:
    global          ft_write

ft_write:
    xor rax, rax
    ;mov rdi, 1
    ;mov rsi, strsrc
    ;mov rdx, 1
    mov rax, 1
    syscall
    ret

;section .data
;    strsrc db "f", 0
;
;
;    gdp prog
;
;    tui enable -> interface graphique
;    layout asm -> afficher asm
;    layout reg -> afficher contenu registre
;    b main ou b ft_write => def breakpoint
;    r -> run
;    c -> continue jusqu au segfault ou prochain break point 