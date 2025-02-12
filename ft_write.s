section         .text
    global          ft_write
    extern          __errno_location

    error:
        MOV r10, rax
        CALL __errno_location wrt ..plt
        MOV [rax], r10
        MOV rax, -1
        POP rbp
        RET

    ; 1er para rdi
    ; 2er para rsi string
    ; 3er para rcx len
    ft_write:
        PUSH rbp
        MOV rbp, rsp
        MOV rax, 1
        ; SUB rsp, 8
        SYSCALL
        ; ADD rsp, 8
        CMP rax, 0
        JL  error
        POP rbp
        RET

; POINT DE COURS :

; ft_write() fait un appel system appele sys_write decrit ci-dessous:
;   numero      nom                      3 arguments
;      1	    sys_write	unsigned int fd	| const char *buf | size_t count
;   => MOV rax, 1 : Le numero d un appel systeme doit toujours etre stocke dans rax
;   => Les arguments d'un appel systeme ou d'un appel a une fonction sont stockes dans :
;       - 1er argument : rdi
;       - 2eme argument : rsi
;       - 3eme argument : rdx
;       - 4eme argument : rcx => A verifier pour appel systeme
;       - 5eme argument : r8x
;       - 6eme argument : r9x
;   => Avant d appeler ft_write() ont ete stocke dans :
;       - rdi : le fd
;       - rsi : la string
;       - rdx : la len de la string
;   => Une fois les arguments stockes et l'appel systeme defini, pour faire l'appel systeme on utilise l instruction SYSCALL

section .note.GNU-stack noalloc noexec nowrite progbits