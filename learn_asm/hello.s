%define	WRITE 0x02000004
%define	EXIT 0x02000001
%define	STDOUT 1

section .data
	str: db	'Hello world\n'
	len equ $-str

section .text
	global _main ; l'Entry Point ici

_main:
	mov	rax, WRITE
	mov rdi, STDOUT
	mov rsi, str
	mov rdx, len
	syscall
	jmp quit

quit:
	mov	rax, EXIT
	mov rdi, 0
	syscall

; ceci est un commentaire

; byte [rsi + i]

;char *str;
;str[i + 10]


; ft_example(param1, param2, param3, param4,param5, param6)

; rdi param1
; rsi param2
; rdx param3
; rcx param4
; r8 param5
; r9 param6

; push rdi = 6

;	ADDR BASSES = 0x000000

;	[rsp]
;	6
;	1 [rsp+8]
;	2 [rsp+16]
;	3 [rsp+24]
;	4 [rsp+32]
;	[rbp]

;	ADDR HAUTES 0xffffff

; mov rdi, [rsp+8] ; Déplace la valeur de source dans destination 
; (est-ce un copy ou est-ce que la source se retrouve vide ou = 0 apres ca ?

; pop rdi ; = mov rdi, rsp



