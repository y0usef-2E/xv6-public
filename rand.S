.globl rand1

rand1:
rdtsc
pushl %ebx
movl %edx, %ebx

movl %eax, %edx
and $0xF, %edx


movl $4, %ecx
cont:
	sub $1, %edx
	jz scramble1
	loop cont

movl $4, %ecx
cont2:
	sub $1, %edx
	jz scramble2
	loop cont2

movl $4, %ecx
scramble3:
	sub $1, %edx
	jz finish
	sar $1, %eax
	movl %eax, %ebx
	shr $15, %ebx
	and $0x1, %al
	cmp $1, %al
	jz else
	neg %eax
	movl %eax, %ebx
	shr $19, %ebx
	and $0x3, %bl
	cmp $0x2, %al
	jnz else
	shl $3, %eax
	or 0xF200, %ax
	else:
		loop scramble3
jmp finish

scramble2:
	movl %ebx, %edx
	shl $8, %edx 
	movb %al, %dl
	jmp finish

scramble1:
	movl %eax, %edx
	shl $3, %edx
	movb $173, %dl
	sar $2, %edx
	movl %edx, %eax
	jmp finish

finish:
popl %ebx

ret
