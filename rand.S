.globl rand1

rand1:
rdtsc

pushl %ebx
movl %eax, %ebx

xor %ecx, %ecx
movl %eax, %ecx
and $0xF, %ecx
add $1, %ecx

scramble3:
	shl $1, %eax
	movl %eax, %edx
	shr $15, %edx
	and $0x8, %dl
	not %dl
	xor %bl, %dh
	xor %ax, %dx
	neg %eax
	loop scramble3

popl %ebx
ret
