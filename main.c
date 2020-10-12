#include <stdio.h>
#include "inc/libasm.h"

#include <libc.h>
#include <fcntl.h>
// int ft_strlen(char *str);
// ssize_t ft_write(int fildes, const void *buf, size_t nbyte);

int main(void)
{
	char	*str;

	printf("%d\n", ft_strlen(""));

	str = "salut maman\n";
	printf("ret: %zd\n", ft_write(1, 0, ft_strlen(str)));
}