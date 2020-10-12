; char *strcpy(char *dst, const char *src);
;			 %rdi,        %rsi

section .text
		global _ft_strcpy

_ft_strcpy:
		push rbp ; retrouver la call stack / debugg le code
		mov rbp, rsp
		xor rcx, rcx ; met 0 dans rcx
		mov rax, rdi ; met dst dans rax car il sera retourné a la fin de la fonction

		cmp BYTE [rsi], 0 ; If *src == 0 ; ret rax (dest)
		je 	quit
loop:
		mov dl, [rsi + rcx]
		mov [rax + rcx], dl
		inc rcx
		;mov BYTE [rsi + rcx], BYTE [rax + rcx]
		cmp BYTE [rsi + rcx], 0			; If src[i] == 0 ; comparer le premier BYTE de rsi à 0
		jnz loop


quit:
		leave
		ret