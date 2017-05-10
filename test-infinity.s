	.text
	.file	"test-infinity.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	subl	$28, %esp
.Ltmp0:
	.cfi_def_cfa_offset 32
	movl	$3000, 24(%esp)         # imm = 0xBB8
	movl	$-3000, 20(%esp)        # imm = 0xFFFFFFFFFFFFF448
	cmpl	$1000000, 24(%esp)      # imm = 0xF4240
	setl	19(%esp)
	cmpl	$-1000000, 20(%esp)     # imm = 0xFFFFFFFFFFF0BDC0
	setg	18(%esp)
	movzbl	19(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.Lfmt, (%esp)
	calll	printf
	movzbl	18(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.Lfmt, (%esp)
	calll	printf
	xorl	%eax, %eax
	addl	$28, %esp
	retl
.Ltmp1:
	.size	main, .Ltmp1-main
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
