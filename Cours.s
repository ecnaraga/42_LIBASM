Instruction :
mov	    => Permet de « bouger » des données d'un emplacement à un autre (espace mémoire ou registre processeur)
push	=> Sert à « pousser » des données sur la pile
pop	    => Permet de récupérer les données empilées via push

Les registres :

    Registres de travail :
    rax	    => Accumulateur => Sert aux opérations mathématiques mais aussi à la transmission des numéros de fonctions à appeler lorsqu'on se sert de l'interruption système 0x80 et au renvoi des résultats dans les fonctions (que nous aborderons au Chapitre 3). Lorsque vous devez utiliser un registre pour une opération quelconque et que vous ne savez pas lequel utiliser, privilégiez celui-ci — c'est le plus optimisé au niveau de la rapidité d'exécution des opérations.
    rbx	    => Base         => Utilisé pour l'adressage indirect
    rcx	    => Compteur     => Ce registre est utilisé chaque fois que l'assembleur a besoin d'un « compteur ». Nous devrons l'utiliser lorsque nous mettrons en place des boucles via l'instruction loop ou encore lorsque nous ferons des transferts de données entre esi et edi.
    rdx	    => Données      => Sert aussi pour quelques opérations mathématiques.

    Registres d'offset
    rsi	    => Source Index         => Utilisé lors des opérations sur les chaînes de caractères
    rdi	    => Destination Index	=> Comme esi, ce registre sert lors des opérations sur des chaînes de caractères.
    rbp	    => Base Pointer	        => Référence la base de la pile
    rip	    => Istruction Pointer	=> Ce registre est particulier car il ne peut pas être manipulé directement. Il pointe en permanence sur la prochaine opération à exécuter.
    rsp	    => Stack Pointer	    => Pointe vers le dernier élément déposé sur la pile (l'élément courant)

    Registre des flags : eflags est un registre 32 bits qui rend compte de l'état du processeur après chaque instruction
        On n'accède jamais à ce registre dans son intégralité, mais toujours bit par bit lorsqu'on veut une information bien précise sur, par exemple, le résultat d'une comparaison ou d'une opération arithmétique.

Boucles :
    Boucle while : 
            XOR rax,rax   ; Declare une variable ax 
	    debut:
	    	CMP rax,10   ; Comparaison de ax et de la valeur 10
	    	jae fin     ; Test si le terme de gauche est superieur ou = au terme de droite => si oui on va direct au label fin
	    	INC rax      ; On increment ax de 1
	    	JMP debut   ; On jump au debut de la boucle
	    fin:

    Boucle do ... while :
            XOR rax,rax
        debut:
            INC rax
            CMP rax,10
            jb  debut   ; On test si le terme de gauche est plus petit que le terme de droite => si oui on revient au debut

    Boucle for :
            MOV rcx,10  ; On stocke dans le registre de travail compteur le nb d'iteration a accomplir (10)
        debut:
            nop         ; On ne fait rien
            loop debut  ; L'instruction loop va s executer tant que il reste des iterations a accomplir dans le compteur et decrementer le compteur automatiquement a chaque passage 
