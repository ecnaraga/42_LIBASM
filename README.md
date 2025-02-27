# 42_LIBASM

GOAL

    Write the following functions in Assembly and make a lib of it :
    - ft_read
    - ft_write
    - ft_strlen
    - ft_strcpy
    - ft_strcmp
    - ft_strdup
      
    And for bonus :
    - ft_atoi_base
    - ft_list_push_front
    - ft_list_size
    - ft_list_sort
    - ft_list_remove_if

TEST

    git clone git@github.com:ecnaraga/42_LIBASM.git && cd 42_LIBASM/test

To test the mandat functions with the main in assembly :

    make && ./asm_main
To test the mandat functions and ft_atoi_base with the main in C (more tests + error case tests) :

    make c_main_mandat && ./c_main_mandat

To test the bonus functions for linked list :
    
    make c_main_bonus && ./c_main_monus
