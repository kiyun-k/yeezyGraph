	.text
	.file	"test-queueint.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushl	%esi
.Ltmp0:
	.cfi_def_cfa_offset 8
	subl	$56, %esp
.Ltmp1:
	.cfi_def_cfa_offset 64
.Ltmp2:
	.cfi_offset %esi, -8
	calll	initQueueId
	movl	%eax, 20(%esp)
	movl	$1074318540, 52(%esp)   # imm = 0x4008CCCC
	movl	$-858993459, 48(%esp)   # imm = 0xFFFFFFFFCCCCCCCD
	movl	$1075262259, 44(%esp)   # imm = 0x40173333
	movl	$858993459, 40(%esp)    # imm = 0x33333333
	movl	20(%esp), %esi
	fldl	48(%esp)
	fstpl	12(%esp)                # 8-byte Folded Spill
	movl	$8, (%esp)
	calll	malloc
	fldl	12(%esp)                # 8-byte Folded Reload
	fstpl	(%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	enqueue
	movl	20(%esp), %esi
	fldl	40(%esp)
	fstpl	12(%esp)                # 8-byte Folded Spill
	movl	$8, (%esp)
	calll	malloc
	fldl	12(%esp)                # 8-byte Folded Reload
	fstpl	(%eax)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	calll	enqueue
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	calll	front
	fldl	(%eax)
	fstl	32(%esp)
	fstpl	4(%esp)
	movl	$.Lfmt4, (%esp)
	calll	printf
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	calll	dequeue
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	calll	front
	fldl	(%eax)
	fstl	24(%esp)
	fstpl	4(%esp)
	movl	$.Lfmt4, (%esp)
	calll	printf
	xorl	%eax, %eax
	addl	$56, %esp
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


	.section	".note.GNU-stack","",@progbits
