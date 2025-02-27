section         .text
    align 16
    global main
    extern ft_strcmp
    extern ft_strlen   ; Déclare la fonction externe
    extern ft_write   ; Déclare la fonction externe
    extern ft_strcpy
    extern ft_strdup
    extern ft_read
    extern ft_atoi_base
    extern printf    ; Déclare printf de la libc
    extern free

;_start:
    ;PUSH rbp ; => Save the rbp pointer on the stack
    ;JMP main

ALIGN 16
main:
    PUSH rbp ; => Save the rbp pointer on the stack
    MOV rbp, rsp
    ; Call ft_strlen
    LEA rdi, [rel strsrc]
    CALL ft_strlen; Appelle la fonction ft_test()

    ; Call printf to print ret ft_strlen
    LEA rdi, [rel f_ft_strlen]
    MOV rsi, rax
    PUSH rax
    SUB rsp, 8
    CALL printf wrt ..plt
    ADD rsp, 8
    POP rax

    ; Call ft_write to print on sdtdout
    MOV rdi, 1
    LEA rsi, [rel strsrc]
    MOV rdx, rax
    CALL ft_write

    ; Call printf to print ret ft_write
    LEA rdi, [rel f_ft_write]
    MOV rsi, rax
    PUSH rax
    SUB rsp, 8
    CALL printf wrt ..plt
    ADD rsp, 8
    POP rax

    ; Call ft_write to check ret -1
    MOV rdi, -1
    LEA rsi, [rel strsrc]
    CALL ft_write

    ; Call printf to print ret ft_write
    LEA rdi, [rel f_ft_write]
    MOV rsi, rax
    PUSH rax
    SUB rsp, 8
    CALL printf wrt ..plt
    ADD rsp, 8
    POP rax

    ; Call ft_strcmp
    LEA rdi, [rel strsrc]
    LEA rsi, [rel strsrcc]
    CALL ft_strcmp

    ; Call printf to print ret ft_strcmp
    LEA rdi, [rel f_ft_strcmp]
    MOV rsi, rax
    CALL printf wrt ..plt

    ; Call ft_strcpy
    LEA rdi, [rel strsrc]
    LEA rsi, [rel strsrcc]
    PUSH rdi ; Sauvegarde du registre par l appelant
    PUSH rsi ; Sauvegarde du registre par l appelant
    CALL ft_strcpy
    POP rsi ; Restauration du registre par l appelant
    POP rdi ; Restauration du registre par l appelant

    PUSH rdi

    ; Call ft_write to print ret ft_strcpy on sdtdout
    MOV rdi, 1
    MOV rsi, rax
    MOV rdx, 9
    SUB rsp, 8
    CALL ft_write
    ADD rsp, 8

    POP rdi

    ; Call ft_write to print ret ft_strcpy on sdtdout
    MOV rsi, rdi
    MOV rdi, 1
    CALL ft_write

    ; Call ft_write to print ret ft_strcpy on sdtdout
    LEA rsi, [rel strsrc]
    CALL ft_write

    ; Call printf to print ret ft_write
    LEA rdi, [rel f_ft_write]
    MOV rsi, rax
    CALL printf wrt ..plt

    ; Call ft_read on stdin
    XOR rdi, rdi
    LEA rsi, [rel buffer]
    MOV rdx, 9
    CALL ft_read
    
    ; Call ft_write to print rsi on stdout
    MOV rdi, 1
    MOV rdx, 9
    CALL ft_write

    ; Call ft_write to print buffer on sdtdout
    LEA rsi, [rel buffer]
    CALL ft_write

    ; Call ft_strdup on strsrc
    LEA rdi, [rel strsrccc]
    CALL ft_strdup

    ; Call ft_strlen on ret ft_strdup
    PUSH rax
    MOV rdi, rax
    SUB rsp, 8
    CALL ft_strlen
    ADD rsp, 8

    ; Call printf to print ret ft_strlen
    LEA rdi, [rel f_ft_strlen]
    MOV rsi, rax
    PUSH rax
    CALL printf wrt ..plt
    POP rax

    ; Call ft_write to print ret of ft_strdup on stdout
    MOV rdi, 1
    MOV rdx, rax
    POP rax
    MOV rsi, rax
    CALL ft_write
    MOV rdi, rsi
    CALL free wrt ..plt
    
    ; Call ft_atoi_base
    LEA rdi, [rel str_int]
    LEA rsi, [rel base]
    PUSH rdi
    PUSH rsi
    PUSH rdx
    SUB rsp, 8
    CALL ft_atoi_base
    ADD rsp, 8
    POP rdx
    POP rsi
    POP rdi

    ; PUSH rdi
    ; Call printf to print ret ft_write
    LEA rdi, [rel f_ft_atoi_base]
    MOV rsi, rax
    ; ALIGN 8
    CALL printf wrt ..plt
    ; POP rdi

    ; Quitter proprement
    POP rbp ; => Restor the rbp pointer
    MOV rax, 60      ; SYSCALL: exit
    XOR rdi, rdi     ; code de retour = 0
    SYSCALL

    ;MOV rax, 0         ; Valeur de retour = 0 (success)
    ;ret

