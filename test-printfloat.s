	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 16, 5
	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI0_0:
	.quad	4631107791820423168     ## double 42
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rax
Ltmp0:
	.cfi_def_cfa_offset 16
	movabsq	$4631107791820423168, %rax ## imm = 0x4045000000000000
	movq	%rax, (%rsp)
	leaq	L_fmt.1(%rip), %rdi
	movsd	LCPI0_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	xorl	%eax, %eax
	popq	%rdx
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_fmt:                                  ## @fmt
	.asciz	"%d\n"

L_fmt.1:                                ## @fmt.1
	.asciz	"%f\n"


.subsections_via_symbols
