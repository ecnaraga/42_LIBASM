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

    t_list *begin = NULL;
	
	// TEST ft_list_push_front + ft_list_size
	printf("TEST ft_list_push_front + ft_list_size\n\n");
	ft_list_push_front(NULL, NULL);
	printf("size of begin = %d\n", ft_list_size(begin));
	
	ft_list_push_front(&begin, NULL);
	printf("size of begin = %d\n", ft_list_size(begin));
	
	int array[] = {10, 11, 12, 13};
	void *data = ft_lstnew(&array[0]);
	ft_list_push_front(NULL, data);
	free(data);
	
	for (int i = 0; i < 4; i++) {
		void *data = ft_lstnew(&array[i]);
    	ft_list_push_front(&begin, data);
		// ft_list_sort(&begin, &ft_cmp); // TO TEST ft_list_sort on lis t_size of 1
}

	ft_list_push_front(&begin, NULL);
	
	t_list *tmp = begin;
	printf("Print_list\n");
	while (begin) {
		printf("%d\n", *(int*)(begin->data));
		begin = begin->next;
	}
	begin = tmp;
	printf("size of begin = %d\n", ft_list_size(begin));

	printf("\nTEST ft_list_sort\n\n");

	ft_list_sort(NULL, &ft_cmp);
    t_list *tmpp = NULL;
	ft_list_sort(&tmpp, &ft_cmp);
	ft_list_sort(NULL, NULL);

	ft_list_sort(&begin, &ft_cmp);
	tmp = begin;
	while (begin) {
		printf("%d\n", *(int*)(begin->data));
		begin = begin->next;
	}
	begin = tmp;
	ft_list_sort(NULL, &ft_cmp);

	int a = 11;
	ft_list_remove_if(&begin, &a, ft_cmp, free_fct);
	printf("\n");
	while (begin) {
		tmp = begin;
		printf("%d\n", *(int*)(begin->data));
		begin = begin->next;
		free(tmp);
	}
}

