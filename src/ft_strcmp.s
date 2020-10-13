
; int	strcmp(const char *s1, const char *s2);
;				 %rdi,        %rsi;
section .text
		global _ft_strcmp

_ft_strcmp:
		push rbp ; retrouver la call stack / debugg le code
		mov rbp, rsp
		xor rcx, rcx

loop:
		cmp byte [rdi],	0
		jz end
		cmp byte [rsi],	0
		jz end

		mov al, byte [rdi + rcx]
		mov ah, byte [rsi + rcx]
	
		cmp al, ah
		jl lesser
		jg greater

		inc rcx
;		inc rsi
;		inc rdi
		jmp loop

greater:
		mov rax, 1
		jmp quit

lesser:
		mov rax, -1
		jmp quit

end:
		mov rax, 0
		jmp quit

quit:
		leave
		ret