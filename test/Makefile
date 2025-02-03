NAME = testing_libasm
AS = nasm
ASFLAGS = -f elf64 -g -F dwarf
CC = gcc
SRCS = main.s
INC_LIB = libasm.a
OBJS = $(SRCS:.s=.o)

#################################### RULE ######################################

all : $(NAME)

%.o : %.s
	$(AS) $(ASFLAGS) -o $@ $<

$(NAME) : $(OBJS)
	make -C .. all
	$(CC) -g $(OBJS) -L .. -lasm -o $@

clean :
	make -C .. clean
	rm -f *.o

fclean : clean
	make -C .. fclean
	rm -f $(NAME)

re : fclean
	make all