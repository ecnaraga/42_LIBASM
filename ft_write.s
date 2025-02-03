section         .text
    global          ft_write
    extern          __errno_location

    error:
        MOV r10, rax
        call __errno_location wrt ..plt
        MOV [rax], r10
        MOV rax, -1
        ret

    ft_write:
        MOV rax, 1
        sub rsp, 8
        syscall
        add rsp, 8
        CMP rax, 0
        JL  error
        ret

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
;   => Une fois les arguments stockes et l'appel systeme defini, pour faire l'appel systeme on utilise l instruction syscall
