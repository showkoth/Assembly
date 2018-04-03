segment .data
fmt_out: dq "The GCD is: %lld", 10,  0
fmt_in: dq "%lld", 0
a: dq 0
b: dq 0


segment .text
global main
extern printf
extern scanf

GCD:
	push RBP
	mov RBP, RSP

	mov RDX,[RBP + 16]	
	mov RAX, [RBP + 24]	
	mov RBX, [RBP + 32]
	idiv RBX
	cmp RDX,0
	jz END
	mov RAX,RBX
	mov RBX,RDX
	push RAX
	push RBX
	push RDX
	call GCD
	

END:
	mov R10, RBX
	leave 
	ret

main:
	push RBP
	mov RBP, RSP

INPUT:
	mov RAX, 0
	mov RBX, 0
	mov RCX, 0

	mov RDI, fmt_in
	mov RSI, a
	call scanf

    mov RAX, 0
	mov RBX, 0
	mov RCX, 0

	mov RDI, fmt_in
	mov RSI, b
	call scanf



	mov RAX, [a]
	mov RBX, [b]
	mov RDX,1
	push RAX
	push RBX
	push RDX
	xor R10,R10
	call GCD


	mov RBX, 0
	mov RDI, fmt_out
	mov RSI, R10
	mov RAX, 0
	call printf

	leave
	ret
