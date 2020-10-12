#include <stdio.h>
#include <unistd.h>
#include "inc/libasm.h"

#include <libc.h>
#include <fcntl.h>
#include <string.h>

int main(void)
{
	char	*str = "salut maman";
	// ssize_t ret_write = 0;
	// ssize_t ret_ft_write = 0;

	printf("\n\n* FT_STRLEN ----------------------------------------------- *\n\n");
	printf("[strlen]	%lu\n", strlen(str));
	printf("[ft_strlen]	%d\n", ft_strlen(str));

	printf("\n\n* FT_STRCPY ----------------------------------------------- *\n\n");
	char	*src = "Ca marche ?";
	// char	*src2 = "jcvlwrnvj  jnrwknvk   hsnkhkech s hr ih s";
	char	*dst = (char *)malloc(ft_strlen(src));
	char	*dst2 = (char *)malloc(ft_strlen(src));

	dst = strcpy(dst, src);
	printf("[strcpy]	%s\n", dst);
	dst2 = ft_strcpy(dst2, src);
	printf("[ft_strcpy]	%s\n", dst2);

	// ft_write(1, "str\n", 4);
	// ret_ft_write = ft_write(1, 0, 0);
	// printf("ret ft_write : %zd\n\n", ret_ft_write);

	// write(1, "str\n", 4);
	// ret_ft_write = write(1, str, ft_strlen(str));
	// printf("ret write : %zd\n", ret_write);

	// printf("\n\n-----------------------------------------------------------\n");
	// printf("| ft_read | Input = test/test.txt, s2, 50                 |\n");
	// printf("-----------------------------------------------------------\n\n");

	// int fileread2 = open("test/test.txt", O_RDWR);
	// printf(" [read] file = %d\n", fileread2);
	// char *sread2 = (char *)malloc(50);
	// printf(" [read] return = %zd\n", read(fileread2, sread2, 50));
	// printf(" [read] content = %s\n\n", sread2);
	// close(fileread2);

	// int fileread = open("test/test.txt", O_RDWR);
	// printf(" [ft_read] file = %d\n", fileread);
	// char *sread = (char *)malloc(50);
	// printf(" [ft_read] return = %zd\n", ft_read(fileread, sread, 50));
	// printf(" [ft_read] content = %s\n", sread);
	// close(fileread);

	// printf("\n\n-----------------------------------------------------------\n");
    // printf("| ft_write | Input = srcs/test.txt, Hello World, 11       |\n");
    // printf("-----------------------------------------------------------\n\n");
    
    // int filewrite = open("srcs/testt.txt", O_RDWR);
    // printf(" [ft_write] Output_01 = %d\n", filewrite);
    // char swrite[11] = "Hello World";
    // printf(" [ft_write] Output_02 = %zd\n", ft_write(filewrite, swrite, 11));
    // close(filewrite);

    // int filewrite2 = open("srcs/testt.txt", O_RDWR);
    // printf(" [write] Output_01 = %d\n", filewrite2);
    // char swrite2[11] = "Hello World";
    // printf(" [write] Output_02 = %zd\n", write(filewrite2, swrite2, 11));
    // close(filewrite2);
}