	.text
	.file	"test-global1.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	subl	$12, %esp
.Ltmp0:
	.cfi_def_cfa_offset 16
	movl	$42, x
	movl	$21, y
	calll	printx
	calll	printy
	calll	incab
	calll	printx
	calll	printy
	xorl	%eax, %eax
	addl	$12, %esp
	retl
.Ltmp1:
	.size	main, .Ltmp1-main
	.cfi_endproc

	.globl	incab
	.align	16, 0x90
	.type	incab,@function
incab:                                  # @incab
	.cfi_startproc
# BB#0:                                 # %entry
	incl	x
	incl	y
	retl
.Ltmp2:
	.size	incab, .Ltmp2-incab
	.cfi_endproc

	.globl	printy
	.align	16, 0x90
	.type	printy,@function
printy:                                 # @printy
	.cfi_startproc
# BB#0:                                 # %entry
	subl	$12, %esp
.Ltmp3:
	.cfi_def_cfa_offset 16
	movl	y, %eax
	movl	%eax, 4(%esp)
	movl	$.Lfmt10, (%esp)
	calll	printf
	addl	$12, %esp
	retl
.Ltmp4:
	.size	printy, .Ltmp4-printy
	.cfi_endproc

	.globl	printx
	.align	16, 0x90
	.type	printx,@function
printx:                                 # @printx
	.cfi_startproc
# BB#0:                                 # %entry
	subl	$12, %esp
.Ltmp5:
	.cfi_def_cfa_offset 16
	movl	x, %eax
	movl	%eax, 4(%esp)
	movl	$.Lfmt15, (%esp)
	calll	printf
	addl	$12, %esp
	retl
.Ltmp6:
	.size	printx, .Ltmp6-printx
	.cfi_endproc

	.type	y,@object               # @y
	.bss
	.globl	y
	.align	4
y:
	.long	0                       # 0x0
	.size	y, 4

	.type	x,@object               # @x
	.globl	x
	.align	4
x:
	.long	0                       # 0x0
	.size	x, 4

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

	.type	.Lfmt15,@object         # @fmt15
.Lfmt15:
	.asciz	"%d\n"
	.size	.Lfmt15, 4

	.type	.Lfmt16,@object         # @fmt16
.Lfmt16:
	.asciz	"%s\n"
	.size	.Lfmt16, 4

	.type	.Lfmt17,@object         # @fmt17
.Lfmt17:
	.asciz	"%d"
	.size	.Lfmt17, 3

	.type	.Lfmt18,@object         # @fmt18
.Lfmt18:
	.asciz	"%s"
	.size	.Lfmt18, 3

	.type	.Lfmt19,@object         # @fmt19
.Lfmt19:
	.asciz	"%f\n"
	.size	.Lfmt19, 4


	.section	".note.GNU-stack","",@progbits
