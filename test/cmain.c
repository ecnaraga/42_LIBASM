#include "stdlib.h"
#include "stdio.h"

typedef struct s_list
{
void *data;
struct s_list *next;
} t_list;

void    ft_list_push_front(t_list **begin_list, void *data);
int    	ft_list_size(t_list *begin_list);
void    ft_list_sort(t_list **begin_list, int (*ft_cmp)());
void    ft_list_remove_if(t_list **begin_list, void	*data_ref, int (*ft_cmp)(), void(*free_fct)(void *));

t_list	*ft_lstnew(void *content)
{
	t_list	*temp;

	temp = 0;
	temp = malloc(sizeof(t_list));
	if (!temp)
		return (0);
	temp -> data = content;
	temp -> next = 0;
	return (temp);
}

int	ft_lstsize(t_list *lst)
{
	int	count;

	count = 0;
	while (lst)
	{
		count ++;
		lst = lst -> next;
	}
	return (count);
}

extern int ft_cmp(int data, int value) {
	if (data > value)
		return 1;
	if (data < value)
		return -1;
	return 0;
}

extern void free_fct(void *elem __attribute__((unused))) {
	printf("free\n");
}

int main(int ac __attribute__((unused)), char **av __attribute__((unused))) {

    t_list *begin = 0;
	int array[] = {10, 11, 12, 13};
	for (int i = 0; i < 4; i++) {
		void *data = ft_lstnew(&array[i]);
    	ft_list_push_front(&begin, data);
	}
	t_list *tmp = begin;
	while (begin) {
		printf("%d\n", *(int*)(begin->data));
		begin = begin->next;
	}
	begin = tmp;

	// printf("size of begin = %d\n", ft_lstsize(begin));
	printf("begin = %p\n", begin);
	printf("size of begin = %d\n", ft_list_size(begin));
	printf("begin = %p\n", begin);
	printf("%p\n", &begin); //0x7fffffffde00 rdi
	printf("%p\n", begin); //0x5555555592e0 rbx
	printf("%p\n", begin->data); //0x7fffffffddfc rax
	printf("%d\n", *(int *)begin->data); //124
	printf("%p\n", ft_cmp); //0x7fffffffde00 rdi
	ft_list_sort(&begin, &ft_cmp);
	tmp = begin;
	while (begin) {
		printf("%d\n", *(int*)(begin->data));
		begin = begin->next;
	}
	begin = tmp;

	int a = 11;
	ft_list_remove_if(&begin, &a, ft_cmp, free_fct);
	printf("\n");
	while (begin) {
		printf("%d\n", *(int*)(begin->data));
		begin = begin->next;
	}
}

/*
0x5555555592e0
*/