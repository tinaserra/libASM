%define MACH_SYSCALL(n)		0x2000000 | n
%define WRITE				4

; ssize_t ft_write(int fildes, const void *buf, size_t nbyte);
			;   %rdi,		%rsi,		%rdx  user space
			;   %rbx,		%rcx,		%rdx  kernel space

section .text
		global _ft_write
		extern ___error

_ft_write:
		push rbp ; retrouver la call stack / debugg le code
		mov rbp, rsp

		mov rbx, rdi
		mov rcx, rsi
		mov rax, MACH_SYSCALL(WRITE)
		syscall
		cmp rax, 0
		je null
		leave
		ret

null:
		push rdi
		call ___error
		pop rdi
		mov [rax], rdi
		mov rax, -1
		ret

		leave
		ret
