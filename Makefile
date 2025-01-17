NAME = libasm.a
AS = nasm
ASFLAGS = -f elf64

SRCS = ft_strlen.s
OBJS = $(SRCS:.s=.o)
OBJS_BONUS = $(SRCS_BONUS:.s=.o)

#################################### RULE ######################################

all : $(NAME)

%.o:%.s
	$(AS) $(ASFLAGS) -o $@ $<

$(NAME) : $(OBJS)
	ar -rcs $@ $(OBJS)

bonus :

clean :
	rm -f *.o

fclean : clean
	rm $(NAME)

re : fclean
	make all

.PHONY : bonus, clean, fclean, re
