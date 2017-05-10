	.text
	.file	"test-graphdeclstruct.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushl	%ebx
.Ltmp0:
	.cfi_def_cfa_offset 8
	pushl	%edi
.Ltmp1:
	.cfi_def_cfa_offset 12
	pushl	%esi
.Ltmp2:
	.cfi_def_cfa_offset 16
	subl	$48, %esp
.Ltmp3:
	.cfi_def_cfa_offset 64
.Ltmp4:
	.cfi_offset %esi, -16
.Ltmp5:
	.cfi_offset %edi, -12
.Ltmp6:
	.cfi_offset %ebx, -8
	movl	$5, 28(%esp)
	movl	$.Lstr, 24(%esp)
	calll	g_init
	movl	%eax, 44(%esp)
	movl	$.Lstr5, 40(%esp)
	movl	$.Lstr5, (%esp)
	calll	n_init
	movl	%eax, 12(%esp)
	movl	44(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	addNode
	movl	44(%esp), %eax
	movl	40(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	getNode
	movl	%eax, %esi
	movl	%esi, 36(%esp)
	movl	24(%esp), %edi
	movl	28(%esp), %ebx
	movl	$8, (%esp)
	calll	malloc
	movl	%ebx, 4(%eax)
	movl	%edi, (%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	set_data
	movl	36(%esp), %eax
	movl	%eax, (%esp)
	calll	get_data
	movl	(%eax), %ecx
	movl	4(%eax), %eax
	movl	%eax, 20(%esp)
	movl	%ecx, 16(%esp)
	movl	20(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.Lfmt, (%esp)
	calll	printf
	xorl	%eax, %eax
	addl	$48, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
.Ltmp7:
	.size	main, .Ltmp7-main
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
	.asciz	"abc"
	.size	.Lstr5, 4


	.section	".note.GNU-stack","",@progbits
