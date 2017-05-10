	.text
	.file	"test-pqueuedecl.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushl	%esi
.Ltmp0:
	.cfi_def_cfa_offset 8
	subl	$56, %esp
.Ltmp1:
	.cfi_def_cfa_offset 64
.Ltmp2:
	.cfi_offset %esi, -8
	calll	g_init
	movl	%eax, 48(%esp)
	movl	$.Lstr, 44(%esp)
	movl	$.Lstr5, 40(%esp)
	movl	$.Lstr6, 36(%esp)
	movl	44(%esp), %eax
	movl	%eax, (%esp)
	calll	n_init
	movl	%eax, 20(%esp)
	movl	48(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	addNode
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	calll	n_init
	movl	%eax, 16(%esp)
	movl	48(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	addNode
	movl	36(%esp), %eax
	movl	%eax, (%esp)
	calll	n_init
	movl	%eax, 12(%esp)
	movl	48(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	addNode
	movl	48(%esp), %eax
	movl	44(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	getNode
	movl	%eax, %esi
	movl	%esi, 32(%esp)
	movl	$4, (%esp)
	calll	malloc
	movl	$3, (%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	set_data
	xorl	%eax, %eax
	addl	$56, %esp
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

	.type	.Lstr,@object           # @str
.Lstr:
	.asciz	"abc"
	.size	.Lstr, 4

	.type	.Lstr5,@object          # @str5
.Lstr5:
	.asciz	"def"
	.size	.Lstr5, 4

	.type	.Lstr6,@object          # @str6
.Lstr6:
	.asciz	"ghi"
	.size	.Lstr6, 4


	.section	".note.GNU-stack","",@progbits
