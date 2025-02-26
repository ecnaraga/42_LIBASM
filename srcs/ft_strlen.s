
section         .text
    global          ft_strlen

    ALIGN 16
    ft_strlen:
        PUSH rbp
        MOV rbp, rsp
        XOR rax,rax ; initialise rax a 0

        ALIGN 16
        debut:
            CMP byte [rdi],0 ; compare le byte pointe par rdi avec 0 (fin de chaine)
            JE  fin  ; si les deux valeurs sont egales -> on saute a fin
            INC rax ; increment rax (ici le compteur)
            INC rdi ; increment rdi (le pointeur pour passer au char svt dans la string)
            JMP debut ; jump au debut -> nouveau tour de boucle

        ALIGN 16
        fin:
            POP rbp
            RET ; Retourne toujours la valeur stockee dans le registre rax

; POINT DE COURS :

; XOR rax,rax   => Utilise la logique de la porte XOR :
;                   - si les 2 bits sont egaux, il set a 0
;                   - si 1 des deux est different, il set a 1
;               => idem MOV rax,0 (mais moins opti car XOR plus proche du processeur)
; rdi           => contient le premier argument donne a la fonction -> la chaine de caractere
;               => si on veut passer des arguments a une fonction, il faudra toujours mov
;                  le premier dans rdi avt de CALL la fonction 
; rax           => temp register - On y stocke notamment la valeur de retour

section .note.GNU-stack noalloc noexec nowrite progbits