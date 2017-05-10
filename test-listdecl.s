	.text
	.file	"test-listdecl.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushl	%esi
.Ltmp0:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp1:
	.cfi_def_cfa_offset 32
.Ltmp2:
	.cfi_offset %esi, -8
	calll	l_init
	movl	%eax, %esi
	movl	$4, (%esp)
	calll	malloc
	movl	$1, (%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	l_add
	movl	$4, (%esp)
	calll	malloc
	movl	$2, (%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	l_add
	movl	$4, (%esp)
	calll	malloc
	movl	$3, (%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	l_add
	movl	%esi, 20(%esp)
	xorl	%eax, %eax
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp3:
	.size	main, .Ltmp3-main
	.cfi_endproc

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
