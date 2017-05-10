	.text
	.file	"test-queuestring.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushl	%edi
.Ltmp0:
	.cfi_def_cfa_offset 8
	pushl	%esi
.Ltmp1:
	.cfi_def_cfa_offset 12
	subl	$36, %esp
.Ltmp2:
	.cfi_def_cfa_offset 48
.Ltmp3:
	.cfi_offset %esi, -12
.Ltmp4:
	.cfi_offset %edi, -8
	calll	initQueueId
	movl	%eax, 16(%esp)
	movl	$.Lstr, 32(%esp)
	movl	$.Lstr5, 28(%esp)
	movl	16(%esp), %esi
	movl	32(%esp), %edi
	movl	$4, (%esp)
	calll	malloc
	movl	%edi, (%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	enqueue
	movl	16(%esp), %esi
	movl	28(%esp), %edi
	movl	$4, (%esp)
	calll	malloc
	movl	%edi, (%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	enqueue
	movl	16(%esp), %eax
	movl	%eax, (%esp)
	calll	front
	movl	(%eax), %eax
	movl	%eax, 24(%esp)
	movl	%eax, 4(%esp)
	movl	$.Lfmt1, (%esp)
	calll	printf
	movl	16(%esp), %eax
	movl	%eax, (%esp)
	calll	dequeue
	movl	16(%esp), %eax
	movl	%eax, (%esp)
	calll	front
	movl	(%eax), %eax
	movl	%eax, 20(%esp)
	movl	%eax, 4(%esp)
	movl	$.Lfmt1, (%esp)
	calll	printf
	xorl	%eax, %eax
	addl	$36, %esp
	popl	%esi
	popl	%edi
	retl
.Ltmp5:
	.size	main, .Ltmp5-main
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


	.section	".note.GNU-stack","",@progbits
