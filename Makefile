NAME = libasm.a
NAME_BONUS = libasm_bonus.a
AS = nasm
ASFLAGS = -f elf64 -g -F dwarf
CC = gcc -g

SRCS = 	ft_strlen.s \
		ft_write.s \
		ft_strcmp.s \
		ft_strcpy.s \
		ft_read.s \
		ft_strdup.s

SRCS_DIR = srcs/

SRCS_BONUS =	ft_atoi_base.s \
				ft_list_push_front.s \
				ft_list_size.s \
				ft_list_sort.s \
				ft_list_remove_if.s

SRCS_BONUS_DIR = srcs_bonus/

OBJS_DIR = .objs/
OBJS_FILES = $(SRCS:.s=.o)
OBJS = $(addprefix $(OBJS_DIR), $(OBJS_FILES))

OBJS_BONUS_DIR = .objs_bonus/
OBJS_BONUS_FILES = $(SRCS_BONUS:.s=.o)
OBJS_BONUS = $(addprefix $(OBJS_BONUS_DIR), $(OBJS_BONUS_FILES))

#################################### RULE ######################################

all : $(NAME)

$(OBJS_DIR)%.o:$(SRCS_DIR)%.s
	mkdir -p $(@D)
	$(AS) $(ASFLAGS) -o $@ $<

$(OBJS_BONUS_DIR)%.o:$(SRCS_BONUS_DIR)%.s
	mkdir -p $(@D)
	$(AS) $(ASFLAGS) -o $@ $<

$(NAME) : $(OBJS)
	ar -rcs $@ $(OBJS)

bonus : $(NAME_BONUS)

$(NAME_BONUS) : $(OBJS) $(OBJS_BONUS)
	ar -rcs $@ $(OBJS) $(OBJS_BONUS)

clean :
	rm -rf $(OBJS_DIR)
	rm -rf $(OBJS_BONUS_DIR)

fclean : clean
	rm -f $(NAME)
	rm -f $(NAME_BONUS)

re : fclean
	make all

.PHONY : bonus, clean, fclean, re
