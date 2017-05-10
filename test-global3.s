	.text
	.file	"test-global3.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	subl	$12, %esp
.Ltmp0:
	.cfi_def_cfa_offset 16
	movl	$42, i
	movl	$10, j
	movl	i, %eax
	addl	$10, %eax
	movl	%eax, 4(%esp)
	movl	$.Lfmt, (%esp)
	calll	printf
	xorl	%eax, %eax
	addl	$12, %esp
	retl
.Ltmp1:
	.size	main, .Ltmp1-main
	.cfi_endproc

	.type	j,@object               # @j
	.bss
	.globl	j
	.align	4
j:
	.long	0                       # 0x0
	.size	j, 4

	.type	b,@object               # @b
	.globl	b
b:
	.byte	0                       # 0x0
	.size	b, 1

	.type	i,@object               # @i
	.globl	i
	.align	4
i:
	.long	0                       # 0x0
	.size	i, 4

	.type	.Lfmt,@object           # @fmt
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lfmt:
	.asciz	"%d\n"
	.size	.Lfmt, 4

	.type	.Lfmt1,@object          # @fmt1
.Lfmt1:
	.asciz	"%s\n"
	.size	.Lfmt1, 4

	.type	.Lfmt2,@object          # @fmt2
.Lfmt2:
	.asciz	"%d"
	.size	.Lfmt2, 3

	.type	.Lfmt3,@object          # @fmt3
.Lfmt3:
	.asciz	"%s"
	.size	.Lfmt3, 3

	.type	.Lfmt4,@object          # @fmt4
.Lfmt4:
	.asciz	"%f\n"
	.size	.Lfmt4, 4


	.section	".note.GNU-stack","",@progbits
