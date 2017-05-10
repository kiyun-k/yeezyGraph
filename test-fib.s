	.text
	.file	"test-fib.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	subl	$12, %esp
.Ltmp0:
	.cfi_def_cfa_offset 16
	movl	$0, (%esp)
	calll	fib
	movl	%eax, 4(%esp)
	movl	$.Lfmt, (%esp)
	calll	printf
	movl	$1, (%esp)
	calll	fib
	movl	%eax, 4(%esp)
	movl	$.Lfmt, (%esp)
	calll	printf
	movl	$2, (%esp)
	calll	fib
	movl	%eax, 4(%esp)
	movl	$.Lfmt, (%esp)
	calll	printf
	movl	$3, (%esp)
	calll	fib
	movl	%eax, 4(%esp)
	movl	$.Lfmt, (%esp)
	calll	printf
	movl	$4, (%esp)
	calll	fib
	movl	%eax, 4(%esp)
	movl	$.Lfmt, (%esp)
	calll	printf
	movl	$5, (%esp)
	calll	fib
	movl	%eax, 4(%esp)
	movl	$.Lfmt, (%esp)
	calll	printf
	xorl	%eax, %eax
	addl	$12, %esp
	retl
.Ltmp1:
	.size	main, .Ltmp1-main
	.cfi_endproc

	.globl	fib
	.align	16, 0x90
	.type	fib,@function
fib:                                    # @fib
	.cfi_startproc
# BB#0:                                 # %entry
	pushl	%esi
.Ltmp2:
	.cfi_def_cfa_offset 8
	subl	$8, %esp
.Ltmp3:
	.cfi_def_cfa_offset 16
.Ltmp4:
	.cfi_offset %esi, -8
	movl	16(%esp), %eax
	movl	%eax, 4(%esp)
	cmpl	$2, %eax
	jge	.LBB1_1
# BB#2:                                 # %then
	movl	$1, %eax
	jmp	.LBB1_3
.LBB1_1:                                # %merge
	movl	4(%esp), %eax
	decl	%eax
	movl	%eax, (%esp)
	calll	fib
	movl	%eax, %esi
	movl	4(%esp), %eax
	addl	$-2, %eax
	movl	%eax, (%esp)
	calll	fib
	addl	%esi, %eax
.LBB1_3:                                # %then
	addl	$8, %esp
	popl	%esi
	retl
.Ltmp5:
	.size	fib, .Ltmp5-fib
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
