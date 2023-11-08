.global strcpy
strcpy:
addi 	sp, sp, -4
sw	ra, (sp)
loop:
	lb	t1(a1)
	beqz	t1, end
	sb	t1,(a0)
	addi	a0, a0, 1
	addi	a1, a1, 1
	b	loop
end:
	sb	t1, (a0)
	lw	ra, (sp)
	ret
	
