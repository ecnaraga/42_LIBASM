NAME = testing_libasm
AS = nasm
ASFLAGS = -f elf64 -g -F dwarf
CC = gcc
CFLAGS = -Wall -Wextra -Werror -g
SRCS = main.s
SRCS_BONUS =	cmain.c
INC_LIB = libasm.a
OBJS = $(SRCS:.s=.o)
OBJS_BONUS = $(SRCS_BONUS:.c=.o)

#################################### RULE ######################################

all : $(NAME)

%.o : %.s
	$(AS) $(ASFLAGS) -o $@ $<

%.o : %.c
	$(CC) -c $(CFLAGS) -L .. -lasm_bonus  -o $@ $<

$(NAME) : $(OBJS)
	make -C .. all
	make -C .. bonus
	$(CC) -g $(OBJS) -L .. -lasm -lasm_bonus -o $@

main_c: $(OBJS_BONUS)
	make -C .. bonus
	$(CC) $(CFLAGS) $(OBJS_BONUS) -L .. -lasm_bonus -o linked_list

clean :
	make -C .. clean
	rm -f *.o

fclean : clean
	make -C .. fclean
	rm -f $(NAME)
	rm -f linked_list

re : fclean
	make all