section .data align=16
    f_ft_strlen db "Résultat de ft_strlen : %d", 10, 0  ; Format de printf
    f_ft_write db "Résultat de ft_write : %d", 10, 0  ; Format de printf
    f_ft_strcmp db "Résultat de ft_strcmp : %d", 10, 0  ; Format de printf
    f_ft_atoi_base db "Résultat de ft_atoi_base : %d", 10, 0  ; Format de printf
    ; strsrc  db 0
    strsrc  db "abcdefgh", 10, 0
    strsrcc db 1, 10, 0
    strsrccc  db "abcdefgh", 10, 0
    str_int db "    -123A", 0
    base db "0123456789A", 0
    buffer TIMES 10 db 0 ; Declare an array of size 10 filled with 0

; POINT DE COURS :

; STACK ALIGNMENT
; => According to the manual, a SIGSEGV is acaused when the source or
;       destination operand is a memory operand, the operand must be 
;       aligned on a 16-byte boundary or a general-protection exception 
;       (#GP) is generated.
; => ABI doc :  the stack needs to be 16 (32 or 64) byte aligned immediately before the call
;   instruction is executed. Once control has been transferred to the function entry point, i.e.
;   immediately after the return address has been pushed, %rsp points to the return address,
;   and the value of (%rsp + 8) is a multiple of 16 (32 or 64).
; => SO before calling a function, rsp % 16 HAS TO BE EQUAL TO 0 

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
;       - la relocation : Quand on va charger des variables constantes (qui sont
;           dans la section.data) vu qu on ne sait pas a l'avance ou elles seront stockee,
;           on va utiliser l instruction :
;           LEA rax, [rel ma_variable] => charger dans le registre l adresse de ma_variable
;               lors du linkage final
;           => cf ci-dessous : diff LEA et MOV
;       - Par un appel indirect d'une fonction via la PLT :
;           CALL printf wrt ..plt OU CALL printf@plt => le linker dynamique va chercher la 
;               vraie adresse de printf via la PLT (Procedure Linkage Table)
;           1. A la compilation : nasm enregistre un appel dans la PLT pour appeler printf a l exec 
;               => adresse de printf non connue, il indique de resoudre plus tard
;           2. Au linkage : Preparation de la PLT et de la GOT (Global Offset Table)
;               - PLT : contient du code qui permettra de jump vers la GOT puis si besoin
;                   vers le linker dynamique (qui entre en jeu a l execution)
;               - GOT : contient le pointeur vers le linker dynamique et plus tard pointeurs vers
;                   les adresses réelles des fonctions, qui seront renseignés à l'exécution.
;           3. A l execution 1er appel: execute le code dans la PLT, le linker dynamique stocke alors
;               dans la GOT l adresse reel de printf et l execute
;           4. A l execution appels suivants: la PLT fait appel directement a printf via la GOT
;               => Pas d 'appel au linker dynamique
;   => diff LEA et MOV :
;       - LEA : nasm comprend qu il s'agit d une relocation relatives (adresse memoire relative)
;           => il va calculer l adresse memoire ou se trouve la variable, sans lire la memoire
;       - MOV : nasm place d'une relocation absolue (depend d'une adresse memoire fixe)
;           => il va lire a l adresse memoire de la variable sans calcul d adresse
;       En contexte PIE pour acceder a la valeur contenu a une adresse memoire:
;           LEA rax, [rel ma_variable] (calcul adresse)
;           MOV rbx, [rax] (lecture memoire)
;       En contexte non PIE pour acceder a la valeur contenu a une adresse memoire:
;           MOV rbx, ma_variable (pas besoin de calcul adresse lecture memmoire direct)

section .note.GNU-stack noalloc noexec nowrite progbits