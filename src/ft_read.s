%define MACH_SYSCALL(n)     0x2000000 | n
%define READ           0x2000003

; ssize_t ft_read(int fildes, const void *buf, size_t nbyte);
			;  %rdi,		%rsi,	   %rdx  user space
			;  %rbx,		%rcx,	   %rdx  kernel space

section .text
		global _ft_read
		extern ___error

_ft_read:
		push rbp ; retrouver la call stack / debugg le code
		mov rbp, rsp

		;mov rbx, rdi
		;mov rcx, rsi
		mov rax, MACH_SYSCALL(READ)
		;mov rax, READ
		syscall

		cmp rdi, 0
		je null
		;cmp rdi, 0
		;je null


		leave
		ret

null:
		push rdi
		call ___error
		pop rdi
		mov [rax], rdi
		mov rax, -1


		leave
		ret
