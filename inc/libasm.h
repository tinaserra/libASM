#ifndef LIBASM_H
# define LIBASM_H

#include <stdio.h>
#include <errno.h>

int		ft_strlen(const char *str);
ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t	ft_read(int fildes, const void *buf, size_t n);
char	*ft_strcpy(char *dst, const char *src);
// char	*ft_strdup(const char *s1);
// int		ft_strcmp(const char *s1, const char *s2);

#endif