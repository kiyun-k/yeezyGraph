	.text
	.file	"test-func3.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	subl	$28, %esp
.Ltmp0:
	.cfi_def_cfa_offset 32
	movl	$8, 12(%esp)
	movl	$192, 8(%esp)
	movl	$17, 4(%esp)
	movl	$42, (%esp)
	calll	printem
	xorl	%eax, %eax
	addl	$28, %esp
	retl
.Ltmp1:
	.size	main, .Ltmp1-main
	.cfi_endproc

	.globl	printem
	.align	16, 0x90
	.type	printem,@function
printem:                                # @printem
	.cfi_startproc
# BB#0:                                 # %entry
	pushl	%esi
.Ltmp2:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp3:
	.cfi_def_cfa_offset 32
.Ltmp4:
	.cfi_offset %esi, -8
	movl	44(%esp), %eax
	movl	40(%esp), %ecx
	movl	36(%esp), %edx
	movl	32(%esp), %esi
	movl	%esi, 20(%esp)
	movl	%edx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	20(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.Lfmt5, (%esp)
	calll	printf
	movl	16(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.Lfmt5, (%esp)
	calll	printf
	movl	12(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.Lfmt5, (%esp)
	calll	printf
	movl	8(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.Lfmt5, (%esp)
	calll	printf
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp5:
	.size	printem, .Ltmp5-printem
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
