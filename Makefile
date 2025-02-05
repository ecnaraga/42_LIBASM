NAME = libasm.a
AS = nasm
ASFLAGS = -f elf64 -g -F dwarf
CC = gcc -g


SRCS = ft_strlen.s \
		ft_write.s \
		ft_strcmp.s \
		ft_strcpy.s \
		ft_read.s \
		ft_strdup.s

SRCS_BONUS = ft_atoi_base.s

OBJS = $(SRCS:.s=.o)
OBJS_BONUS = $(SRCS_BONUS:.s=.o)

#################################### RULE ######################################

all : $(NAME)

%.o:%.s
	$(AS) $(ASFLAGS) -o $@ $<

$(NAME) : $(OBJS)
	ar -rcs $@ $(OBJS)

bonus : $(OBJS) $(OBJS_BONUS)
	ar -rcs $@ $(OBJS) $(OBJS_BONUS)

clean :
	rm -f *.o

fclean : clean
	rm -f $(NAME)

re : fclean
	make all

.PHONY : bonus, clean, fclean, re
