section .text
		global _ft_strlen ; ft_strlen

_ft_strlen:
		push rbp				; retrouver la call stack / debugg le code
		mov rbp, rsp
		xor rax, rax			; met 0 dans rax

		cmp BYTE [rdi], 0		; If *str == 0 ; ret 0
		je 	quit
loop:
		inc rax
		cmp BYTE [rdi + rax], 0			; If str[i] == 0 ; comparer le premier BYTE de rdi à 0
		jnz loop

quit:
		leave
		ret
