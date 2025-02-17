#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>

// TO DO :
// - Checker alignement rsp
// - Checker registre sont correctement enregistre
// - retour int, sise_t, ssize_t => bon registre utilise? nombre de bit
// - errno set correctement ft_write et ft_read?

ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
size_t ft_strlen(const char *s);
char *ft_strdup(const char *s);
char *ft_strcpy(char *dest, const char *src);
int ft_strcmp(const char *s1, const char *s2);
int ft_atoi_base(char *str, char *base);

int main(int ac __attribute__((unused)), char **av __attribute__((unused))) {
    char *title = "\e[36m";
    char *line = "\e[31m";
    char *reset = "\e[0m";
    int file_fd = open("./filetest.txt", O_CREAT | O_APPEND | O_RDWR);

    // printf("%sTEST FT_WRITE%s\n", title, reset);
    // for (int fd = -1; fd <= file_fd + 1; fd++) {
    //     printf("\n");
    //     errno = 0;
    //     ssize_t ret = ft_write(fd, "Hello World\n", ft_strlen("Hello World\n"));
    //     printf("Retour de ft_write = %ld\n", ret);
    //     printf("errno = %d\n", errno);
    // }
    // {
    //     printf("\n");
    //     errno = 0;
    //     ssize_t ret = ft_write(1, "Hello", 7);
    //     printf("Retour de ft_write = %ld\n", ret);
    //     printf("errno = %d\n", errno);
    // }
    // {
    //     printf("\n");
    //     errno = 0;
    //     ssize_t ret = ft_write(1, "Hello", 1);
    //     printf("Retour de ft_write = %ld\n", ret);
    //     printf("errno = %d\n", errno);
    // }
    // {
    //     printf("\n");
    //     errno = 0;
    //     ssize_t ret = ft_write(1, NULL, 0);
    //     printf("Retour de ft_write = %ld\n", ret);
    //     printf("errno = %d\n", errno);
    // }
    // {
    //     printf("\n");
    //     errno = 0;
    //     ssize_t ret = ft_write(1, NULL, 1);
    //     printf("Retour de ft_write = %ld\n", ret);
    //     printf("errno = %d\n", errno);
    // }
    // printf("%s\n  SAME TEST WITH WRITE%s\n", title, reset);
    // for (int fd = -1; fd <= file_fd + 1; fd++) {
    //     printf("\n");
    //     errno = 0;
    //     ssize_t ret = write(fd, "Hello World\n", ft_strlen("Hello World\n"));
    //     printf("Retour de write = %ld\n", ret);
    //     printf("errno = %d\n", errno);
    // }
    // {
    //     printf("\n");
    //     errno = 0;
    //     ssize_t ret = write(1, "Hello", 7);
    //     printf("Retour de write = %ld\n", ret);
    //     printf("errno = %d\n", errno);
    // }
    // {
    //     printf("\n");
    //     errno = 0;
    //     ssize_t ret = write(1, "Hello", 1);
    //     printf("Retour de write = %ld\n", ret);
    //     printf("errno = %d\n", errno);
    // }
    // {
    //     printf("\n");
    //     errno = 0;
    //     ssize_t ret = write(1, NULL, 0);
    //     printf("Retour de write = %ld\n", ret);
    //     printf("errno = %d\n", errno);
    // }
    // {
    //     printf("\n");
    //     errno = 0;
    //     ssize_t ret = write(1, NULL, 1);
    //     printf("Retour de write = %ld\n", ret);
    //     printf("errno = %d\n", errno);
    // }

    // printf("%s\n***************************************************************************************************\n\n%s", line, reset);

    // char buffer[1024];

    // printf("%sTEST FT_READ%s\n", title, reset);
    // close(file_fd);
    // file_fd = open("./filetest.txt", O_CREAT | O_APPEND | O_RDWR);
    // for (int fd = -1; fd <= file_fd + 1; fd++) {
    //     printf("\n");
    //     errno = 0;
    //     memset(buffer, 0, 1024);
    //     ssize_t ret = ft_read(fd, buffer, 1023);
    //     printf("Retour de ft_read = %ld\n", ret);
    //     printf("buffer = %s\n", buffer);
    //     printf("errno = %d\n", errno);
    // }
    // close(file_fd);
    // file_fd = open("./filetest.txt", O_CREAT | O_APPEND | O_RDWR);
    // {
    //     printf("\n");
    //     errno = 0;
    //     memset(buffer, 0, 1024);
    //     ssize_t ret = ft_read(file_fd, buffer, 0);
    //     printf("Retour de ft_read = %ld\n", ret);
    //     printf("buffer = %s\n", buffer);
    //     printf("errno = %d\n", errno);
    // }
    // close(file_fd);
    // file_fd = open("./filetest.txt", O_CREAT | O_APPEND | O_RDWR);
    // {
    //     printf("\n");
    //     errno = 0;
    //     memset(buffer, 0, 1024);
    //     ssize_t ret = ft_read(file_fd, buffer, -1);
    //     printf("Retour de ft_read = %ld\n", ret);
    //     printf("buffer = %s\n", buffer);
    //     printf("errno = %d\n", errno);
    // }
    // close(file_fd);
    // file_fd = open("./filetest.txt", O_CREAT | O_APPEND | O_RDWR);
    // {
    //     printf("\n");
    //     errno = 0;
    //     memset(buffer, 0, 1024);
    //     ssize_t ret = ft_read(file_fd, buffer, 1025);
    //     printf("Retour de ft_read = %ld\n", ret);
    //     printf("buffer = %s\n", buffer);
    //     printf("errno = %d\n", errno);
    // }
    // close(file_fd);
    // file_fd = open("./filetest.txt", O_CREAT | O_APPEND | O_RDWR);
    // {
    //     printf("\n");
    //     errno = 0;
    //     ssize_t ret = ft_read(file_fd, NULL, 1023);
    //     printf("Retour de ft_read = %ld\n", ret);
    //     printf("buffer = %s\n", buffer);
    //     printf("errno = %d\n", errno);
    // }
    // close(file_fd);
    // file_fd = open("./filetest.txt", O_CREAT | O_APPEND | O_RDWR);
    // {
    //     printf("\n");
    //     errno = 0;
    //     ssize_t ret = ft_read(file_fd, NULL, 0);
    //     printf("Retour de ft_read = %ld\n", ret);
    //     printf("buffer = %s\n", buffer);
    //     printf("errno = %d\n", errno);
    // }
    // close(file_fd);
    // printf("\n");
    // file_fd = open("./filetest.txt", O_CREAT | O_APPEND | O_RDWR);
    // while(1) {
    //     errno = 0;
    //     memset(buffer, 0, 1023);
    //     ssize_t ret = ft_read(file_fd, buffer, 3);
    //     printf("Retour de ft_read = %ld\n", ret);
    //     printf("buffer = %s\n", buffer);
    //     printf("errno = %d\n", errno);
    //     if (ret == 0)
    //         break;
    // }
    // close(file_fd);
    // printf("%s\n  SAME TEST WITH READ%s\n", title, reset);
    // close(file_fd);
    // file_fd = open("./filetest.txt", O_CREAT | O_APPEND | O_RDWR);
    // for (int fd = -1; fd <= file_fd + 1; fd++) {
    //     printf("\n");
    //     errno = 0;
    //     memset(buffer, 0, 1024);
    //     ssize_t ret = read(fd, buffer, 1023);
    //     printf("Retour de read = %ld\n", ret);
    //     printf("buffer = %s\n", buffer);
    //     printf("errno = %d\n", errno);
    // }
    // close(file_fd);
    // file_fd = open("./filetest.txt", O_CREAT | O_APPEND | O_RDWR);
    // {
    //     printf("\n");
    //     errno = 0;
    //     memset(buffer, 0, 1024);
    //     ssize_t ret = read(file_fd, buffer, 0);
    //     printf("Retour de read = %ld\n", ret);
    //     printf("buffer = %s\n", buffer);
    //     printf("errno = %d\n", errno);
    // }
    // close(file_fd);
    // file_fd = open("./filetest.txt", O_CREAT | O_APPEND | O_RDWR);
    // {
    //     printf("\n");
    //     errno = 0;
    //     memset(buffer, 0, 1024);
    //     ssize_t ret = read(file_fd, buffer, -1);
    //     printf("Retour de read = %ld\n", ret);
    //     printf("buffer = %s\n", buffer);
    //     printf("errno = %d\n", errno);
    // }
    // close(file_fd);
    // file_fd = open("./filetest.txt", O_CREAT | O_APPEND | O_RDWR);
    // {
    //     printf("\n");
    //     errno = 0;
    //     memset(buffer, 0, 1024);
    //     ssize_t ret = read(file_fd, buffer, 1025);
    //     printf("Retour de read = %ld\n", ret);
    //     printf("buffer = %s\n", buffer);
    //     printf("errno = %d\n", errno);
    // }
    // close(file_fd);
    // file_fd = open("./filetest.txt", O_CREAT | O_APPEND | O_RDWR);
    // {
    //     printf("\n");
    //     errno = 0;
    //     ssize_t ret = read(file_fd, NULL, 1023);
    //     printf("Retour de read = %ld\n", ret);
    //     printf("buffer = %s\n", buffer);
    //     printf("errno = %d\n", errno);
    // }
    // close(file_fd);
    // file_fd = open("./filetest.txt", O_CREAT | O_APPEND | O_RDWR);
    // {
    //     printf("\n");
    //     errno = 0;
    //     ssize_t ret = read(file_fd, NULL, 0);
    //     printf("Retour de read = %ld\n", ret);
    //     printf("buffer = %s\n", buffer);
    //     printf("errno = %d\n", errno);
    // }
    // close(file_fd);
    // file_fd = open("./filetest.txt", O_CREAT | O_APPEND | O_RDWR);
    // while(1) {
    //     errno = 0;
    //     memset(buffer, 0, 1023);
    //     ssize_t ret = read(file_fd, buffer, 3);
    //     printf("Retour de read = %ld\n", ret);
    //     printf("buffer = %s\n", buffer);
    //     printf("errno = %d\n", errno);
    //     if (ret == 0)
    //         break;
    // }
    // close(file_fd);

    // printf("%s\n***************************************************************************************************\n\n%s", line, reset);
    
    // printf("%sTEST FT_STRLEN%s\n", title, reset);
    // char *array[] = {"", "Hello", "a", NULL};

    // for (int i = 0; array[i]; i++) {
    //     printf("string : <%s> - Result ft_strlen = %ld\n", array[i], ft_strlen(array[i]));
    // }
    // // printf("Result ft_strlen = %ld\n", ft_strlen(array[3]));
    // printf("%s\n  SAME TEST WITH STRLEN%s\n", title, reset);
    // for (int i = 0; array[i]; i++) {
    //     printf("string : <%s> - Result strlen = %ld\n", array[i], strlen(array[i]));
    // }
    // // printf("Result strlen = %ld\n", strlen(array[3]));

    printf("%s\n***************************************************************************************************\n\n%s", line, reset);

    printf("%sTEST FT_STRCMP%s\n", title, reset);
    char *array1[] = {"hey", "hey", "", "", "", "a", "a", "", "a", "A", "aA", "aa", "aaa", "aa", "aa", "aaa"};
    for (int i = 0; i < 16; i += 2) {
        printf("s1 = %s\n", array1[i]);
        printf("s1 = %s\n", array1[i + 1]);
        printf("Retour ft_strcmp = %d\n\n", ft_strcmp(array1[i], array1[i + 1]));
    }
    /* SEGFAULT*/
    // {
    //     char *s1 = NULL;
    //     char *s2 = NULL;
    //     printf("s1 = %s\n", s1);
    //     printf("s1 = %s\n", s2);
    //     printf("Retour ft_strcmp = %d\n\n", ft_strcmp(s1, s2));
    // }
    // {
    //     char *s1 = NULL;
    //     char *s2 = "a";
    //     printf("s1 = %s\n", s1);
    //     printf("s1 = %s\n", s2);
    //     printf("Retour strcmp = %d\n\n", strcmp(s1, s2));
    // }
    // {
    //     char *s1 = "a";
    //     char *s2 = NULL;
    //     printf("s1 = %s\n", s1);
    //     printf("s1 = %s\n", s2);
    //     printf("Retour strcmp = %d\n\n", strcmp(s1, s2));
    // }

    printf("%s\n  SAME TEST WITH STRCMP%s\n", title, reset);
    for (int i = 0; i < 16; i += 2) {
        printf("s1 = %s\n", array1[i]);
        printf("s1 = %s\n", array1[i + 1]);
        printf("Retour strcmp = %d\n\n", strcmp(array1[i], array1[i + 1]));
    }
    /* SEGFAULT*/
    // {
    //     char *s1 = NULL;
    //     char *s2 = NULL;
    //     printf("s1 = %s\n", s1);
    //     printf("s1 = %s\n", s2);
    //     printf("Retour strcmp = %d\n\n", strcmp(s1, s2));
    // }
    // {
    //     char *s1 = NULL;
    //     char *s2 = "a";
    //     printf("s1 = %s\n", s1);
    //     printf("s1 = %s\n", s2);
    //     printf("Retour strcmp = %d\n\n", strcmp(s1, s2));
    // }
    // {
    //     char *s1 = "a";
    //     char *s2 = NULL;
    //     printf("s1 = %s\n", s1);
    //     printf("s1 = %s\n", s2);
    //     printf("Retour strcmp = %d\n\n", strcmp(s1, s2));
    // }

    printf("%s\n***************************************************************************************************\n\n%s", line, reset);

    printf("%sTEST FT_STRDUP%s\n", title, reset);
    char *array2[] = {"hey", "", "a", "A", "aA", "aaa", "aa", "Hello world", "            ", NULL};

    for (int i = 0; array2[i]; i++) {
        printf("\ns = <%s>\n", array2[i]);
        char *ret = ft_strdup(array2[i]);
        printf("Ret ft_strdup <%s>\n", ret);
        free(ret);
    }
    /* SEGFAULT*/
    // printf("Ret ft_strdup <%s>\n", ft_strdup(NULL));
    printf("%s\n  SAME TEST WITH STRDUP%s\n", title, reset);
    for (int i = 0; array2[i]; i++) {
        printf("\ns = <%s>\n", array2[i]);
        char *ret = strdup(array2[i]);
        printf("Ret strdup <%s>\n", ret);
        free(ret);
    }
    /* SEGFAULT*/
    // printf("Ret strdup <%s>\n", strdup(NULL));

    printf("%s\n***************************************************************************************************\n\n%s", line, reset);

    printf("%sTEST FT_STRCPY%s\n", title, reset);
    for (int i = 0; array2[i]; i++) {
        char dest[ft_strlen(array2[i])];
        printf("\nsrc = <%s>\n", array2[i]);
        printf("Ret ft_strcpy <%s>\n", ft_strcpy(dest, array2[i]));
        printf("Ret dest <%s>\n", dest);
    }
    {
        char dest[] = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
        printf("\nsrc = <%s>\n", "Hello");
        printf("Ret ft_strcpy <%s>\n", ft_strcpy(dest, "Hello"));
        printf("Ret dest <%s>\n", dest);
    }
    {
        char dest[1] ;
        printf("\nsrc = <%s>\n", "Hello");
        printf("Ret ft_strcpy <%s>\n", ft_strcpy(dest, "Hello"));
        printf("Ret dest <%s>\n", dest);
    }
    printf("Ret ft_strcpy <%s>\n", ft_strcpy(NULL, NULL));
    /* SEGFAULT*/
    // {
        // char dest[100] ;
        // printf("Ret ft_strcpy <%s>\n", ft_strcpy(dest, NULL));
        // printf("Ret ft_strcpy <%s>\n", ft_strcpy(NULL, "Hello"));
    // }
    printf("%s\n  SAME TEST WITH STRCPY%s\n", title, reset);
    for (int i = 0; array2[i]; i++) {
        char dest[strlen(array2[i])];
        printf("\nsrc = <%s>\n", array2[i]);
        printf("Ret strcpy <%s>\n", strcpy(dest, array2[i]));
        printf("Ret dest <%s>\n", dest);
    }
    {
        char dest[] = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
        printf("\nsrc = <%s>\n", "Hello");
        printf("Ret strcpy <%s>\n", strcpy(dest, "Hello"));
        printf("Ret dest <%s>\n", dest);
    }
    {
        char dest[1] ;
        printf("\nsrc = <%s>\n", "Hello");
        printf("Ret strcpy <%s>\n", strcpy(dest, "Hello"));
        printf("Ret dest <%s>\n", dest);
    }
    printf("Ret strcpy <%s>\n", strcpy(NULL, NULL));
    /* SEGFAULT*/
    // {
        // char dest[100] ;
        // printf("Ret strcpy <%s>\n", strcpy(dest, NULL));
    //     printf("Ret strcpy <%s>\n", strcpy(NULL, "Hello"));
    // }

    printf("%s\n***************************************************************************************************\n\n%s", line, reset);

    printf("%sTEST FT_ATOI_BASE%s\n", title, reset);
    {
        char *base = "00123456789";
        printf("\nbase = %s\n", base);
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("1", base));
    }
    {
        char *base = "01023456789";
        printf("\nbase = %s\n", base);
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("1", base));
    }
    {
        char *base = "0123456789+";
        printf("\nbase = %s\n", base);
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("1", base));
    }
    {
        char *base = "-0123456789";
        printf("\nbase = %s\n", base);
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("1", base));
    }
    {
        char *base = "012345-6789";
        printf("\nbase = %s\n", base);
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("1", base));
    }
    {
        char *base = "0123456789";
        printf("\nbase = %s\n", base);
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("1", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("0", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("-1", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("--1564", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("---156445", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("          -+-+-444", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("10", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("              1000", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("+9", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("+++++++++11", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("       \t\r\b\n\v\f  +++++++++++999", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("2147483647", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("2147483648", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("-2147483648", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("-2147483649", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("-56871", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("55696871", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("523696871A123", base));
    }
    {
        char *base = "ABCDEFGHIJ";
        printf("\nbase = %s\n", base);
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("B", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("A", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("-B", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("--BF6E", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("---BF6EEF", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("          -+-+-EEE", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("BA", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("              BAAA", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("+J", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("+++++++++++++BB", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("       \t\r\b\n\v\f  +++++++++++JJJ", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("CBEHEIDGEH", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("CBEHEIDGEI", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("-CBEHEIDGEI", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("-CBEHEIDGEJ", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("-FGIHB", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("FFGJGIHB", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("FCDGJGIHB0BCD", base));
    }
    {
        char *base = "01";
        printf("\nbase = %s\n", base);
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("1", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("0", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("-1", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("--1564", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("1111111111111111111111111111111", base));
        printf("Ret ft_atoi_base = %d\n", ft_atoi_base("10000000000000000000000000000000", base));
    }
}