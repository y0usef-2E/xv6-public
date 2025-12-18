.globl rand1

rand1:
movl $1, %eax	# function 1
movl $0, %ecx	# subfunction 0

cpuid

shr $30, %ecx	# get desired flag bit
and $1, %ecx	# and isolate it
jz fail 

mov $100, %ecx
retry:
	rdrand %eax
	jc done
	loop retry	# decrements ecx
fail:
	movl $0xCAFE, %eax
done:
ret
