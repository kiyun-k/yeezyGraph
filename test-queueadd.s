	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 16, 5
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%r14
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
	.cfi_offset %r14, -16
	callq	_initQueueId
	movq	%rax, (%rsp)
	movabsq	$4614162998222441677, %r14 ## imm = 0x4008CCCCCCCCCCCD
	movq	%r14, 16(%rsp)
	movq	(%rsp), %rbx
	movl	$8, %edi
	callq	_malloc
	movq	%r14, (%rax)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	_enqueue
	movq	(%rsp), %rdi
	callq	_front
	movsd	(%rax), %xmm0           ## xmm0 = mem[0],zero
	movsd	%xmm0, 8(%rsp)
	leaq	L_fmt.1(%rip), %rdi
	movb	$1, %al
	callq	_printf
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_fmt:                                  ## @fmt
	.asciz	"%d\n"

L_fmt.1:                                ## @fmt.1
	.asciz	"%f\n"


.subsections_via_symbols
