	.text
	.file	"test-listget.ll"
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
	subl	$68, %esp
.Ltmp2:
	.cfi_def_cfa_offset 80
.Ltmp3:
	.cfi_offset %esi, -12
.Ltmp4:
	.cfi_offset %edi, -8
	movl	$.Lstr, 28(%esp)
	movl	$.Lstr5, 24(%esp)
	movl	$.Lstr6, 20(%esp)
	calll	l_init
	movl	%eax, 64(%esp)
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
	movl	$4, (%esp)
	calll	malloc
	movl	$4, (%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	l_add
	movl	%esi, 60(%esp)
	calll	l_init
	movl	%eax, 56(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	calll	n_init
	movl	%eax, 40(%esp)
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	calll	n_init
	movl	%eax, 36(%esp)
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	calll	n_init
	movl	%eax, 32(%esp)
	movl	64(%esp), %eax
	movl	28(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	l_add
	movl	64(%esp), %eax
	movl	24(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	l_add
	movl	64(%esp), %eax
	movl	20(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	l_add
	movl	56(%esp), %esi
	movl	40(%esp), %edi
	movl	$4, (%esp)
	calll	malloc
	movl	%edi, (%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	l_add
	movl	56(%esp), %esi
	movl	36(%esp), %edi
	movl	$4, (%esp)
	calll	malloc
	movl	%edi, (%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	l_add
	movl	56(%esp), %esi
	movl	32(%esp), %edi
	movl	$4, (%esp)
	calll	malloc
	movl	%edi, (%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	l_add
	movl	64(%esp), %eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	l_get
	movl	%eax, 52(%esp)
	movl	60(%esp), %eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	l_get
	movl	(%eax), %eax
	movl	%eax, 48(%esp)
	movl	56(%esp), %eax
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	calll	l_get
	movl	(%eax), %eax
	movl	%eax, 44(%esp)
	movl	52(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.Lfmt1, (%esp)
	calll	printf
	movl	48(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.Lfmt, (%esp)
	calll	printf
	movl	44(%esp), %eax
	movl	%eax, (%esp)
	calll	get_name
	movl	%eax, 4(%esp)
	movl	$.Lfmt1, (%esp)
	calll	printf
	xorl	%eax, %eax
	addl	$68, %esp
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
	.asciz	"a"
	.size	.Lstr, 2

	.type	.Lstr5,@object          # @str5
.Lstr5:
	.asciz	"b"
	.size	.Lstr5, 2

	.type	.Lstr6,@object          # @str6
.Lstr6:
	.asciz	"c"
	.size	.Lstr6, 2


	.section	".note.GNU-stack","",@progbits
