#include "stdlib.h"
#include "stdio.h"

typedef struct s_list
{
void *data;
struct s_list *next;
} t_list;

void    ft_list_push_front(t_list **begin_list, void *data);
int    ft_list_size(t_list *begin_list);

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

int main(int ac __attribute__((unused)), char **av __attribute__((unused))) {

    t_list *begin = 0;
    int a = 10;
    void *data = ft_lstnew(&a);
    ft_list_push_front(&begin, data);
    int b = 11;
	data = ft_lstnew(&b);
    ft_list_push_front(&begin, data); // 0x00007fffffffdba8
    int c = 124;
	data = ft_lstnew(&c);
    ft_list_push_front(&begin, data);

	t_list *tmp = begin;
	while (begin) {
		printf("%d\n", *(int*)(begin->data));
		begin = begin->next;
	}
	begin = tmp;

	// printf("size of begin = %d\n", ft_lstsize(begin));
	printf("begin = %p\n", begin);
	printf("size of begin = %d\n", ft_list_size(begin));
}

/*
0x5555555592e0


*/