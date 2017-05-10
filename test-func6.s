	.text
	.file	"test-func6.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	subl	$12, %esp
.Ltmp0:
	.cfi_def_cfa_offset 16
	movl	$25, 8(%esp)
	movl	$0, 4(%esp)
	movl	$17, (%esp)
	calll	bar
	movl	%eax, 4(%esp)
	movl	$.Lfmt, (%esp)
	calll	printf
	xorl	%eax, %eax
	addl	$12, %esp
	retl
.Ltmp1:
	.size	main, .Ltmp1-main
	.cfi_endproc

	.globl	bar
	.align	16, 0x90
	.type	bar,@function
bar:                                    # @bar
	.cfi_startproc
# BB#0:                                 # %entry
	subl	$12, %esp
.Ltmp2:
	.cfi_def_cfa_offset 16
	movl	24(%esp), %eax
	movb	20(%esp), %cl
	movl	16(%esp), %edx
	movl	%edx, 8(%esp)
	andb	$1, %cl
	movb	%cl, 7(%esp)
	movl	%eax, (%esp)
	addl	8(%esp), %eax
	addl	$12, %esp
	retl
.Ltmp3:
	.size	bar, .Ltmp3-bar
	.cfi_endproc

	.globl	foo
	.align	16, 0x90
	.type	foo,@function
foo:                                    # @foo
	.cfi_startproc
# BB#0:                                 # %entry
	retl
.Ltmp4:
	.size	foo, .Ltmp4-foo
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

	.type	.Lfmt10,@object         # @fmt10
.Lfmt10:
	.asciz	"%d\n"
	.size	.Lfmt10, 4

	.type	.Lfmt11,@object         # @fmt11
.Lfmt11:
	.asciz	"%s\n"
	.size	.Lfmt11, 4

	.type	.Lfmt12,@object         # @fmt12
.Lfmt12:
	.asciz	"%d"
	.size	.Lfmt12, 3

	.type	.Lfmt13,@object         # @fmt13
.Lfmt13:
	.asciz	"%s"
	.size	.Lfmt13, 3

	.type	.Lfmt14,@object         # @fmt14
.Lfmt14:
	.asciz	"%f\n"
	.size	.Lfmt14, 4


	.section	".note.GNU-stack","",@progbits
