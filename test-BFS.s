	.text
	.file	"test-BFS.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	subl	$76, %esp
.Ltmp0:
	.cfi_def_cfa_offset 80
	movl	$.Lstr, 68(%esp)
	movl	$.Lstr5, 64(%esp)
	movl	$.Lstr6, 60(%esp)
	movl	$.Lstr7, 56(%esp)
	calll	g_init
	movl	%eax, 72(%esp)
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	calll	n_init
	movl	%eax, 32(%esp)
	movl	72(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	addNode
	movl	64(%esp), %eax
	movl	%eax, (%esp)
	calll	n_init
	movl	%eax, 28(%esp)
	movl	72(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	addNode
	movl	60(%esp), %eax
	movl	%eax, (%esp)
	calll	n_init
	movl	%eax, 24(%esp)
	movl	72(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	addNode
	movl	56(%esp), %eax
	movl	%eax, (%esp)
	calll	n_init
	movl	%eax, 20(%esp)
	movl	72(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	addNode
	movl	72(%esp), %eax
	movl	68(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	getNode
	movl	%eax, 48(%esp)
	movl	72(%esp), %eax
	movl	64(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	getNode
	movl	%eax, 44(%esp)
	movl	72(%esp), %eax
	movl	60(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	getNode
	movl	%eax, 40(%esp)
	movl	72(%esp), %eax
	movl	56(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	getNode
	movl	%eax, 36(%esp)
	movl	72(%esp), %eax
	movl	48(%esp), %ecx
	movl	44(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$1, 12(%esp)
	calll	addEdge
	movl	72(%esp), %eax
	movl	48(%esp), %ecx
	movl	40(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$2, 12(%esp)
	calll	addEdge
	movl	72(%esp), %eax
	movl	44(%esp), %ecx
	movl	48(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$1, 12(%esp)
	calll	addEdge
	movl	72(%esp), %eax
	movl	44(%esp), %ecx
	movl	36(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$10, 12(%esp)
	calll	addEdge
	movl	72(%esp), %eax
	movl	40(%esp), %ecx
	movl	48(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$2, 12(%esp)
	calll	addEdge
	movl	72(%esp), %eax
	movl	40(%esp), %ecx
	movl	36(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$5, 12(%esp)
	calll	addEdge
	movl	72(%esp), %eax
	movl	36(%esp), %ecx
	movl	44(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$10, 12(%esp)
	calll	addEdge
	movl	72(%esp), %eax
	movl	36(%esp), %ecx
	movl	40(%esp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	movl	$5, 12(%esp)
	calll	addEdge
	movl	48(%esp), %eax
	movl	72(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	BFS
	xorl	%eax, %eax
	addl	$76, %esp
	retl
.Ltmp1:
	.size	main, .Ltmp1-main
	.cfi_endproc

	.globl	BFS
	.align	16, 0x90
	.type	BFS,@function
BFS:                                    # @BFS
	.cfi_startproc
# BB#0:                                 # %entry
	pushl	%edi
.Ltmp2:
	.cfi_def_cfa_offset 8
	pushl	%esi
.Ltmp3:
	.cfi_def_cfa_offset 12
	subl	$52, %esp
.Ltmp4:
	.cfi_def_cfa_offset 64
.Ltmp5:
	.cfi_offset %esi, -12
.Ltmp6:
	.cfi_offset %edi, -8
	movl	68(%esp), %eax
	movl	64(%esp), %ecx
	movl	%ecx, 48(%esp)
	movl	%eax, 44(%esp)
	calll	initQueueId
	movl	%eax, 40(%esp)
	movl	44(%esp), %eax
	movl	%eax, (%esp)
	movl	$1, 4(%esp)
	calll	modify_visited
	movl	40(%esp), %esi
	movl	44(%esp), %edi
	movl	$4, (%esp)
	calll	malloc
	movl	%edi, (%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	enqueue
	movl	$.Lstr13, 4(%esp)
	movl	$.Lfmt9, (%esp)
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_9:                                # %then35
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	$.Lstr14, 4(%esp)
	movl	$.Lfmt11, (%esp)
.LBB1_1:                                # %while
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
                                        #       Child Loop BB1_4 Depth 3
	calll	printf
.LBB1_2:                                # %while
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_4 Depth 3
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	calll	q_size
	testl	%eax, %eax
	je	.LBB1_10
# BB#3:                                 # %while_body
                                        #   in Loop: Header=BB1_2 Depth=2
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	calll	front
	movl	(%eax), %eax
	movl	%eax, 32(%esp)
	movl	%eax, (%esp)
	calll	get_name
	movl	%eax, 4(%esp)
	movl	$.Lfmt11, (%esp)
	calll	printf
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	calll	dequeue
	movl	32(%esp), %eax
	movl	%eax, (%esp)
	calll	get_outNodes
	movl	%eax, 36(%esp)
	movl	$0, 24(%esp)
	jmp	.LBB1_4
	.align	16, 0x90
.LBB1_6:                                # %merge
                                        #   in Loop: Header=BB1_4 Depth=3
	incl	24(%esp)
.LBB1_4:                                # %while12
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	24(%esp), %esi
	movl	36(%esp), %eax
	movl	%eax, (%esp)
	calll	l_size
	cmpl	%eax, %esi
	jge	.LBB1_8
# BB#5:                                 # %while_body13
                                        #   in Loop: Header=BB1_4 Depth=3
	movl	36(%esp), %eax
	movl	24(%esp), %ecx
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	calll	l_get
	movl	%eax, 20(%esp)
	movl	48(%esp), %ecx
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	calll	getNode
	movl	%eax, 28(%esp)
	movl	%eax, (%esp)
	calll	get_visited
	testb	$1, %al
	jne	.LBB1_6
# BB#7:                                 # %then
                                        #   in Loop: Header=BB1_4 Depth=3
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	movl	$1, 4(%esp)
	calll	modify_visited
	movl	40(%esp), %esi
	movl	28(%esp), %edi
	movl	$4, (%esp)
	calll	malloc
	movl	%edi, (%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	enqueue
	incl	24(%esp)
	jmp	.LBB1_4
	.align	16, 0x90
.LBB1_8:                                # %merge31
                                        #   in Loop: Header=BB1_2 Depth=2
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	calll	q_size
	testl	%eax, %eax
	je	.LBB1_2
	jmp	.LBB1_9
.LBB1_10:                               # %merge40
	addl	$52, %esp
	popl	%esi
	popl	%edi
	retl
.Ltmp7:
	.size	BFS, .Ltmp7-BFS
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
	.asciz	"BFS traversal of the graph: "
	.size	.Lstr13, 29

	.type	.Lstr14,@object         # @str14
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr14:
	.asciz	" -> "
	.size	.Lstr14, 5


	.section	".note.GNU-stack","",@progbits
