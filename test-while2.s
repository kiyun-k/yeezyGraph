	.text
	.file	"test-while2.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	subl	$12, %esp
.Ltmp0:
	.cfi_def_cfa_offset 16
	movl	$7, (%esp)
	calll	foo
	movl	%eax, 4(%esp)
	movl	$.Lfmt, (%esp)
	calll	printf
	xorl	%eax, %eax
	addl	$12, %esp
	retl
.Ltmp1:
	.size	main, .Ltmp1-main
	.cfi_endproc

	.globl	foo
	.align	16, 0x90
	.type	foo,@function
foo:                                    # @foo
	.cfi_startproc
# BB#0:                                 # %entry
	subl	$8, %esp
.Ltmp2:
	.cfi_def_cfa_offset 12
	movl	12(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_2:                                # %while_body
                                        #   in Loop: Header=BB1_1 Depth=1
	addl	$2, (%esp)
	decl	4(%esp)
.LBB1_1:                                # %while
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, 4(%esp)
	jg	.LBB1_2
# BB#3:                                 # %merge
	movl	(%esp), %eax
	addl	$8, %esp
	retl
.Ltmp3:
	.size	foo, .Ltmp3-foo
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

	.type	.Lfmt5,@object          # @fmt5
.Lfmt5:
	.asciz	"%d\n"
	.size	.Lfmt5, 4

	.type	.Lfmt6,@object          # @fmt6
.Lfmt6:
	.asciz	"%s\n"
	.size	.Lfmt6, 4

	.type	.Lfmt7,@object          # @fmt7
.Lfmt7:
	.asciz	"%d"
	.size	.Lfmt7, 3

	.type	.Lfmt8,@object          # @fmt8
.Lfmt8:
	.asciz	"%s"
	.size	.Lfmt8, 3

	.type	.Lfmt9,@object          # @fmt9
.Lfmt9:
	.asciz	"%f\n"
	.size	.Lfmt9, 4


	.section	".note.GNU-stack","",@progbits
