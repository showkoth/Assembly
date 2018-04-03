segment .data
fmt_out: db "The sum is: %lld", 10,  0
fmt: db "%s", 10, 0
fmt_in: db "%lld", 0
n: dq 0


segment .text

global main
extern printf
extern scanf

SUM:
	push RBP
	mov RBP, RSP

	mov RAX, [RBP + 16]
	mov RBX, [RBP + 24]
	mov RCX, [RBP + 32]
	add RBX,RAX
	cmp RBX,RCX
	jg END
	
	push RCX
	push RBX
	inc RAX
	push RAX
	call SUM

	mov RBX,[RBP + 24]
	add R10,RBX


END:

	leave 
	ret

main:
	push RBP
	mov RBP, RSP

	mov RAX, 0
	mov RBX, 0
	mov RCX, 0

	mov RDI, fmt_in
	mov RSI, n
	call scanf

	mov RAX, [n]
	mov RBX, 2
	mov RCX,1
	push RAX
	push RBX
	push RCX
	xor R10,R10
	call SUM


	mov RBX, 0
	mov RDI, fmt_out
	add R10,[n]
	mov RSI, R10
	mov RAX, 0
	call printf

	leave
	ret
