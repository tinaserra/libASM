%define MACH_SYSCALL(n)    0x2000000 | n
%define WRITE                      4

section .text
		global _ft_write ; ft_write
        extern _ft_strlen

; ssize_t ft_write(int fildes, const void *buf, size_t nbyte);
					 ;   %rdi,            %rsi,         %rdx  user space
					 ;   %rbx,            %rcx,         %rdx  kernel space

; int ft_strlen(char *str);
;                    %rdi


_ft_write:
		push rbp				; retrouver la call stack / debugg le code
		mov rbp, rsp

;        sub rsp, 8              ; alignement de la stack sur 16 bytes avant l'appel a un syscall ou a une fonction
;        push rsi

		mov rbx, rdi
		mov rcx, rsi
		mov rax, MACH_SYSCALL(WRITE)
        syscall

;        pop rdi
;        call _ft_strlen

		leave
		ret
