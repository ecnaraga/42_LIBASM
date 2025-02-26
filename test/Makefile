NAME = asm_main
NAME1 = c_main_mandat
NAME2 = c_main_bonus
AS = nasm
ASFLAGS = -f elf64 -g -F dwarf
CC = gcc
CFLAGS = -Wall -Wextra -Werror -g
SRCS = main.s
SRCS_MANDAT =	main.c
SRCS_BONUS =	main_linked_list.c
INC_LIB = libasm.a

OBJS = $(SRCS:.s=.o)
OBJS_MANDAT = $(SRCS_MANDAT:.s=.o)
OBJS_BONUS = $(SRCS_BONUS:.c=.o)

#################################### RULE ######################################

all : $(NAME)

%.o : %.s
	$(AS) $(ASFLAGS) -o $@ $<

%.o : %.c
#	$(CC) -c $(CFLAGS) -L .. -lasm_bonus  -o $@ $<
	$(CC) -c -L .. -lasm_bonus  -o $@ $<

$(NAME) : $(OBJS)
	make -C .. all
	make -C .. bonus
	$(CC) -g $(OBJS) -L .. -lasm -lasm_bonus -o $@

$(NAME1): $(OBJS_MANDAT)
	make -C .. bonus
# 	$(CC) $(CFLAGS) $(OBJS_MANDAT) -L .. -lasm_bonus -o $@
	$(CC) $(OBJS_MANDAT) -L .. -lasm_bonus -o $@

$(NAME2): $(OBJS_BONUS)
	make -C .. bonus
#	$(CC) $(CFLAGS) $(OBJS_BONUS) -L .. -lasm_bonus -o $@
	$(CC) $(OBJS_BONUS) -L .. -lasm_bonus -o $@

clean :
	make -C .. clean
	rm -f *.o

fclean : clean
	make -C .. fclean
	rm -f $(NAME)
	rm -f $(NAME1)
	rm -f $(NAME2)

re : fclean
	make all