	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 16, 5
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%rbx
Ltmp1:
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
Ltmp2:
	.cfi_def_cfa_offset 48
Ltmp3:
	.cfi_offset %rbx, -24
Ltmp4:
	.cfi_offset %rbp, -16
	movl	$3, 20(%rsp)
	movl	$5, 12(%rsp)
	callq	_initQueueId
	movq	%rax, %rbx
	movq	%rbx, (%rsp)
	movl	20(%rsp), %ebp
	movl	$4, %edi
	callq	_malloc
	movl	%ebp, (%rax)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	_enqueue
	movq	(%rsp), %rdi
	callq	_front
	movl	(%rax), %eax
	movl	%eax, 16(%rsp)
	movq	(%rsp), %rdi
	callq	_dequeue
	movl	16(%rsp), %esi
	leaq	L_fmt(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_fmt:                                  ## @fmt
	.asciz	"%d\n"

L_fmt.1:                                ## @fmt.1
	.asciz	"%f\n"


.subsections_via_symbols
