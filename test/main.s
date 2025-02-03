section         .text
    global main
    extern ft_strcmp
    extern ft_strlen   ; Déclare la fonction externe
    extern ft_write   ; Déclare la fonction externe
    extern ft_strcpy
    extern printf    ; Déclare printf de la libc

_start:
    ;xor rax, rax

main:
    PUSH rbp
    LEA rdi, [rel strsrc]
    PUSH rbp
    call ft_strlen; Appelle la fonction ft_test()
    POP rbp

    MOV rdi, 1
    LEA rsi, [rel strsrc]
    MOV rdx, rax
    PUSH rbp
    call ft_write
    POP rbp

    LEA rdi, [rel strsrc]
    LEA rsi, [rel strsrcc]
    PUSH rbp
    call ft_strcmp
    POP rbp
    LEA rdi, [rel format]
    MOV rsi, rax
    call printf wrt ..plt

    LEA rdi, [rel strsrc]
    LEA rsi, [rel strsrcc]
    PUSH rbp
    call ft_strcpy
    POP rbp
    MOV rdi, 1
    MOV rsi, rax
    MOV rdx, 9
    PUSH rbp
    call ft_write
    POP rbp

    MOV rdi, 0
    LEA rsi, [rel array]
    MOV RCX, 10
    push rbp
    call ft_read
    pop rbp
    

    ; Quitter proprement
    POP rbp
    MOV rax, 60      ; syscall: exit
    xor rdi, rdi     ; code de retour = 0
    syscall

   ;MOV rax, 0         ; Valeur de retour = 0 (success)
    ret

section .data
    format db "Résultat de ft_test : %d", 10, 0  ; Format de printf
    strsrc  db "abcdefgh", 10, 0
    strsrcc db "mnopqrst", 10, 0
    array TIMES 10 db 0

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
;       - la relocation : Quand on va charger des variables constantes (qui sont
;           dans la section.data) vu qu on ne sait pas a l'avance ou elles seront stockee,
;           on va utiliser l instruction :
;           LEA rax, [rel ma_variable] => charger dans le registre l adresse de ma_variable
;               lors du linkage final
;           => cf ci-dessous : diff LEA et MOV
;       - Par un appel indirect d'une fonction via la PLT :
;           call printf wrt ..plt OU call printf@plt => le linker dynamique va chercher la 
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