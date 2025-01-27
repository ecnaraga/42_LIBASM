
section         .text
    global          ft_strlen

ft_strlen:
    xor rax,rax ; initialise rax a 0

    debut:
        cmp byte [rdi],0 ; compare le byte pointe par rdi avec 0 (fin de chaine)
        je fin  ; si les deux valeurs sont egales -> on saute a fin
        inc rax ; increment rax (ici le compteur)
        inc rdi ; increment rdi (le pointeur pour passer au char svt dans la string)
        jmp debut ; jump au debut -> nouveau tour de boucle

    fin:
        ret ; Retourne toujours la valeur stockee dans le registre rax

; POINT DE COURS :

; xor rax,rax   => Utilise la logique de la porte XOR :
;                   - si les 2 bits sont egaux, il set a 0
;                   - si 1 des deux est different, il set a 1
;               => idem mov rax,0 (mais moins opti car xor plus proche du processeur)
; rdi           => contient le premier argument donne a la fonction -> la chaine de caractere
;               => si on veut passer des arguments a une fonction, il faudra toujours mov
;                  le premier dans rdi avt de call la fonction 
; rax           => temp register - On y stocke notamment la valeur de retour
