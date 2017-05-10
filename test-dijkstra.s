	.text
	.file	"test-dijkstra.ll"
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
	subl	$128, %esp
.Ltmp3:
	.cfi_def_cfa_offset 144
.Ltmp4:
	.cfi_offset %esi, -16
.Ltmp5:
	.cfi_offset %edi, -12
.Ltmp6:
	.cfi_offset %ebx, -8
	movl	$1000000, 84(%esp)      # imm = 0xF4240
	movl	$1000000, 76(%esp)      # imm = 0xF4240
	movl	$1000000, 68(%esp)      # imm = 0xF4240
	movl	$1000000, 60(%esp)      # imm = 0xF4240
	movl	$.Lstr, 112(%esp)
	movl	$.Lstr5, 108(%esp)
	movl	$.Lstr6, 104(%esp)
	movl	$.Lstr7, 100(%esp)
	calll	g_init
	movl	%eax, 116(%esp)
	movl	112(%esp), %eax
	movl	%eax, (%esp)
	calll	n_init
	movl	%eax, 36(%esp)
	movl	116(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	addNode
	movl	108(%esp), %eax
	movl	%eax, (%esp)
	calll	n_init
	movl	%eax, 32(%esp)
	movl	116(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	addNode
	movl	104(%esp), %eax
	movl	%eax, (%esp)
	calll	n_init
	movl	%eax, 28(%esp)
	movl	116(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	addNode
	movl	100(%esp), %eax
	movl	%eax, (%esp)
	calll	n_init
	movl	%eax, 24(%esp)
	movl	116(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	addNode
	movl	116(%esp), %eax
	movl	112(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	getNode
	movl	%eax, 52(%esp)
	movl	116(%esp), %eax
	movl	108(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	getNode
	movl	%eax, 48(%esp)
	movl	116(%esp), %eax
	movl	104(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	getNode
	movl	%eax, 44(%esp)
	movl	116(%esp), %eax
	movl	100(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	getNode
	movl	%eax, 40(%esp)
	movl	52(%esp), %esi
	movl	80(%esp), %edi
	movl	84(%esp), %ebx
	movl	$8, (%esp)
	calll	malloc
	movl	%ebx, 4(%eax)
	movl	%edi, (%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	set_data
	movl	116(%esp), %eax
	movl	52(%esp), %ecx
	movl	48(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$1, 12(%esp)
	calll	addEdge
	movl	116(%esp), %eax
	movl	52(%esp), %ecx
	movl	44(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$2, 12(%esp)
	calll	addEdge
	movl	48(%esp), %esi
	movl	72(%esp), %edi
	movl	76(%esp), %ebx
	movl	$8, (%esp)
	calll	malloc
	movl	%ebx, 4(%eax)
	movl	%edi, (%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	set_data
	movl	116(%esp), %eax
	movl	48(%esp), %ecx
	movl	52(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$1, 12(%esp)
	calll	addEdge
	movl	116(%esp), %eax
	movl	48(%esp), %ecx
	movl	40(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$10, 12(%esp)
	calll	addEdge
	movl	44(%esp), %esi
	movl	64(%esp), %edi
	movl	68(%esp), %ebx
	movl	$8, (%esp)
	calll	malloc
	movl	%ebx, 4(%eax)
	movl	%edi, (%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	set_data
	movl	116(%esp), %eax
	movl	44(%esp), %ecx
	movl	52(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$2, 12(%esp)
	calll	addEdge
	movl	116(%esp), %eax
	movl	44(%esp), %ecx
	movl	40(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$5, 12(%esp)
	calll	addEdge
	movl	40(%esp), %esi
	movl	56(%esp), %edi
	movl	60(%esp), %ebx
	movl	$8, (%esp)
	calll	malloc
	movl	%ebx, 4(%eax)
	movl	%edi, (%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	set_data
	movl	116(%esp), %eax
	movl	40(%esp), %ecx
	movl	48(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$10, 12(%esp)
	calll	addEdge
	movl	116(%esp), %eax
	movl	40(%esp), %ecx
	movl	44(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$5, 12(%esp)
	calll	addEdge
	movl	52(%esp), %eax
	movl	116(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	dijkstra
	xorl	%eax, %eax
	addl	$128, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
.Ltmp7:
	.size	main, .Ltmp7-main
	.cfi_endproc

	.globl	dijkstra
	.align	16, 0x90
	.type	dijkstra,@function
dijkstra:                               # @dijkstra
	.cfi_startproc
# BB#0:                                 # %entry
	pushl	%ebx
.Ltmp8:
	.cfi_def_cfa_offset 8
	pushl	%edi
.Ltmp9:
	.cfi_def_cfa_offset 12
	pushl	%esi
.Ltmp10:
	.cfi_def_cfa_offset 16
	subl	$64, %esp
.Ltmp11:
	.cfi_def_cfa_offset 80
.Ltmp12:
	.cfi_offset %esi, -16
.Ltmp13:
	.cfi_offset %edi, -12
.Ltmp14:
	.cfi_offset %ebx, -8
	movl	84(%esp), %eax
	movl	80(%esp), %ecx
	movl	%ecx, 60(%esp)
	movl	%eax, 56(%esp)
	calll	l_init
	movl	%eax, 16(%esp)
	calll	pq_init
	movl	%eax, 52(%esp)
	movl	$.Lstr13, 20(%esp)
	movl	56(%esp), %eax
	movl	%eax, (%esp)
	calll	get_data
	movl	(%eax), %ecx
	movl	4(%eax), %eax
	movl	%eax, 44(%esp)
	movl	%ecx, 40(%esp)
	movl	$0, 44(%esp)
	movl	56(%esp), %esi
	movl	40(%esp), %edi
	movl	$8, (%esp)
	calll	malloc
	movl	%edi, (%eax)
	movl	$0, 4(%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	set_data
	movl	52(%esp), %eax
	movl	56(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	pq_push
	movl	$.Lstr14, 4(%esp)
	movl	$.Lfmt9, (%esp)
	calll	printf
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_2:                                # %while_body
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	52(%esp), %eax
	movl	%eax, (%esp)
	calll	pq_delete
	movl	%eax, 28(%esp)
	movl	%eax, (%esp)
	calll	get_name
	movl	%eax, 4(%esp)
	movl	$.Lfmt11, (%esp)
	calll	printf
	movl	$.Lstr15, 4(%esp)
	movl	$.Lfmt11, (%esp)
	calll	printf
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	calll	get_data
	movl	(%eax), %ecx
	movl	4(%eax), %eax
	movl	%eax, 44(%esp)
	movl	%ecx, 40(%esp)
	movl	44(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.Lfmt8, (%esp)
	calll	printf
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	movl	$1, 4(%esp)
	calll	modify_visited
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	calll	get_outNodes
	movl	%eax, 16(%esp)
	movl	$0, 12(%esp)
	jmp	.LBB1_3
	.align	16, 0x90
.LBB1_5:                                # %merge
                                        #   in Loop: Header=BB1_3 Depth=2
	incl	12(%esp)
.LBB1_3:                                # %while22
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	12(%esp), %esi
	movl	16(%esp), %eax
	movl	%eax, (%esp)
	calll	l_size
	cmpl	%eax, %esi
	jge	.LBB1_1
# BB#4:                                 # %while_body23
                                        #   in Loop: Header=BB1_3 Depth=2
	movl	16(%esp), %eax
	movl	12(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	l_get
	movl	%eax, 20(%esp)
	movl	60(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	getNode
	movl	%eax, 24(%esp)
	movl	%eax, (%esp)
	calll	get_data
	movl	(%eax), %ecx
	movl	4(%eax), %eax
	movl	%eax, 36(%esp)
	movl	%ecx, 32(%esp)
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	calll	get_visited
	testb	$1, %al
	jne	.LBB1_5
# BB#6:                                 # %then
                                        #   in Loop: Header=BB1_3 Depth=2
	movl	36(%esp), %esi
	movl	44(%esp), %edi
	movl	60(%esp), %eax
	movl	28(%esp), %ecx
	movl	24(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	getWeight
	addl	%edi, %eax
	cmpl	%eax, %esi
	jle	.LBB1_5
# BB#7:                                 # %then43
                                        #   in Loop: Header=BB1_3 Depth=2
	movl	44(%esp), %edi
	movl	60(%esp), %eax
	movl	28(%esp), %ecx
	movl	24(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	getWeight
	movl	%eax, %esi
	addl	%edi, %esi
	movl	%esi, 36(%esp)
	movl	24(%esp), %edi
	movl	32(%esp), %ebx
	movl	$8, (%esp)
	calll	malloc
	movl	%esi, 4(%eax)
	movl	%ebx, (%eax)
	movl	%eax, 4(%esp)
	movl	%edi, (%esp)
	calll	set_data
	movl	52(%esp), %eax
	movl	24(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	pq_push
	incl	12(%esp)
	jmp	.LBB1_3
	.align	16, 0x90
.LBB1_1:                                # %while
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	movl	52(%esp), %eax
	movl	%eax, (%esp)
	calll	p_size
	testl	%eax, %eax
	jne	.LBB1_2
# BB#8:                                 # %merge68
	addl	$64, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	retl
.Ltmp15:
	.size	dijkstra, .Ltmp15-dijkstra
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

	.type	.Lstr7,@object          # @str7
.Lstr7:
	.asciz	"d"
	.size	.Lstr7, 2

	.type	.Lfmt8,@object          # @fmt8
.Lfmt8:
	.asciz	"%d\n"
	.size	.Lfmt8, 4

	.type	.Lfmt9,@object          # @fmt9
.Lfmt9:
	.asciz	"%s\n"
	.size	.Lfmt9, 4

	.type	.Lfmt10,@object         # @fmt10
.Lfmt10:
	.asciz	"%d"
	.size	.Lfmt10, 3

	.type	.Lfmt11,@object         # @fmt11
.Lfmt11:
	.asciz	"%s"
	.size	.Lfmt11, 3

	.type	.Lfmt12,@object         # @fmt12
.Lfmt12:
	.asciz	"%f\n"
	.size	.Lfmt12, 4

	.type	.Lstr13,@object         # @str13
	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16
.Lstr13:
	.asciz	"temporary string"
	.size	.Lstr13, 17

	.type	.Lstr14,@object         # @str14
	.align	16
.Lstr14:
	.asciz	"Vertex              Distance from source"
	.size	.Lstr14, 41

	.type	.Lstr15,@object         # @str15
	.align	16
.Lstr15:
	.asciz	"                       "
	.size	.Lstr15, 24


	.section	".note.GNU-stack","",@progbits
