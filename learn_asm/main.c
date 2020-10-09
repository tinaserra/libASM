#include <stdio.h>

int ft_strlen(char *str);
ssize_t ft_write(int fildes, const void *buf, size_t nbyte);

int main(void)
{
    printf("%d\n", ft_strlen(""));
    char    *str = "salut maman\n";
    printf("ret: %zd\n", ft_write(1, 0, ft_strlen(str)));
}