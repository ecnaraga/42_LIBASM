section         .text
    global ft_list_push_front

    ; rdi = adresse de l'adresse de la liste
    ; [rdi] = adresse de la liste
    ; rsi = adresse de l'elem a ajouter
    ; [rsi + 8] = adresse du prochain elem stocke dans l' elem
    ALIGN 16
    ft_list_push_front:
        PUSH rbp
        MOV rbp, rsp
        CMP rsi, 0
        JE end
        CMP rdi, 0
        JE end
        MOV r8, [rdi]
        MOV [rsi + 8], r8
        MOV [rdi], rsi
        ALIGN 16
        end:
            POP rbp
            RET