	.text
	.file	"test-graphdeclstring.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushl	%esi
.Ltmp0:
	.cfi_def_cfa_offset 8
	subl	$72, %esp
.Ltmp1:
	.cfi_def_cfa_offset 80
.Ltmp2:
	.cfi_offset %esi, -8
	calll	l_init
	movl	%eax, 32(%esp)
	calll	g_init
	movl	%eax, 68(%esp)
	movl	$.Lstr, 60(%esp)
	movl	$.Lstr5, 56(%esp)
	movl	60(%esp), %eax
	movl	%eax, (%esp)
	calll	n_init
	movl	%eax, 28(%esp)
	movl	68(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	addNode
	movl	56(%esp), %eax
	movl	%eax, (%esp)
	calll	n_init
	movl	%eax, 24(%esp)
	movl	68(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	addNode
	movl	68(%esp), %eax
	movl	60(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	getNode
	movl	%eax, %esi
	movl	%esi, 40(%esp)
	movl	$4, (%esp)
	calll	malloc
	movl	$.Lstr6, (%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	set_data
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	calll	get_data
	movl	(%eax), %eax
	movl	%eax, 52(%esp)
	movl	%eax, 4(%esp)
	movl	$.Lfmt1, (%esp)
	calll	printf
	movl	68(%esp), %eax
	movl	56(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	getNode
	movl	%eax, 36(%esp)
	movl	68(%esp), %ecx
	movl	40(%esp), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	movl	$2, 12(%esp)
	calll	addEdge
	movl	68(%esp), %eax
	movl	40(%esp), %ecx
	movl	36(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	getWeight
	movl	%eax, 64(%esp)
	movl	%eax, 4(%esp)
	movl	$.Lfmt, (%esp)
	calll	printf
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	calll	printGraph
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	calll	get_outNodes
	movl	%eax, 32(%esp)
	movl	%eax, (%esp)
	calll	print_list
	movl	32(%esp), %eax
	movl	%eax, (%esp)
	calll	l_size
	movl	%eax, 44(%esp)
	movl	%eax, 4(%esp)
	movl	$.Lfmt, (%esp)
	calll	printf
	xorl	%eax, %eax
	addl	$72, %esp
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
	.asciz	"abc"
	.size	.Lstr6, 4


	.section	".note.GNU-stack","",@progbits
