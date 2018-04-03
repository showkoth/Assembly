segment .data
fmt_out: db "The fibonacci is: %lld", 10,  0
fmt: db "%s", 10, 0
fmt_in: db "%lld", 0
a: dq 0
b: dq 0
n: dq 0
prev: dq 0
res: dq 0

segment .text

global main
extern printf
extern scanf

fibonacci:
	push RBP
	mov RBP, RSP
	mov RBX, [RBP + 16]

	cmp RBX, 0
	jz base_case1
	cmp RBX, 1
	jz base_case2

	dec RBX
	push RBX
	call fibonacci
	mov RAX, [res]
	add RAX, [prev]
	mov [res], RAX

	mov RBX, [RBP + 16]
	dec RBX
	dec RBX
	push RBX
	call fibonacci
	mov RBX, [RBP + 16]
	mov RAX, [res]
	add RAX, [prev]
	mov [res], RAX

	mov [prev], RAX
	leave
	ret

	base_case1:
		mov RAX, 0
		mov [prev], RAX
		mov [res], RAX
		leave
		ret
	base_case2:
		mov RAX, 1
		mov [prev], RAX
		mov [res], RAX
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
	push RAX

	mov RAX, 0
	call fibonacci

	mov RBX, 0
	mov RDI, fmt_out
	mov RSI, RAX
	mov RAX, 0
	call printf

	leave
	ret
