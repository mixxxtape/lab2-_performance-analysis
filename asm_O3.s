	.file	"lab2.cpp"
	.intel_syntax noprefix
	.text
#APP
	.globl _ZSt21ios_base_library_initv
#NO_APP
	.p2align 4
	.globl	_Z7normVecRKSt6vectorIdSaIdEE
	.type	_Z7normVecRKSt6vectorIdSaIdEE, @function
_Z7normVecRKSt6vectorIdSaIdEE:
.LFB3652:
	.cfi_startproc
	endbr64
	mov	rax, QWORD PTR [rdi]
	mov	rdx, QWORD PTR 8[rdi]
	vxorpd	xmm1, xmm1, xmm1
	cmp	rdx, rax
	je	.L1
	vmovq	xmm2, QWORD PTR .LC1[rip]
	.p2align 4,,10
	.p2align 3
.L4:
	vmovsd	xmm0, QWORD PTR [rax]
	add	rax, 8
	cmp	rdx, rax
	vandpd	xmm0, xmm0, xmm2
	vmaxsd	xmm1, xmm0, xmm1
	jne	.L4
.L1:
	vmovsd	xmm0, xmm1, xmm1
	ret
	.cfi_endproc
.LFE3652:
	.size	_Z7normVecRKSt6vectorIdSaIdEE, .-_Z7normVecRKSt6vectorIdSaIdEE
	.p2align 4
	.globl	_Z7normMatRKSt6vectorIdSaIdEEi
	.type	_Z7normMatRKSt6vectorIdSaIdEEi, @function
_Z7normMatRKSt6vectorIdSaIdEEi:
.LFB3653:
	.cfi_startproc
	endbr64
	test	esi, esi
	jle	.L17
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	r9d, esi
	movsx	r11, esi
	vmovq	xmm5, QWORD PTR .LC1[rip]
	shr	r9d, 2
	lea	r10d, -1[rsi]
	vxorpd	xmm6, xmm6, xmm6
	xor	edx, edx
	vbroadcastsd	ymm4, QWORD PTR .LC3[rip]
	sal	r9, 5
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r14
	push	r13
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	mov	r13d, esi
	push	r12
	and	r13d, -4
	.cfi_offset 12, -40
	lea	r12, 0[0+r11*8]
	push	rbx
	.cfi_offset 3, -48
	mov	r8, QWORD PTR [rdi]
	mov	ebx, esi
	xor	edi, edi
	and	ebx, 3
	mov	rcx, r8
	.p2align 4,,10
	.p2align 3
.L16:
	cmp	r10d, 2
	jbe	.L18
	lea	r14, [rcx+r9]
	mov	rax, rcx
	vxorpd	xmm0, xmm0, xmm0
	.p2align 4,,10
	.p2align 3
.L12:
	vandpd	ymm1, ymm4, YMMWORD PTR [rax]
	add	rax, 32
	cmp	r14, rax
	vaddsd	xmm0, xmm0, xmm1
	vunpckhpd	xmm2, xmm1, xmm1
	vextractf128	xmm1, ymm1, 0x1
	vaddsd	xmm0, xmm0, xmm2
	vaddsd	xmm0, xmm0, xmm1
	vunpckhpd	xmm1, xmm1, xmm1
	vaddsd	xmm0, xmm0, xmm1
	jne	.L12
	test	ebx, ebx
	mov	eax, r13d
	je	.L13
.L11:
	movsx	r14, eax
	add	r14, rdx
	vmovsd	xmm1, QWORD PTR [r8+r14*8]
	lea	r14d, 1[rax]
	cmp	esi, r14d
	vandpd	xmm1, xmm1, xmm5
	vaddsd	xmm0, xmm0, xmm1
	jle	.L13
	movsx	r14, r14d
	add	eax, 2
	add	r14, rdx
	cmp	esi, eax
	vmovsd	xmm1, QWORD PTR [r8+r14*8]
	vandpd	xmm1, xmm1, xmm5
	vaddsd	xmm0, xmm0, xmm1
	jle	.L13
	cdqe
	add	rax, rdx
	vmovsd	xmm1, QWORD PTR [r8+rax*8]
	vandpd	xmm1, xmm1, xmm5
	vaddsd	xmm0, xmm0, xmm1
.L13:
	add	edi, 1
	add	rdx, r11
	vmaxsd	xmm6, xmm0, xmm6
	add	rcx, r12
	cmp	esi, edi
	jne	.L16
	vzeroupper
	pop	rbx
	vmovsd	xmm0, xmm6, xmm6
	pop	r12
	pop	r13
	pop	r14
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L18:
	.cfi_restore_state
	vxorpd	xmm0, xmm0, xmm0
	xor	eax, eax
	jmp	.L11
.L17:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	vxorpd	xmm6, xmm6, xmm6
	vmovsd	xmm0, xmm6, xmm6
	ret
	.cfi_endproc
.LFE3653:
	.size	_Z7normMatRKSt6vectorIdSaIdEEi, .-_Z7normMatRKSt6vectorIdSaIdEEi
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"cannot create std::vector larger than max_size()"
	.text
	.p2align 4
	.globl	_Z8residualRKSt6vectorIdSaIdEES3_S3_i
	.type	_Z8residualRKSt6vectorIdSaIdEES3_S3_i, @function
_Z8residualRKSt6vectorIdSaIdEES3_S3_i:
.LFB3661:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	movsx	r13, ecx
	push	r12
	mov	rax, r13
	push	rbx
	and	rsp, -32
	sub	rsp, 32
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	shr	rax, 60
	mov	QWORD PTR 24[rsp], rdi
	mov	QWORD PTR 16[rsp], rdx
	jne	.L61
	test	r13, r13
	vxorpd	xmm1, xmm1, xmm1
	je	.L29
	lea	r9, 0[0+r13*8]
	mov	r14, rsi
	mov	rbx, r13
	mov	rdi, r9
	mov	QWORD PTR 8[rsp], r9
	call	_Znwm@PLT
	cmp	r13, 1
	mov	r9d, 8
	mov	QWORD PTR [rax], 0x000000000
	mov	r12, rax
	lea	r11, 8[rax]
	je	.L32
	mov	r9, QWORD PTR 8[rsp]
	lea	r15, [rax+r9]
	cmp	r11, r15
	je	.L34
	lea	rdx, -8[r9]
	xor	esi, esi
	mov	rdi, r11
	mov	QWORD PTR 8[rsp], r9
	call	memset@PLT
	mov	r9, QWORD PTR 8[rsp]
.L34:
	mov	r11, r15
.L32:
	mov	rax, QWORD PTR 24[rsp]
	mov	r8d, ebx
	mov	QWORD PTR 24[rsp], r11
	xor	ecx, ecx
	mov	r15, QWORD PTR [r14]
	shr	r8d, 2
	mov	r14d, ebx
	xor	r10d, r10d
	mov	rdi, QWORD PTR [rax]
	mov	rax, QWORD PTR 16[rsp]
	sal	r8, 5
	and	r14d, -4
	mov	QWORD PTR 16[rsp], r9
	vmovq	xmm4, QWORD PTR .LC5[rip]
	mov	rdx, QWORD PTR [rax]
	.p2align 4,,10
	.p2align 3
.L40:
	vmovsd	xmm0, QWORD PTR [r15+r10*8]
	cmp	ebx, 3
	vxorpd	xmm0, xmm0, xmm4
	jle	.L47
	lea	rsi, [rdi+rcx*8]
	xor	eax, eax
	.p2align 4,,10
	.p2align 3
.L36:
	vmovupd	ymm5, YMMWORD PTR [rsi+rax]
	vmulpd	ymm2, ymm5, YMMWORD PTR [rdx+rax]
	add	rax, 32
	cmp	rax, r8
	vaddsd	xmm0, xmm2, xmm0
	vunpckhpd	xmm3, xmm2, xmm2
	vextractf128	xmm1, ymm2, 0x1
	vaddsd	xmm0, xmm0, xmm3
	vaddsd	xmm0, xmm0, xmm1
	vunpckhpd	xmm1, xmm1, xmm1
	vaddsd	xmm0, xmm0, xmm1
	jne	.L36
	cmp	r14d, ebx
	je	.L37
	mov	esi, r14d
	mov	eax, r14d
.L35:
	mov	r9d, ebx
	sub	r9d, esi
	cmp	r9d, 1
	je	.L38
	lea	r11, [rcx+rsi]
	vmovupd	xmm1, XMMWORD PTR [rdx+rsi*8]
	test	r9b, 1
	vmulpd	xmm1, xmm1, XMMWORD PTR [rdi+r11*8]
	vaddsd	xmm0, xmm0, xmm1
	vunpckhpd	xmm1, xmm1, xmm1
	vaddsd	xmm0, xmm1, xmm0
	je	.L37
	and	r9d, -2
	add	eax, r9d
.L38:
	cdqe
	lea	rsi, [rcx+rax]
	vmovsd	xmm6, QWORD PTR [rdi+rsi*8]
	vfmadd231sd	xmm0, xmm6, QWORD PTR [rdx+rax*8]
.L37:
	vmovsd	QWORD PTR [r12+r10*8], xmm0
	add	r10, 1
	add	rcx, r13
	cmp	ebx, r10d
	jg	.L40
	mov	r11, QWORD PTR 24[rsp]
	mov	r9, QWORD PTR 16[rsp]
	cmp	r11, r12
	je	.L48
	vmovq	xmm2, QWORD PTR .LC1[rip]
	mov	rax, r12
	vxorpd	xmm1, xmm1, xmm1
	.p2align 4,,10
	.p2align 3
.L44:
	vmovsd	xmm0, QWORD PTR [rax]
	add	rax, 8
	cmp	rax, r11
	vandpd	xmm0, xmm0, xmm2
	vmaxsd	xmm1, xmm0, xmm1
	jne	.L44
.L41:
	vmovsd	QWORD PTR 24[rsp], xmm1
	mov	rsi, r9
	mov	rdi, r12
	vzeroupper
	call	_ZdlPvm@PLT
	vmovsd	xmm1, QWORD PTR 24[rsp]
.L29:
	lea	rsp, -40[rbp]
	vmovsd	xmm0, xmm1, xmm1
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L47:
	.cfi_restore_state
	xor	esi, esi
	xor	eax, eax
	jmp	.L35
.L48:
	vxorpd	xmm1, xmm1, xmm1
	jmp	.L41
.L61:
	lea	rdi, .LC4[rip]
	call	_ZSt20__throw_length_errorPKc@PLT
	.cfi_endproc
.LFE3661:
	.size	_Z8residualRKSt6vectorIdSaIdEES3_S3_i, .-_Z8residualRKSt6vectorIdSaIdEES3_S3_i
	.section	.text._ZNSt6vectorIdSaIdEED2Ev,"axG",@progbits,_ZNSt6vectorIdSaIdEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIdSaIdEED2Ev
	.type	_ZNSt6vectorIdSaIdEED2Ev, @function
_ZNSt6vectorIdSaIdEED2Ev:
.LFB4044:
	.cfi_startproc
	endbr64
	mov	rax, QWORD PTR [rdi]
	test	rax, rax
	je	.L64
	mov	rsi, QWORD PTR 16[rdi]
	mov	rdi, rax
	sub	rsi, rax
	jmp	_ZdlPvm@PLT
	.p2align 4,,10
	.p2align 3
.L64:
	ret
	.cfi_endproc
.LFE4044:
	.size	_ZNSt6vectorIdSaIdEED2Ev, .-_ZNSt6vectorIdSaIdEED2Ev
	.weak	_ZNSt6vectorIdSaIdEED1Ev
	.set	_ZNSt6vectorIdSaIdEED1Ev,_ZNSt6vectorIdSaIdEED2Ev
	.section	.text._ZNSt6vectorIdSaIdEE14_M_fill_assignEmRKd,"axG",@progbits,_ZNSt6vectorIdSaIdEE14_M_fill_assignEmRKd,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIdSaIdEE14_M_fill_assignEmRKd
	.type	_ZNSt6vectorIdSaIdEE14_M_fill_assignEmRKd, @function
_ZNSt6vectorIdSaIdEE14_M_fill_assignEmRKd:
.LFB4233:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rax, rsi
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r13
	.cfi_offset 13, -24
	mov	r13, rdx
	push	r12
	push	rbx
	mov	rdx, QWORD PTR [rdi]
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	mov	rbx, rdi
	mov	rcx, QWORD PTR 16[rdi]
	sub	rcx, rdx
	and	rsp, -32
	sar	rcx, 3
	cmp	rcx, rsi
	jb	.L137
	mov	rdi, QWORD PTR 8[rdi]
	mov	rsi, rdi
	sub	rsi, rdx
	sar	rsi, 3
	cmp	rsi, rax
	jnb	.L73
	cmp	rdx, rdi
	vmovsd	xmm0, QWORD PTR 0[r13]
	je	.L74
	lea	r9, -8[rdi]
	mov	rcx, rdx
	sub	r9, rdx
	mov	r8, r9
	shr	r8, 3
	add	r8, 1
	cmp	r9, 16
	jbe	.L75
	mov	r9, r8
	vbroadcastsd	ymm1, xmm0
	shr	r9, 2
	sal	r9, 5
	lea	r10, [r9+rdx]
	and	r9d, 32
	je	.L76
	lea	rcx, 32[rdx]
	vmovupd	YMMWORD PTR [rdx], ymm1
	cmp	r10, rcx
	je	.L131
	.p2align 4,,10
	.p2align 3
.L76:
	vmovupd	YMMWORD PTR [rcx], ymm1
	add	rcx, 64
	vmovupd	YMMWORD PTR -32[rcx], ymm1
	cmp	r10, rcx
	jne	.L76
.L131:
	test	r8b, 3
	je	.L77
	and	r8, -4
	lea	rdx, [rdx+r8*8]
.L75:
	lea	rcx, 8[rdx]
	vmovsd	QWORD PTR [rdx], xmm0
	cmp	rdi, rcx
	je	.L77
	lea	rcx, 16[rdx]
	vmovsd	QWORD PTR 8[rdx], xmm0
	cmp	rdi, rcx
	je	.L77
	vmovsd	QWORD PTR 16[rdx], xmm0
.L77:
	vmovsd	xmm0, QWORD PTR 0[r13]
.L74:
	sub	rax, rsi
	sal	rax, 3
	lea	rcx, [rdi+rax]
	cmp	rdi, rcx
	je	.L82
	sub	rax, 8
	mov	rdx, rax
	shr	rdx, 3
	add	rdx, 1
	cmp	rax, 16
	jbe	.L79
	mov	rsi, rdx
	vbroadcastsd	ymm1, xmm0
	mov	rax, rdi
	shr	rsi, 2
	sal	rsi, 5
	lea	r8, [rsi+rdi]
	and	esi, 32
	je	.L80
	lea	rax, 32[rdi]
	vmovupd	YMMWORD PTR [rdi], ymm1
	cmp	r8, rax
	je	.L130
	.p2align 4,,10
	.p2align 3
.L80:
	vmovupd	YMMWORD PTR [rax], ymm1
	add	rax, 64
	vmovupd	YMMWORD PTR -32[rax], ymm1
	cmp	r8, rax
	jne	.L80
.L130:
	test	dl, 3
	je	.L82
	and	rdx, -4
	lea	rdi, [rdi+rdx*8]
.L79:
	lea	rax, 8[rdi]
	vmovsd	QWORD PTR [rdi], xmm0
	cmp	rcx, rax
	je	.L82
	lea	rax, 16[rdi]
	vmovsd	QWORD PTR 8[rdi], xmm0
	cmp	rcx, rax
	je	.L82
	vmovsd	QWORD PTR 16[rdi], xmm0
.L82:
	mov	QWORD PTR 8[rbx], rcx
	vzeroupper
.L135:
	lea	rsp, -24[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L73:
	.cfi_restore_state
	test	rax, rax
	je	.L84
	sal	rax, 3
	vmovsd	xmm1, QWORD PTR 0[r13]
	lea	rsi, [rdx+rax]
	cmp	rdx, rsi
	je	.L85
	sub	rax, 8
	mov	rcx, rax
	shr	rcx, 3
	add	rcx, 1
	cmp	rax, 16
	jbe	.L86
	mov	r8, rcx
	vbroadcastsd	ymm0, xmm1
	mov	rax, rdx
	shr	r8, 2
	sal	r8, 5
	lea	r9, [r8+rdx]
	and	r8d, 32
	je	.L87
	lea	rax, 32[rdx]
	vmovupd	YMMWORD PTR [rdx], ymm0
	cmp	r9, rax
	je	.L132
	.p2align 4,,10
	.p2align 3
.L87:
	vmovupd	YMMWORD PTR [rax], ymm0
	add	rax, 64
	vmovupd	YMMWORD PTR -32[rax], ymm0
	cmp	r9, rax
	jne	.L87
.L132:
	mov	rax, rcx
	and	rax, -4
	and	ecx, 3
	lea	rdx, [rdx+rax*8]
	je	.L134
	vzeroupper
.L86:
	lea	rax, 8[rdx]
	vmovsd	QWORD PTR [rdx], xmm1
	cmp	rsi, rax
	je	.L85
	lea	rax, 16[rdx]
	vmovsd	QWORD PTR 8[rdx], xmm1
	cmp	rsi, rax
	je	.L85
	vmovsd	QWORD PTR 16[rdx], xmm1
.L85:
	mov	rdx, rsi
.L84:
	cmp	rdi, rdx
	je	.L135
	mov	QWORD PTR 8[rbx], rdx
	lea	rsp, -24[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L137:
	.cfi_restore_state
	mov	rdi, rsi
	shr	rdi, 60
	jne	.L138
	lea	r12, 0[0+rsi*8]
	mov	rdi, r12
	call	_Znwm@PLT
	vmovsd	xmm1, QWORD PTR 0[r13]
	lea	rdi, [rax+r12]
	vmovq	xmm3, rax
	mov	rdx, rax
	lea	rax, -8[r12]
	vpinsrq	xmm2, xmm3, rdi, 1
	mov	rcx, rax
	shr	rcx, 3
	add	rcx, 1
	cmp	rax, 16
	jbe	.L68
	mov	rsi, rcx
	vbroadcastsd	ymm0, xmm1
	mov	rax, rdx
	shr	rsi, 2
	sal	rsi, 5
	lea	r8, [rsi+rdx]
	and	esi, 32
	je	.L69
	lea	rax, 32[rdx]
	vmovupd	YMMWORD PTR [rdx], ymm0
	cmp	r8, rax
	je	.L129
	.p2align 4,,10
	.p2align 3
.L69:
	vmovupd	YMMWORD PTR [rax], ymm0
	add	rax, 64
	vmovupd	YMMWORD PTR -32[rax], ymm0
	cmp	r8, rax
	jne	.L69
.L129:
	mov	rax, rcx
	and	rax, -4
	and	ecx, 3
	lea	rdx, [rdx+rax*8]
	je	.L133
	vzeroupper
.L68:
	lea	rax, 8[rdx]
	vmovsd	QWORD PTR [rdx], xmm1
	cmp	rdi, rax
	je	.L70
	lea	rax, 16[rdx]
	vmovsd	QWORD PTR 8[rdx], xmm1
	cmp	rdi, rax
	je	.L70
	vmovsd	QWORD PTR 16[rdx], xmm1
.L70:
	mov	rax, QWORD PTR [rbx]
	mov	rsi, QWORD PTR 16[rbx]
	vmovdqu	XMMWORD PTR [rbx], xmm2
	mov	QWORD PTR 16[rbx], rdi
	test	rax, rax
	je	.L135
	lea	rsp, -24[rbp]
	sub	rsi, rax
	mov	rdi, rax
	pop	rbx
	pop	r12
	pop	r13
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	jmp	_ZdlPvm@PLT
	.p2align 4,,10
	.p2align 3
.L133:
	.cfi_restore_state
	vzeroupper
	jmp	.L70
	.p2align 4,,10
	.p2align 3
.L134:
	vzeroupper
	jmp	.L85
.L138:
	lea	rdi, .LC4[rip]
	call	_ZSt20__throw_length_errorPKc@PLT
	.cfi_endproc
.LFE4233:
	.size	_ZNSt6vectorIdSaIdEE14_M_fill_assignEmRKd, .-_ZNSt6vectorIdSaIdEE14_M_fill_assignEmRKd
	.text
	.p2align 4
	.globl	_Z10makeSystemiRSt6vectorIdSaIdEES2_
	.type	_Z10makeSystemiRSt6vectorIdSaIdEES2_, @function
_Z10makeSystemiRSt6vectorIdSaIdEES2_:
.LFB3655:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	.cfi_offset 15, -24
	movsx	r15, edi
	push	r14
	push	r13
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	lea	r13, -64[rbp]
	push	r12
	.cfi_offset 12, -48
	mov	r12, rdx
	mov	rdx, r13
	push	r10
	push	rbx
	.cfi_offset 10, -56
	.cfi_offset 3, -64
	mov	rbx, rsi
	mov	rsi, r15
	imul	rsi, r15
	mov	rdi, rbx
	sub	rsp, 48
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -56[rbp], rax
	xor	eax, eax
	mov	QWORD PTR -64[rbp], 0x000000000
	call	_ZNSt6vectorIdSaIdEE14_M_fill_assignEmRKd
	mov	rdx, r13
	mov	rsi, r15
	mov	rdi, r12
	mov	QWORD PTR -64[rbp], 0x000000000
	call	_ZNSt6vectorIdSaIdEE14_M_fill_assignEmRKd
	cmp	r15d, 4
	je	.L140
	test	r15d, r15d
	mov	r14, r15
	jle	.L139
	cmp	r15d, 1
	mov	rbx, QWORD PTR [rbx]
	je	.L168
	lea	edx, -1[r15]
	vmovsd	xmm0, QWORD PTR .LC19[rip]
	vmovsd	xmm1, QWORD PTR .LC12[rip]
	lea	rsi, 8[0+r15*8]
	cmp	edx, r15d
	lea	rax, [rbx+rsi]
	mov	ecx, 1
	cmovg	edx, r15d
	vmovsd	QWORD PTR [rbx], xmm0
	vmovsd	QWORD PTR 8[rbx], xmm1
	cmp	edx, 1
	je	.L150
.L152:
	add	ecx, 1
	vmovsd	QWORD PTR [rax], xmm0
	vmovsd	QWORD PTR -8[rax], xmm1
	vmovsd	QWORD PTR 8[rax], xmm1
	add	rax, rsi
	cmp	ecx, edx
	jl	.L152
	cmp	ecx, r14d
	jge	.L148
	mov	edx, ecx
.L150:
	movsx	rcx, edx
	imul	rcx, rsi
	add	rcx, rbx
	mov	rax, rcx
	vmovsd	QWORD PTR [rcx], xmm0
	jmp	.L155
	.p2align 4,,10
	.p2align 3
.L169:
	mov	rcx, rax
	vmovsd	QWORD PTR [rax], xmm0
.L155:
	add	edx, 1
	add	rax, rsi
	vmovsd	QWORD PTR -8[rcx], xmm1
	cmp	r14d, edx
	jg	.L169
	jmp	.L148
	.p2align 4,,10
	.p2align 3
.L168:
	mov	rax, QWORD PTR .LC19[rip]
	mov	QWORD PTR [rbx], rax
.L148:
	mov	r13, QWORD PTR [r12]
	lea	rax, 0[0+r15*8]
	mov	r12d, r14d
	mov	QWORD PTR -88[rbp], rax
	add	rax, r13
	mov	QWORD PTR -80[rbp], rax
	.p2align 4,,10
	.p2align 3
.L151:
	cmp	r14d, 1
	vxorpd	xmm4, xmm4, xmm4
	mov	r15d, 1
	vaddsd	xmm1, xmm4, QWORD PTR [rbx]
	je	.L158
	.p2align 4,,10
	.p2align 3
.L156:
	vxorpd	xmm3, xmm3, xmm3
	vmovsd	QWORD PTR -72[rbp], xmm1
	vcvtsi2sd	xmm0, xmm3, r15d
	vmulsd	xmm0, xmm0, QWORD PTR .LC20[rip]
	call	sin@PLT
	vaddsd	xmm0, xmm0, QWORD PTR .LC12[rip]
	vmulsd	xmm0, xmm0, QWORD PTR [rbx+r15*8]
	add	r15, 1
	vmovsd	xmm1, QWORD PTR -72[rbp]
	cmp	r12, r15
	vaddsd	xmm1, xmm1, xmm0
	jne	.L156
.L158:
	mov	rax, QWORD PTR -88[rbp]
	vmovsd	QWORD PTR 0[r13], xmm1
	add	r13, 8
	add	rbx, rax
	cmp	QWORD PTR -80[rbp], r13
	jne	.L151
.L139:
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	jne	.L170
	add	rsp, 48
	pop	rbx
	pop	r10
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L140:
	.cfi_restore_state
	mov	rax, QWORD PTR [rbx]
	mov	rdx, QWORD PTR [r12]
	lea	rcx, 128[rax]
	cmp	rdx, rcx
	jnb	.L161
	lea	rcx, 32[rdx]
	cmp	rax, rcx
	jb	.L143
.L161:
	vmovapd	ymm0, YMMWORD PTR .LC6[rip]
	vmovupd	YMMWORD PTR [rax], ymm0
	vmovapd	ymm0, YMMWORD PTR .LC7[rip]
	vmovupd	YMMWORD PTR 32[rax], ymm0
	vmovapd	ymm0, YMMWORD PTR .LC8[rip]
	vmovupd	YMMWORD PTR 64[rax], ymm0
	vmovapd	ymm0, YMMWORD PTR .LC9[rip]
	vmovupd	YMMWORD PTR 96[rax], ymm0
	vmovapd	ymm0, YMMWORD PTR .LC10[rip]
	vmovupd	YMMWORD PTR [rdx], ymm0
	vzeroupper
	jmp	.L139
.L143:
	vmovsd	xmm0, QWORD PTR .LC12[rip]
	vmovsd	xmm1, QWORD PTR .LC13[rip]
	mov	QWORD PTR 16[rax], 0x000000000
	vmovsd	xmm2, QWORD PTR .LC11[rip]
	mov	rdi, QWORD PTR .LC14[rip]
	mov	QWORD PTR 24[rax], 0x000000000
	vmovsd	QWORD PTR 8[rax], xmm0
	vmovsd	QWORD PTR [rax], xmm2
	vmovsd	QWORD PTR [rdx], xmm1
	mov	QWORD PTR 40[rax], rdi
	mov	rdi, QWORD PTR .LC15[rip]
	mov	QWORD PTR 56[rax], 0x000000000
	vmovsd	QWORD PTR 32[rax], xmm0
	vmovsd	QWORD PTR 48[rax], xmm1
	mov	QWORD PTR 8[rdx], rdi
	mov	rdi, QWORD PTR .LC16[rip]
	mov	QWORD PTR 64[rax], 0x000000000
	vmovsd	QWORD PTR 72[rax], xmm0
	vmovsd	QWORD PTR 80[rax], xmm1
	vmovsd	QWORD PTR 88[rax], xmm2
	mov	QWORD PTR 16[rdx], rdi
	mov	rdi, QWORD PTR .LC17[rip]
	mov	QWORD PTR 96[rax], 0x000000000
	mov	QWORD PTR 104[rax], 0x000000000
	mov	QWORD PTR 120[rax], rdi
	vmovsd	QWORD PTR 112[rax], xmm0
	mov	rax, QWORD PTR .LC18[rip]
	mov	QWORD PTR 24[rdx], rax
	jmp	.L139
.L170:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE3655:
	.size	_Z10makeSystemiRSt6vectorIdSaIdEES2_, .-_Z10makeSystemiRSt6vectorIdSaIdEES2_
	.p2align 4
	.globl	_Z7inverseSt6vectorIdSaIdEEiRS1_
	.type	_Z7inverseSt6vectorIdSaIdEEiRS1_, @function
_Z7inverseSt6vectorIdSaIdEEiRS1_:
.LFB3659:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	mov	r14, rdi
	push	r13
	push	r12
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	mov	r12, rdx
	push	rbx
	.cfi_offset 3, -56
	movsx	rbx, esi
	mov	rdi, r12
	mov	rsi, rbx
	imul	rsi, rbx
	and	rsp, -32
	sub	rsp, 224
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 216[rsp], rax
	xor	eax, eax
	lea	rdx, 208[rsp]
	mov	QWORD PTR 208[rsp], 0x000000000
	call	_ZNSt6vectorIdSaIdEE14_M_fill_assignEmRKd
	test	ebx, ebx
	jle	.L213
	lea	rcx, 8[0+rbx*8]
	mov	r13, QWORD PTR [r12]
	mov	r15, rbx
	xor	edx, edx
	mov	QWORD PTR 40[rsp], rcx
	vmovsd	xmm0, QWORD PTR .LC12[rip]
	mov	rax, r13
	.p2align 4,,10
	.p2align 3
.L174:
	mov	r10d, edx
	add	edx, 1
	vmovsd	QWORD PTR [rax], xmm0
	add	rax, rcx
	cmp	r15d, edx
	jne	.L174
	mov	rax, QWORD PTR 40[rsp]
	mov	rdi, QWORD PTR [r14]
	mov	r12, r13
	mov	DWORD PTR 200[rsp], edx
	mov	QWORD PTR 56[rsp], 0
	vmovq	xmm3, QWORD PTR .LC1[rip]
	lea	rsi, -8[rax]
	mov	rax, rbx
	mov	QWORD PTR 48[rsp], rdi
	mov	r14, rdi
	neg	rax
	mov	QWORD PTR 32[rsp], rsi
	mov	r11, rdi
	vmovsd	xmm4, QWORD PTR .LC21[rip]
	sal	rax, 3
	mov	QWORD PTR 88[rsp], rsi
	mov	QWORD PTR 24[rsp], rax
	lea	rax, 32[r13]
	mov	QWORD PTR 128[rsp], rax
	mov	QWORD PTR 152[rsp], rax
	lea	rax, 32[rdi]
	mov	QWORD PTR 120[rsp], rax
	mov	QWORD PTR 104[rsp], rax
	mov	eax, edx
	shr	eax, 2
	mov	QWORD PTR 80[rsp], rdi
	sal	rax, 5
	mov	QWORD PTR 192[rsp], 0
	mov	QWORD PTR 96[rsp], rax
	mov	eax, edx
	and	edx, 3
	and	eax, -4
	mov	DWORD PTR 112[rsp], 0
	mov	DWORD PTR 116[rsp], eax
	mov	QWORD PTR 168[rsp], 0
	mov	QWORD PTR 176[rsp], 0
	mov	DWORD PTR 72[rsp], edx
	mov	DWORD PTR 204[rsp], r10d
.L212:
	mov	ecx, DWORD PTR 112[rsp]
	mov	r9d, DWORD PTR 204[rsp]
	mov	rax, QWORD PTR 80[rsp]
	mov	r8d, ecx
	mov	DWORD PTR 76[rsp], ecx
	add	ecx, 1
	cmp	r9d, r8d
	mov	DWORD PTR 112[rsp], ecx
	vmovsd	xmm5, QWORD PTR [rax]
	jle	.L175
	mov	rax, QWORD PTR 168[rsp]
	add	rax, rbx
	mov	QWORD PTR 64[rsp], rax
	mov	rdx, rax
	jmp	.L177
	.p2align 4,,10
	.p2align 3
.L272:
	movsx	rax, r8d
	vmovsd	xmm0, xmm2, xmm2
	lea	esi, 1[rcx]
	add	rdx, rbx
	imul	rax, rbx
	cmp	r9d, ecx
	je	.L271
.L217:
	mov	ecx, esi
.L177:
	vmovsd	xmm1, QWORD PTR [r14+rdx*8]
	vandpd	xmm2, xmm5, xmm3
	vandpd	xmm0, xmm1, xmm3
	vcomisd	xmm0, xmm2
	jbe	.L272
	mov	rax, rdx
	add	rdx, rbx
	cmp	r9d, ecx
	mov	r8d, ecx
	vmovsd	xmm5, xmm1, xmm1
	lea	esi, 1[rcx]
	jne	.L217
.L271:
	vcomisd	xmm4, xmm0
	ja	.L227
	mov	esi, DWORD PTR 176[rsp]
	cmp	r8d, esi
	jne	.L178
.L264:
	mov	rax, QWORD PTR 48[rsp]
	vmovsd	xmm1, QWORD PTR [rax]
.L179:
	mov	rax, QWORD PTR 104[rsp]
	cmp	r12, rax
	jnb	.L181
	mov	rax, QWORD PTR 152[rsp]
	cmp	r11, rax
	jnb	.L181
.L180:
	mov	rax, QWORD PTR 192[rsp]
	mov	rdx, QWORD PTR 88[rsp]
	.p2align 4,,10
	.p2align 3
.L194:
	vmovsd	xmm0, QWORD PTR [rdi+rax]
	vdivsd	xmm0, xmm0, xmm1
	vmovsd	QWORD PTR [rdi+rax], xmm0
	vmovsd	xmm0, QWORD PTR 0[r13+rax]
	vdivsd	xmm0, xmm0, xmm1
	vmovsd	QWORD PTR 0[r13+rax], xmm0
	add	rax, 8
	cmp	rdx, rax
	jne	.L194
	.p2align 4,,10
	.p2align 3
.L195:
	lea	rax, 8[r11]
	xor	r9d, r9d
	xor	r8d, r8d
	mov	QWORD PTR 184[rsp], r11
	mov	QWORD PTR 144[rsp], rax
	mov	rax, QWORD PTR 56[rsp]
	mov	QWORD PTR 160[rsp], r14
	mov	rsi, QWORD PTR 168[rsp]
	sub	rax, 8
	mov	QWORD PTR 136[rsp], rax
	mov	eax, DWORD PTR 176[rsp]
	cmp	r9d, eax
	je	.L273
	.p2align 4,,10
	.p2align 3
.L199:
	mov	rax, QWORD PTR 160[rsp]
	lea	rcx, 0[0+r8*8]
	cmp	DWORD PTR 200[rsp], 1
	lea	rdx, 0[r13+rcx]
	vmovsd	xmm0, QWORD PTR [rax+r8*8]
	lea	rax, [rdi+rcx]
	je	.L202
	mov	rax, QWORD PTR 120[rsp]
	mov	r15, QWORD PTR 128[rsp]
	mov	r11, QWORD PTR 144[rsp]
	lea	r10, [r15+rcx]
	lea	r14, [rax+rcx]
	lea	rax, [rdi+rcx]
	cmp	rax, r10
	setnb	r10b
	cmp	rdx, r14
	setnb	r15b
	or	r10d, r15d
	mov	r15, rdx
	sub	r15, r11
	mov	r11, QWORD PTR 136[rsp]
	cmp	r15, 16
	seta	r15b
	and	r10d, r15d
	lea	r15, [r11+rcx]
	cmp	r15, 16
	seta	r15b
	test	r10b, r15b
	je	.L202
	mov	r11, QWORD PTR 152[rsp]
	cmp	rax, r11
	setnb	r10b
	cmp	r12, r14
	setnb	r14b
	or	r14b, r10b
	je	.L202
	cmp	DWORD PTR 204[rsp], 2
	jbe	.L225
	mov	r11, QWORD PTR 184[rsp]
	mov	r14, QWORD PTR 96[rsp]
	vbroadcastsd	ymm1, xmm0
	xor	r10d, r10d
	.p2align 4,,10
	.p2align 3
.L204:
	vmovupd	ymm2, YMMWORD PTR [r11+r10]
	vfnmadd213pd	ymm2, ymm1, YMMWORD PTR [rax+r10]
	vmovupd	YMMWORD PTR [rax+r10], ymm2
	vmovupd	ymm2, YMMWORD PTR [r12+r10]
	vfnmadd213pd	ymm2, ymm1, YMMWORD PTR [rdx+r10]
	vmovupd	YMMWORD PTR [rdx+r10], ymm2
	add	r10, 32
	cmp	r14, r10
	jne	.L204
	mov	edx, DWORD PTR 116[rsp]
	cmp	DWORD PTR 200[rsp], edx
	mov	QWORD PTR 184[rsp], r11
	lea	r10, [r8+rbx]
	je	.L206
	mov	r14d, DWORD PTR 72[rsp]
	cmp	r14d, 1
	mov	eax, r14d
	je	.L226
	mov	r10d, edx
	mov	r15d, edx
.L203:
	lea	rdx, [r10+r8]
	mov	r11, QWORD PTR 168[rsp]
	vmovddup	xmm1, xmm0
	sal	rdx, 3
	add	r10, r11
	lea	r14, [rdi+rdx]
	add	rdx, r13
	test	al, 1
	vmovupd	xmm2, XMMWORD PTR [rdi+r10*8]
	vfnmadd213pd	xmm2, xmm1, XMMWORD PTR [r14]
	vmovupd	XMMWORD PTR [r14], xmm2
	vmovupd	xmm7, XMMWORD PTR [rdx]
	vfnmadd132pd	xmm1, xmm7, XMMWORD PTR 0[r13+r10*8]
	lea	r10, [r8+rbx]
	vmovupd	XMMWORD PTR [rdx], xmm1
	je	.L206
	and	eax, -2
	add	eax, r15d
.L208:
	cdqe
	mov	r15, QWORD PTR 192[rsp]
	lea	r10, [r8+rbx]
	sal	rax, 3
	add	rcx, rax
	add	rax, r15
	lea	rdx, [rdi+rcx]
	vmovsd	xmm1, QWORD PTR [rdi+rax]
	add	rcx, r13
	vfnmadd213sd	xmm1, xmm0, QWORD PTR [rdx]
	vmovsd	QWORD PTR [rdx], xmm1
	vmovsd	xmm6, QWORD PTR [rcx]
	vfnmadd132sd	xmm0, xmm6, QWORD PTR 0[r13+rax]
	vmovsd	QWORD PTR [rcx], xmm0
.L206:
	sub	rsi, rbx
	cmp	DWORD PTR 204[rsp], r9d
	lea	eax, 1[r9]
	mov	r8, r10
	je	.L274
	mov	r9d, eax
	mov	eax, DWORD PTR 176[rsp]
	cmp	r9d, eax
	jne	.L199
.L273:
	lea	r10, [r8+rbx]
	jmp	.L206
	.p2align 4,,10
	.p2align 3
.L202:
	lea	r10, [rbx+r8]
	mov	r11, QWORD PTR 184[rsp]
	lea	rcx, [rdi+r10*8]
	.p2align 4,,10
	.p2align 3
.L210:
	vmovsd	xmm1, QWORD PTR [rax+rsi*8]
	vfnmadd213sd	xmm1, xmm0, QWORD PTR [rax]
	add	rax, 8
	vmovsd	QWORD PTR -8[rax], xmm1
	vmovsd	xmm1, QWORD PTR [rdx+rsi*8]
	vfnmadd213sd	xmm1, xmm0, QWORD PTR [rdx]
	add	rdx, 8
	vmovsd	QWORD PTR -8[rdx], xmm1
	cmp	rcx, rax
	jne	.L210
	mov	QWORD PTR 184[rsp], r11
	jmp	.L206
.L178:
	mov	r10, QWORD PTR 192[rsp]
	lea	rsi, 32[0+rax*8]
	lea	r8, -32[rsi]
	lea	r9, 0[r13+rsi]
	add	r10, 32
	lea	rdx, 0[r13+r8]
	lea	rcx, [rdi+r8]
	cmp	r10, r8
	lea	r15, [rdi+rsi]
	setle	r8b
	cmp	QWORD PTR 192[rsp], rsi
	setge	sil
	or	esi, r8d
	cmp	rdx, r15
	setnb	r8b
	cmp	rcx, r9
	setnb	r10b
	or	r8d, r10d
	mov	r10, QWORD PTR 152[rsp]
	and	r8d, esi
	mov	rsi, QWORD PTR 104[rsp]
	cmp	r12, rsi
	setnb	sil
	cmp	r11, r10
	setnb	r10b
	or	esi, r10d
	and	esi, r8d
	mov	r8, QWORD PTR 104[rsp]
	cmp	rdx, r8
	setnb	r8b
	cmp	r11, r9
	setnb	r9b
	or	r8d, r9d
	test	sil, r8b
	je	.L219
	mov	r10, QWORD PTR 152[rsp]
	cmp	r12, r15
	setnb	r8b
	cmp	rcx, r10
	setnb	sil
	or	sil, r8b
	je	.L219
	cmp	DWORD PTR 204[rsp], 2
	jbe	.L220
	mov	r8, QWORD PTR 96[rsp]
	xor	esi, esi
	.p2align 4,,10
	.p2align 3
.L184:
	vmovupd	ymm0, YMMWORD PTR [r11+rsi]
	vmovupd	ymm7, YMMWORD PTR [rcx+rsi]
	vmovupd	YMMWORD PTR [r11+rsi], ymm7
	vmovupd	YMMWORD PTR [rcx+rsi], ymm0
	vmovupd	ymm0, YMMWORD PTR [r12+rsi]
	vmovupd	ymm5, YMMWORD PTR [rdx+rsi]
	vmovupd	YMMWORD PTR [r12+rsi], ymm5
	vmovupd	YMMWORD PTR [rdx+rsi], ymm0
	add	rsi, 32
	cmp	r8, rsi
	jne	.L184
	mov	ecx, DWORD PTR 116[rsp]
	cmp	DWORD PTR 200[rsp], ecx
	je	.L275
	mov	esi, DWORD PTR 72[rsp]
	cmp	esi, 1
	mov	r9d, esi
	je	.L221
	mov	r10d, ecx
	mov	edx, ecx
.L183:
	mov	rsi, QWORD PTR 168[rsp]
	lea	rcx, [rsi+rdx]
	add	rdx, rax
	sal	rcx, 3
	sal	rdx, 3
	lea	r8, [rdi+rcx]
	lea	rsi, [rdi+rdx]
	add	rcx, r13
	add	rdx, r13
	vmovupd	xmm0, XMMWORD PTR [r8]
	vmovupd	xmm7, XMMWORD PTR [rsi]
	test	r9b, 1
	vmovupd	XMMWORD PTR [r8], xmm7
	vmovupd	XMMWORD PTR [rsi], xmm0
	vmovupd	xmm0, XMMWORD PTR [rcx]
	vmovupd	xmm7, XMMWORD PTR [rdx]
	vmovupd	XMMWORD PTR [rcx], xmm7
	vmovupd	XMMWORD PTR [rdx], xmm0
	je	.L264
	and	r9d, -2
	lea	edx, [r9+r10]
.L188:
	mov	rsi, QWORD PTR 168[rsp]
	movsx	rdx, edx
	add	rax, rdx
	add	rdx, rsi
	sal	rax, 3
	sal	rdx, 3
	lea	rcx, [rdi+rax]
	add	rax, r13
	lea	rsi, [rdi+rdx]
	vmovsd	xmm1, QWORD PTR [rcx]
	add	rdx, r13
	vmovsd	xmm0, QWORD PTR [rsi]
	vmovsd	QWORD PTR [rsi], xmm1
	vmovsd	QWORD PTR [rcx], xmm0
	vmovsd	xmm0, QWORD PTR [rdx]
	vmovsd	xmm1, QWORD PTR [rax]
	vmovsd	QWORD PTR [rdx], xmm1
	vmovsd	QWORD PTR [rax], xmm0
	jmp	.L264
.L181:
	cmp	DWORD PTR 204[rsp], 2
	jbe	.L223
.L187:
	mov	rdx, QWORD PTR 96[rsp]
	vbroadcastsd	ymm2, xmm1
	xor	eax, eax
	.p2align 4,,10
	.p2align 3
.L197:
	vmovupd	ymm7, YMMWORD PTR [r11+rax]
	vdivpd	ymm0, ymm7, ymm2
	vmovupd	YMMWORD PTR [r11+rax], ymm0
	vmovupd	ymm7, YMMWORD PTR [r12+rax]
	vdivpd	ymm0, ymm7, ymm2
	vmovupd	YMMWORD PTR [r12+rax], ymm0
	add	rax, 32
	cmp	rdx, rax
	jne	.L197
	mov	esi, DWORD PTR 116[rsp]
	cmp	DWORD PTR 200[rsp], esi
	je	.L195
	mov	ecx, DWORD PTR 72[rsp]
	mov	edx, esi
	cmp	ecx, 1
	mov	eax, ecx
	je	.L276
.L196:
	mov	rcx, QWORD PTR 168[rsp]
	vmovddup	xmm0, xmm1
	add	rdx, rcx
	sal	rdx, 3
	lea	rcx, [rdi+rdx]
	add	rdx, r13
	test	al, 1
	vmovupd	xmm7, XMMWORD PTR [rcx]
	vdivpd	xmm2, xmm7, xmm0
	vmovupd	XMMWORD PTR [rcx], xmm2
	vmovupd	xmm5, XMMWORD PTR [rdx]
	vdivpd	xmm0, xmm5, xmm0
	vmovupd	XMMWORD PTR [rdx], xmm0
	je	.L195
	and	eax, -2
	add	eax, esi
.L192:
	mov	rsi, QWORD PTR 168[rsp]
	cdqe
	add	rax, rsi
	sal	rax, 3
	lea	rdx, [rdi+rax]
	add	rax, r13
	vmovsd	xmm0, QWORD PTR [rdx]
	vdivsd	xmm0, xmm0, xmm1
	vmovsd	QWORD PTR [rdx], xmm0
	vmovsd	xmm0, QWORD PTR [rax]
	vdivsd	xmm0, xmm0, xmm1
	vmovsd	QWORD PTR [rax], xmm0
	jmp	.L195
.L274:
	mov	rax, QWORD PTR 64[rsp]
	mov	r11, QWORD PTR 184[rsp]
	mov	r14, QWORD PTR 160[rsp]
	mov	rsi, QWORD PTR 40[rsp]
	mov	QWORD PTR 168[rsp], rax
	mov	rax, QWORD PTR 32[rsp]
	add	QWORD PTR 80[rsp], rsi
	mov	rdx, QWORD PTR 24[rsp]
	add	r14, 8
	add	QWORD PTR 48[rsp], rsi
	add	r11, rax
	mov	esi, DWORD PTR 76[rsp]
	add	r12, rax
	add	QWORD PTR 176[rsp], 1
	add	QWORD PTR 192[rsp], rax
	add	QWORD PTR 56[rsp], rdx
	add	QWORD PTR 152[rsp], rax
	add	QWORD PTR 88[rsp], rax
	add	QWORD PTR 104[rsp], rax
	cmp	DWORD PTR 204[rsp], esi
	jne	.L212
	vzeroupper
.L213:
	mov	eax, 1
	jmp	.L171
.L219:
	mov	rsi, QWORD PTR 88[rsp]
	mov	r9, QWORD PTR 168[rsp]
	mov	rcx, r12
	mov	rdx, r11
	add	rsi, rdi
	sub	rax, r9
	.p2align 4,,10
	.p2align 3
.L182:
	vmovsd	xmm0, QWORD PTR [rdx]
	vmovsd	xmm1, QWORD PTR [rdx+rax*8]
	vmovsd	QWORD PTR [rdx], xmm1
	vmovsd	QWORD PTR [rdx+rax*8], xmm0
	vmovsd	xmm0, QWORD PTR [rcx]
	vmovsd	xmm1, QWORD PTR [rcx+rax*8]
	add	rdx, 8
	vmovsd	QWORD PTR [rcx], xmm1
	vmovsd	QWORD PTR [rcx+rax*8], xmm0
	add	rcx, 8
	cmp	rsi, rdx
	jne	.L182
	jmp	.L264
.L225:
	mov	eax, DWORD PTR 200[rsp]
	xor	r10d, r10d
	xor	r15d, r15d
	jmp	.L203
.L226:
	mov	eax, edx
	jmp	.L208
.L175:
	vandpd	xmm5, xmm5, xmm3
	vcomisd	xmm4, xmm5
	ja	.L227
	mov	rax, QWORD PTR 48[rsp]
	vmovsd	xmm1, QWORD PTR [rax]
	mov	rax, QWORD PTR 168[rsp]
	add	rax, rbx
	cmp	DWORD PTR 200[rsp], 1
	mov	QWORD PTR 64[rsp], rax
	je	.L180
	jmp	.L179
.L227:
	xor	eax, eax
	vzeroupper
.L171:
	mov	rdx, QWORD PTR 216[rsp]
	sub	rdx, QWORD PTR fs:40
	jne	.L277
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L223:
	.cfi_restore_state
	mov	eax, DWORD PTR 200[rsp]
	xor	edx, edx
	xor	esi, esi
	jmp	.L196
.L275:
	mov	rax, QWORD PTR 48[rsp]
	vmovsd	xmm1, QWORD PTR [rax]
	mov	rax, QWORD PTR 152[rsp]
	cmp	r11, rax
	jnb	.L187
	mov	rax, QWORD PTR 104[rsp]
	cmp	r12, rax
	jb	.L180
	jmp	.L187
.L276:
	mov	eax, esi
	jmp	.L192
.L220:
	mov	r9d, DWORD PTR 200[rsp]
	xor	edx, edx
	xor	r10d, r10d
	jmp	.L183
.L221:
	mov	edx, ecx
	jmp	.L188
.L277:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE3659:
	.size	_Z7inverseSt6vectorIdSaIdEEiRS1_, .-_Z7inverseSt6vectorIdSaIdEEiRS1_
	.section	.rodata.str1.8
	.align 8
.LC22:
	.string	"\320\243\320\274\320\276\320\262\320\270 \320\277\321\200\320\276\320\263\320\276\320\275\320\272\320\270: |c|>=|a|+|b|: "
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC23:
	.string	", \321\201\321\202\321\200\320\276\320\263\320\260: "
.LC24:
	.string	", \320\275\320\265\320\275\321\203\320\273\321\214\320\276\320\262\321\226: "
.LC25:
	.string	"\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB27:
	.text
.LHOTB27:
	.p2align 4
	.globl	_Z6thomasRKSt6vectorIdSaIdEES3_iRS1_RdS5_Ri
	.type	_Z6thomasRKSt6vectorIdSaIdEES3_iRS1_RdS5_Ri, @function
_Z6thomasRKSt6vectorIdSaIdEES3_iRS1_RdS5_Ri:
.LFB3656:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA3656
	endbr64
	lea	r10, 8[rsp]
	.cfi_def_cfa 10, 0
	and	rsp, -32
	push	QWORD PTR -8[r10]
	push	rbp
	mov	rbp, rsp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	push	r15
	push	r14
	push	r13
	push	r12
	push	r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	push	rbx
	sub	rsp, 352
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	mov	rax, QWORD PTR [r10]
	mov	QWORD PTR -304[rbp], rdi
	mov	DWORD PTR -312[rbp], edx
	mov	QWORD PTR -384[rbp], rcx
	mov	QWORD PTR -336[rbp], r8
	mov	QWORD PTR -344[rbp], r9
	mov	QWORD PTR -360[rbp], rax
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -56[rbp], rax
	xor	eax, eax
	movsx	rax, edx
	mov	QWORD PTR -352[rbp], rax
	shr	rax, 60
	jne	.L392
	cmp	QWORD PTR -352[rbp], 0
	je	.L380
	mov	rax, QWORD PTR -352[rbp]
	mov	r13, rsi
	lea	r15, 0[0+rax*8]
	mov	rdi, r15
.LEHB0:
	call	_Znwm@PLT
.LEHE0:
	mov	rdx, r15
	xor	esi, esi
	lea	rbx, [rax+r15]
	mov	rdi, rax
	mov	QWORD PTR -272[rbp], rax
	mov	r12, rax
	mov	QWORD PTR -256[rbp], rbx
	call	memset@PLT
	vpxor	xmm0, xmm0, xmm0
	mov	rdi, r15
	mov	QWORD PTR -264[rbp], rbx
	vmovdqu	XMMWORD PTR -232[rbp], xmm0
.LEHB1:
	call	_Znwm@PLT
.LEHE1:
	lea	rbx, [rax+r15]
	mov	rdi, rax
	mov	rdx, r15
	xor	esi, esi
	mov	QWORD PTR -240[rbp], rax
	mov	r14, rax
	mov	QWORD PTR -224[rbp], rbx
	call	memset@PLT
	vpxor	xmm0, xmm0, xmm0
	mov	rdi, r15
	mov	QWORD PTR -232[rbp], rbx
	vmovdqu	XMMWORD PTR -200[rbp], xmm0
.LEHB2:
	call	_Znwm@PLT
.LEHE2:
	lea	rcx, [rax+r15]
	mov	rdi, rax
	mov	rdx, r15
	xor	esi, esi
	mov	QWORD PTR -192[rbp], rcx
	mov	rbx, rax
	mov	QWORD PTR -320[rbp], rcx
	mov	QWORD PTR -208[rbp], rax
	call	memset@PLT
	mov	rcx, QWORD PTR -320[rbp]
	vpxor	xmm0, xmm0, xmm0
	mov	rdi, r15
	vmovdqu	XMMWORD PTR -168[rbp], xmm0
	mov	QWORD PTR -200[rbp], rcx
.LEHB3:
	call	_Znwm@PLT
.LEHE3:
	lea	rcx, [rax+r15]
	xor	esi, esi
	mov	rdx, r15
	mov	rdi, rax
	mov	QWORD PTR -160[rbp], rcx
	mov	QWORD PTR -320[rbp], rcx
	mov	QWORD PTR -176[rbp], rax
	mov	QWORD PTR -328[rbp], rax
	call	memset@PLT
	mov	ecx, DWORD PTR -312[rbp]
	lea	edx, -1[rcx]
	mov	rcx, QWORD PTR -320[rbp]
	test	edx, edx
	mov	DWORD PTR -372[rbp], edx
	mov	r11d, edx
	mov	QWORD PTR -168[rbp], rcx
	mov	rcx, QWORD PTR -304[rbp]
	mov	rsi, QWORD PTR [rcx]
	mov	rcx, QWORD PTR 0[r13]
	jle	.L335
	vmovq	xmm3, QWORD PTR .LC5[rip]
	xor	eax, eax
	mov	rdx, rsi
	mov	r8d, r11d
	lea	r10, 8[r15]
	test	rax, rax
	mov	r9, QWORD PTR -328[rbp]
	mov	QWORD PTR -320[rbp], r10
	vmovapd	XMMWORD PTR -304[rbp], xmm3
	je	.L283
	.p2align 4,,10
	.p2align 3
.L394:
	vmovsd	xmm0, QWORD PTR -8[rdx]
	vmovsd	QWORD PTR [r12+rax*8], xmm0
.L283:
	vmovsd	xmm0, QWORD PTR 8[rdx]
	vmovapd	xmm5, XMMWORD PTR -304[rbp]
	lea	rdi, 1[rax]
	vmovsd	QWORD PTR [r14+rax*8], xmm0
	vmovsd	xmm0, QWORD PTR [rdx]
	add	rdx, r10
	cmp	r8, rdi
	vxorpd	xmm0, xmm0, xmm5
	vmovsd	QWORD PTR [rbx+rax*8], xmm0
	vmovsd	xmm0, QWORD PTR [rcx+rax*8]
	vxorpd	xmm0, xmm0, xmm5
	vmovsd	QWORD PTR [r9+rax*8], xmm0
	je	.L393
	mov	rax, rdi
	test	rax, rax
	jne	.L394
	jmp	.L283
	.p2align 4,,10
	.p2align 3
.L335:
	lea	rdi, 8[r15]
	vmovq	xmm7, QWORD PTR .LC5[rip]
	xor	eax, eax
	mov	QWORD PTR -320[rbp], rdi
	vmovapd	XMMWORD PTR -304[rbp], xmm7
.L282:
	mov	rdx, QWORD PTR -320[rbp]
	cdqe
	imul	rdx, rax
	add	rdx, rsi
	jmp	.L289
	.p2align 4,,10
	.p2align 3
.L395:
	vmovsd	xmm0, QWORD PTR -8[rdx]
	vmovapd	xmm6, XMMWORD PTR -304[rbp]
	mov	rsi, QWORD PTR -328[rbp]
	vmovsd	QWORD PTR [r12+rax*8], xmm0
	vmovsd	xmm0, QWORD PTR [rdx]
	vxorpd	xmm0, xmm0, xmm6
	vmovsd	QWORD PTR [rbx+rax*8], xmm0
	vmovsd	xmm0, QWORD PTR [rcx+rax*8]
	vxorpd	xmm0, xmm0, xmm6
	vmovsd	QWORD PTR [rsi+rax*8], xmm0
.L390:
	mov	rsi, QWORD PTR -320[rbp]
	add	rax, 1
	add	rdx, rsi
	cmp	DWORD PTR -312[rbp], eax
	jle	.L288
.L289:
	test	eax, eax
	jne	.L395
	vmovsd	xmm0, QWORD PTR [rdx]
	vmovapd	xmm4, XMMWORD PTR -304[rbp]
	mov	rdi, QWORD PTR -328[rbp]
	vxorpd	xmm0, xmm0, xmm4
	vmovsd	QWORD PTR [rbx+rax*8], xmm0
	vmovsd	xmm0, QWORD PTR [rcx+rax*8]
	vxorpd	xmm0, xmm0, xmm4
	vmovsd	QWORD PTR [rdi+rax*8], xmm0
	jmp	.L390
	.p2align 4,,10
	.p2align 3
.L393:
	mov	edi, DWORD PTR -312[rbp]
	add	eax, 1
	cmp	eax, edi
	jl	.L282
	.p2align 4,,10
	.p2align 3
.L288:
	vxorpd	xmm0, xmm0, xmm0
	vucomisd	xmm0, QWORD PTR [rbx]
	jp	.L291
	mov	r13d, 0
	je	.L290
.L291:
	vxorpd	xmm0, xmm0, xmm0
	vucomisd	xmm0, QWORD PTR -8[rbx+r15]
	mov	eax, 1
	setp	r13b
	cmovne	r13d, eax
.L290:
	xor	eax, eax
	xor	ecx, ecx
	mov	esi, 1
	mov	edx, 1
	jmp	.L294
	.p2align 4,,10
	.p2align 3
.L397:
	vucomisd	xmm1, xmm0
	cmova	ecx, edx
	add	rax, 8
	cmp	r15, rax
	je	.L396
.L294:
	vmovsd	xmm0, QWORD PTR [r14+rax]
	vmovsd	xmm1, QWORD PTR [r12+rax]
	vandpd	xmm0, xmm0, XMMWORD PTR .LC1[rip]
	vandpd	xmm1, xmm1, XMMWORD PTR .LC1[rip]
	vaddsd	xmm0, xmm0, xmm1
	vmovsd	xmm1, QWORD PTR [rbx+rax]
	vandpd	xmm1, xmm1, XMMWORD PTR .LC1[rip]
	vcomisd	xmm0, xmm1
	jbe	.L397
	add	rax, 8
	xor	esi, esi
	cmp	r15, rax
	jne	.L294
.L396:
	mov	eax, DWORD PTR -372[rbp]
	mov	BYTE PTR -368[rbp], cl
	mov	BYTE PTR -373[rbp], sil
	cmp	eax, 1
	jle	.L295
	mov	edx, eax
	vxorpd	xmm0, xmm0, xmm0
	mov	eax, 1
	xor	ecx, ecx
	jmp	.L299
	.p2align 4,,10
	.p2align 3
.L352:
	vucomisd	xmm0, QWORD PTR [r14+rax*8]
	jp	.L296
	cmove	r13d, ecx
.L296:
	add	rax, 1
	cmp	rdx, rax
	je	.L295
.L299:
	vucomisd	xmm0, QWORD PTR [r12+rax*8]
	jp	.L352
	jne	.L352
	add	rax, 1
	xor	r13d, r13d
	cmp	rdx, rax
	jne	.L299
.L295:
	cmp	BYTE PTR _ZL7VERBOSE[rip], 0
	jne	.L398
	and	r13b, BYTE PTR -368[rbp]
	and	BYTE PTR -373[rbp], r13b
	jne	.L399
.L301:
	mov	rdi, QWORD PTR -328[rbp]
	mov	rsi, r15
	call	_ZdlPvm@PLT
	mov	rsi, r15
	mov	rdi, rbx
	call	_ZdlPvm@PLT
	mov	rsi, r15
	mov	rdi, r14
	call	_ZdlPvm@PLT
	mov	rsi, r15
	mov	rdi, r12
	call	_ZdlPvm@PLT
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	jne	.L386
	movzx	eax, BYTE PTR -373[rbp]
	add	rsp, 352
	pop	rbx
	pop	r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	lea	rsp, -8[r10]
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L398:
	.cfi_restore_state
	mov	edx, 43
	lea	rsi, .LC22[rip]
	lea	rdi, _ZSt4cout[rip]
.LEHB4:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movzx	esi, BYTE PTR -373[rbp]
	lea	rdi, _ZSt4cout[rip]
	call	_ZNSo9_M_insertIbEERSoT_@PLT
	mov	edx, 16
	lea	rsi, .LC23[rip]
	mov	rdi, rax
	mov	QWORD PTR -392[rbp], rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movzx	esi, BYTE PTR -368[rbp]
	mov	rdi, QWORD PTR -392[rbp]
	call	_ZNSo9_M_insertIbEERSoT_@PLT
	mov	edx, 22
	lea	rsi, .LC24[rip]
	mov	rdi, rax
	mov	QWORD PTR -392[rbp], rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rdi, QWORD PTR -392[rbp]
	movzx	esi, r13b
	call	_ZNSo9_M_insertIbEERSoT_@PLT
	mov	rdi, rax
	mov	edx, 1
	lea	rsi, .LC25[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	and	r13b, BYTE PTR -368[rbp]
	and	BYTE PTR -373[rbp], r13b
	je	.L301
.L399:
	mov	rdi, QWORD PTR -320[rbp]
	vpxor	xmm0, xmm0, xmm0
	vmovdqu	XMMWORD PTR -136[rbp], xmm0
	call	_Znwm@PLT
.LEHE4:
	mov	rdx, QWORD PTR -320[rbp]
	mov	rdi, rax
	xor	esi, esi
	mov	r13, rax
	mov	QWORD PTR -144[rbp], rax
	lea	rcx, [rax+rdx]
	mov	QWORD PTR -128[rbp], rcx
	mov	QWORD PTR -368[rbp], rcx
	call	memset@PLT
	mov	rcx, QWORD PTR -368[rbp]
	mov	rdi, QWORD PTR -320[rbp]
	vpxor	xmm0, xmm0, xmm0
	vmovdqu	XMMWORD PTR -104[rbp], xmm0
	mov	QWORD PTR -136[rbp], rcx
.LEHB5:
	call	_Znwm@PLT
.LEHE5:
	mov	rdx, QWORD PTR -320[rbp]
	mov	rdi, rax
	xor	esi, esi
	mov	QWORD PTR -112[rbp], rax
	mov	QWORD PTR -392[rbp], rax
	lea	rcx, [rax+rdx]
	mov	QWORD PTR -96[rbp], rcx
	mov	QWORD PTR -368[rbp], rcx
	call	memset@PLT
	mov	rcx, QWORD PTR -368[rbp]
	vpxor	xmm0, xmm0, xmm0
	mov	rdi, r15
	vmovdqu	XMMWORD PTR -72[rbp], xmm0
	mov	QWORD PTR -104[rbp], rcx
.LEHB6:
	call	_Znwm@PLT
.LEHE6:
	lea	rcx, [rax+r15]
	xor	esi, esi
	mov	rdx, r15
	mov	rdi, rax
	mov	QWORD PTR -64[rbp], rcx
	mov	QWORD PTR -400[rbp], rcx
	mov	QWORD PTR -80[rbp], rax
	mov	QWORD PTR -368[rbp], rax
	call	memset@PLT
	mov	rsi, QWORD PTR -328[rbp]
	vmovsd	xmm1, QWORD PTR [rbx]
	vmovsd	xmm2, QWORD PTR [r14]
	mov	eax, DWORD PTR -372[rbp]
	vmovsd	xmm0, QWORD PTR [rsi]
	mov	rcx, QWORD PTR -400[rbp]
	vdivsd	xmm2, xmm2, xmm1
	mov	rdx, QWORD PTR -392[rbp]
	test	eax, eax
	mov	QWORD PTR -72[rbp], rcx
	vdivsd	xmm0, xmm0, xmm1
	vmovsd	QWORD PTR 8[r13], xmm2
	vmovsd	QWORD PTR 8[rdx], xmm0
	je	.L302
	cmp	eax, 1
	jle	.L341
	mov	ecx, DWORD PTR -312[rbp]
	mov	r8, QWORD PTR -368[rbp]
	mov	eax, 2
	mov	rdi, rdx
	.p2align 4,,10
	.p2align 3
.L304:
	vmovsd	xmm1, QWORD PTR -8[r12+rax*8]
	vfnmadd213sd	xmm2, xmm1, QWORD PTR -8[rbx+rax*8]
	mov	rdx, rax
	vfmadd213sd	xmm0, xmm1, QWORD PTR -8[rsi+rax*8]
	vmovsd	xmm3, xmm2, xmm2
	vmovsd	QWORD PTR -8[r8+rax*8], xmm2
	vmovsd	xmm2, QWORD PTR -8[r14+rax*8]
	vdivsd	xmm0, xmm0, xmm3
	vdivsd	xmm2, xmm2, xmm3
	vmovsd	QWORD PTR [rdi+rax*8], xmm0
	vmovsd	QWORD PTR 0[r13+rax*8], xmm2
	lea	rax, 1[rax]
	cmp	rcx, rax
	jne	.L304
	cmp	DWORD PTR -372[rbp], edx
	jl	.L302
	mov	esi, DWORD PTR -312[rbp]
	sub	esi, edx
	lea	eax, -1[rsi]
	cmp	eax, 2
	jbe	.L342
	mov	rax, QWORD PTR -368[rbp]
	movsx	rcx, edx
	mov	edi, esi
	sal	rcx, 3
	shr	edi, 2
	lea	r10, [rbx+rcx]
	lea	r9, 0[r13+rcx]
	sal	rdi, 5
	lea	r8, [r12+rcx]
	add	rcx, rax
	xor	eax, eax
	.p2align 4,,10
	.p2align 3
.L307:
	vmovupd	ymm0, YMMWORD PTR [r8+rax]
	vmovupd	ymm3, YMMWORD PTR [r10+rax]
	vfnmadd132pd	ymm0, ymm3, YMMWORD PTR [r9+rax]
	vmovupd	YMMWORD PTR [rcx+rax], ymm0
	add	rax, 32
	cmp	rdi, rax
	jne	.L307
	mov	ecx, esi
	and	ecx, -4
	test	sil, 3
	lea	eax, [rcx+rdx]
	je	.L400
	vzeroupper
.L306:
	sub	esi, ecx
	cmp	esi, 1
	je	.L303
	movsx	rdx, edx
	add	rdx, rcx
	mov	rcx, QWORD PTR -368[rbp]
	test	sil, 1
	vmovupd	xmm0, XMMWORD PTR [r12+rdx*8]
	vmovupd	xmm7, XMMWORD PTR [rbx+rdx*8]
	vfnmadd132pd	xmm0, xmm7, XMMWORD PTR 0[r13+rdx*8]
	vmovupd	XMMWORD PTR [rcx+rdx*8], xmm0
	je	.L302
	and	esi, -2
	add	eax, esi
	jmp	.L303
.L341:
	mov	eax, 1
.L303:
	cdqe
	mov	rcx, QWORD PTR -368[rbp]
	vmovsd	xmm0, QWORD PTR [r12+rax*8]
	vmovsd	xmm7, QWORD PTR [rbx+rax*8]
	vfnmadd132sd	xmm0, xmm7, QWORD PTR 0[r13+rax*8]
	vmovsd	QWORD PTR [rcx+rax*8], xmm0
.L302:
	mov	rsi, QWORD PTR -352[rbp]
	mov	rdi, QWORD PTR -384[rbp]
	lea	rdx, -280[rbp]
	mov	QWORD PTR -280[rbp], 0x000000000
.LEHB7:
	call	_ZNSt6vectorIdSaIdEE14_M_fill_assignEmRKd
.LEHE7:
	mov	rax, QWORD PTR -384[rbp]
	mov	rcx, QWORD PTR -328[rbp]
	mov	rsi, QWORD PTR -392[rbp]
	vmovsd	xmm0, QWORD PTR -8[r12+r15]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -368[rbp]
	vmovsd	xmm7, QWORD PTR -8[rcx+r15]
	vfmadd132sd	xmm0, xmm7, QWORD PTR -8[rsi+r15]
	vdivsd	xmm0, xmm0, QWORD PTR -8[rax+r15]
	mov	eax, DWORD PTR -312[rbp]
	vmovsd	QWORD PTR -8[rdx+r15], xmm0
	cmp	eax, 1
	lea	ecx, -2[rax]
	je	.L313
	movsx	rax, ecx
	.p2align 4,,10
	.p2align 3
.L314:
	vmovsd	xmm7, QWORD PTR 8[rsi+rax*8]
	vfmadd132sd	xmm0, xmm7, QWORD PTR 8[r13+rax*8]
	vmovsd	QWORD PTR [rdx+rax*8], xmm0
	sub	rax, 1
	test	eax, eax
	jns	.L314
	vmovsd	xmm0, QWORD PTR [rbx]
	mov	rax, QWORD PTR -336[rbp]
	vxorpd	xmm1, xmm0, XMMWORD PTR -304[rbp]
	vmovsd	QWORD PTR [rax], xmm1
	vxorpd	xmm1, xmm1, xmm1
	vcomisd	xmm0, xmm1
	jbe	.L401
.L332:
	mov	eax, -1
.L316:
	mov	DWORD PTR -312[rbp], ecx
	mov	rcx, QWORD PTR -360[rbp]
	vandpd	xmm0, xmm0, XMMWORD PTR .LC1[rip]
	mov	DWORD PTR [rcx], eax
	call	log10@PLT
	mov	rax, QWORD PTR -344[rbp]
	mov	ecx, DWORD PTR -312[rbp]
	vmovsd	QWORD PTR [rax], xmm0
	mov	eax, DWORD PTR -372[rbp]
	test	eax, eax
	je	.L318
.L331:
	mov	rdi, QWORD PTR -368[rbp]
	mov	edx, ecx
	mov	QWORD PTR -352[rbp], rbx
	lea	rcx, 16[rdi+rdx*8]
	lea	rax, 8[rdi]
	mov	QWORD PTR -312[rbp], rcx
	mov	rcx, r14
	mov	rbx, rax
	mov	r14, r12
	mov	r12, rcx
	.p2align 4,,10
	.p2align 3
.L322:
	mov	rax, QWORD PTR -336[rbp]
	vmovsd	xmm0, QWORD PTR [rbx]
	vxorpd	xmm3, xmm3, xmm3
	vxorpd	xmm1, xmm0, XMMWORD PTR -304[rbp]
	vmulsd	xmm1, xmm1, QWORD PTR [rax]
	vcomisd	xmm0, xmm3
	vmovsd	QWORD PTR [rax], xmm1
	jbe	.L385
	mov	rax, QWORD PTR -360[rbp]
	vandpd	xmm0, xmm0, XMMWORD PTR .LC1[rip]
	add	rbx, 8
	neg	DWORD PTR [rax]
	call	log10@PLT
	mov	rax, QWORD PTR -344[rbp]
	cmp	QWORD PTR -312[rbp], rbx
	vaddsd	xmm0, xmm0, QWORD PTR [rax]
	vmovsd	QWORD PTR [rax], xmm0
	jne	.L322
.L391:
	mov	rax, r12
	mov	rbx, QWORD PTR -352[rbp]
	mov	r12, r14
	mov	r14, rax
.L318:
	mov	rdi, QWORD PTR -368[rbp]
	mov	rsi, r15
	call	_ZdlPvm@PLT
	mov	rsi, QWORD PTR -320[rbp]
	mov	rdi, QWORD PTR -392[rbp]
	call	_ZdlPvm@PLT
	mov	rsi, QWORD PTR -320[rbp]
	mov	rdi, r13
	call	_ZdlPvm@PLT
	jmp	.L301
	.p2align 4,,10
	.p2align 3
.L385:
	vandpd	xmm0, xmm0, XMMWORD PTR .LC1[rip]
	add	rbx, 8
	call	log10@PLT
	mov	rax, QWORD PTR -344[rbp]
	vaddsd	xmm0, xmm0, QWORD PTR [rax]
	vmovsd	QWORD PTR [rax], xmm0
	mov	rax, QWORD PTR -312[rbp]
	cmp	rbx, rax
	jne	.L322
	jmp	.L391
	.p2align 4,,10
	.p2align 3
.L401:
	mov	rax, QWORD PTR -360[rbp]
	vandpd	xmm0, xmm0, XMMWORD PTR .LC1[rip]
	mov	DWORD PTR -312[rbp], ecx
	mov	DWORD PTR [rax], 1
	call	log10@PLT
	mov	rax, QWORD PTR -344[rbp]
	mov	ecx, DWORD PTR -312[rbp]
	vmovsd	QWORD PTR [rax], xmm0
	jmp	.L331
.L313:
	vmovsd	xmm0, QWORD PTR [rbx]
	mov	rax, QWORD PTR -336[rbp]
	vxorpd	xmm1, xmm0, XMMWORD PTR -304[rbp]
	vmovsd	QWORD PTR [rax], xmm1
	vxorpd	xmm1, xmm1, xmm1
	mov	eax, 1
	vcomisd	xmm0, xmm1
	ja	.L332
	jmp	.L316
.L400:
	vzeroupper
	jmp	.L302
.L392:
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	jne	.L386
	lea	rdi, .LC4[rip]
.LEHB8:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE8:
.L342:
	mov	eax, edx
	xor	ecx, ecx
	jmp	.L306
.L386:
	call	__stack_chk_fail@PLT
.L348:
	endbr64
	mov	rbx, rax
	vzeroupper
	jmp	.L325
.L349:
	endbr64
	mov	rbx, rax
	vzeroupper
	jmp	.L324
.L346:
	endbr64
	mov	rbx, rax
	vzeroupper
	jmp	.L327
.L345:
	endbr64
	mov	rbx, rax
	vzeroupper
	jmp	.L328
.L344:
	endbr64
	mov	rbx, rax
	vzeroupper
	jmp	.L329
.L347:
	endbr64
	mov	rbx, rax
	vzeroupper
	jmp	.L326
.L350:
	endbr64
	mov	rbx, rax
	jmp	.L323
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA3656:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3656-.LLSDACSB3656
.LLSDACSB3656:
	.uleb128 .LEHB0-.LFB3656
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB3656
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L344-.LFB3656
	.uleb128 0
	.uleb128 .LEHB2-.LFB3656
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L345-.LFB3656
	.uleb128 0
	.uleb128 .LEHB3-.LFB3656
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L346-.LFB3656
	.uleb128 0
	.uleb128 .LEHB4-.LFB3656
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L347-.LFB3656
	.uleb128 0
	.uleb128 .LEHB5-.LFB3656
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L348-.LFB3656
	.uleb128 0
	.uleb128 .LEHB6-.LFB3656
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L349-.LFB3656
	.uleb128 0
	.uleb128 .LEHB7-.LFB3656
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L350-.LFB3656
	.uleb128 0
	.uleb128 .LEHB8-.LFB3656
	.uleb128 .LEHE8-.LEHB8
	.uleb128 0
	.uleb128 0
.LLSDACSE3656:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC3656
	.type	_Z6thomasRKSt6vectorIdSaIdEES3_iRS1_RdS5_Ri.cold, @function
_Z6thomasRKSt6vectorIdSaIdEES3_iRS1_RdS5_Ri.cold:
.LFSB3656:
.L323:
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	.cfi_escape 0x10,0x6,0x2,0x76,0
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	lea	rdi, -80[rbp]
	vzeroupper
	call	_ZNSt6vectorIdSaIdEED1Ev
.L324:
	lea	rdi, -112[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
.L325:
	lea	rdi, -144[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
.L326:
	lea	rdi, -176[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
.L327:
	lea	rdi, -208[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
.L328:
	lea	rdi, -240[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
.L329:
	lea	rdi, -272[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	jne	.L402
	mov	rdi, rbx
.LEHB9:
	call	_Unwind_Resume@PLT
.LEHE9:
.L402:
	call	__stack_chk_fail@PLT
.L380:
	vmovsd	xmm0, QWORD PTR ds:0
	ud2
	.cfi_endproc
.LFE3656:
	.section	.gcc_except_table
.LLSDAC3656:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC3656-.LLSDACSBC3656
.LLSDACSBC3656:
	.uleb128 .LEHB9-.LCOLDB27
	.uleb128 .LEHE9-.LEHB9
	.uleb128 0
	.uleb128 0
.LLSDACSEC3656:
	.section	.text.unlikely
	.text
	.size	_Z6thomasRKSt6vectorIdSaIdEES3_iRS1_RdS5_Ri, .-_Z6thomasRKSt6vectorIdSaIdEES3_iRS1_RdS5_Ri
	.section	.text.unlikely
	.size	_Z6thomasRKSt6vectorIdSaIdEES3_iRS1_RdS5_Ri.cold, .-_Z6thomasRKSt6vectorIdSaIdEES3_iRS1_RdS5_Ri.cold
.LCOLDE27:
	.text
.LHOTE27:
	.section	.rodata.str1.1
.LC28:
	.string	"  k="
.LC29:
	.string	"  ||xk-xk-1|| = "
	.section	.text.unlikely
.LCOLDB30:
	.text
.LHOTB30:
	.p2align 4
	.globl	_Z6jacobiRKSt6vectorIdSaIdEES3_idRS1_
	.type	_Z6jacobiRKSt6vectorIdSaIdEES3_idRS1_, @function
_Z6jacobiRKSt6vectorIdSaIdEES3_idRS1_:
.LFB3657:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA3657
	endbr64
	lea	r10, 8[rsp]
	.cfi_def_cfa 10, 0
	and	rsp, -32
	push	QWORD PTR -8[r10]
	push	rbp
	mov	rbp, rsp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	push	r15
	push	r14
	push	r13
	push	r12
	push	r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	push	rbx
	sub	rsp, 160
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	mov	QWORD PTR -168[rbp], rdi
	mov	rdi, rcx
	mov	QWORD PTR -176[rbp], rsi
	lea	rsi, -80[rbp]
	mov	DWORD PTR -128[rbp], edx
	mov	QWORD PTR -144[rbp], rcx
	vmovsd	QWORD PTR -136[rbp], xmm0
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -56[rbp], rax
	xor	eax, eax
	movsx	rax, edx
	mov	rdx, rsi
	mov	QWORD PTR -184[rbp], rsi
	mov	rbx, rax
	mov	rsi, rax
	mov	QWORD PTR -88[rbp], rax
	mov	QWORD PTR -80[rbp], 0x000000000
.LEHB10:
	call	_ZNSt6vectorIdSaIdEE14_M_fill_assignEmRKd
	mov	rax, rbx
	shr	rax, 60
	jne	.L482
	vpxor	xmm0, xmm0, xmm0
	cmp	QWORD PTR -88[rbp], 0
	vmovdqu	XMMWORD PTR -72[rbp], xmm0
	je	.L483
	mov	rax, QWORD PTR -88[rbp]
	lea	rbx, 0[0+rax*8]
	mov	rdi, rbx
	call	_Znwm@PLT
.LEHE10:
	mov	rdx, rbx
	xor	esi, esi
	lea	r10, [rax+rbx]
	mov	rdi, rax
	mov	QWORD PTR -80[rbp], rax
	mov	r15, rax
	mov	QWORD PTR -64[rbp], r10
	mov	QWORD PTR -96[rbp], r10
	call	memset@PLT
	mov	r10, QWORD PTR -96[rbp]
.L407:
	mov	rax, QWORD PTR -88[rbp]
	mov	QWORD PTR -72[rbp], r10
	mov	rsi, r10
	mov	DWORD PTR -112[rbp], 0
	lea	rcx, 8[0+rax*8]
	lea	rax, 0[0+rax*8]
	mov	QWORD PTR -104[rbp], rax
	mov	eax, DWORD PTR -128[rbp]
	mov	QWORD PTR -96[rbp], rcx
	lea	ecx, -1[rax]
	mov	r12d, eax
	and	eax, -4
	mov	DWORD PTR -108[rbp], ecx
	shr	r12d, 2
	mov	r13d, eax
	sal	r12, 5
.L424:
	mov	rax, QWORD PTR -144[rbp]
	mov	rbx, QWORD PTR [rax]
	mov	eax, DWORD PTR -128[rbp]
	test	eax, eax
	je	.L443
	mov	rax, QWORD PTR -168[rbp]
	mov	QWORD PTR -152[rbp], r10
	xor	ecx, ecx
	xor	r8d, r8d
	mov	QWORD PTR -120[rbp], 0x000000000
	mov	r11, QWORD PTR [rax]
	mov	rax, QWORD PTR -176[rbp]
	mov	QWORD PTR -160[rbp], rsi
	mov	r14, QWORD PTR [rax]
	mov	r9, r11
	.p2align 4,,10
	.p2align 3
.L416:
	cmp	DWORD PTR -108[rbp], 2
	lea	rdx, [r11+r8*8]
	jbe	.L444
	xor	eax, eax
	vxorpd	xmm0, xmm0, xmm0
	.p2align 4,,10
	.p2align 3
.L410:
	vmovupd	ymm4, YMMWORD PTR [rdx+rax]
	vmulpd	ymm2, ymm4, YMMWORD PTR [rbx+rax]
	add	rax, 32
	cmp	r12, rax
	vaddsd	xmm0, xmm0, xmm2
	vunpckhpd	xmm3, xmm2, xmm2
	vextractf128	xmm1, ymm2, 0x1
	vaddsd	xmm0, xmm0, xmm3
	vaddsd	xmm0, xmm0, xmm1
	vunpckhpd	xmm1, xmm1, xmm1
	vaddsd	xmm0, xmm0, xmm1
	jne	.L410
	cmp	DWORD PTR -128[rbp], r13d
	je	.L411
	mov	esi, r13d
	mov	eax, r13d
.L409:
	mov	edi, DWORD PTR -128[rbp]
	sub	edi, esi
	cmp	edi, 1
	je	.L412
	lea	r10, [r8+rsi]
	vmovupd	xmm1, XMMWORD PTR [rbx+rsi*8]
	test	dil, 1
	vmulpd	xmm1, xmm1, XMMWORD PTR [r11+r10*8]
	vaddsd	xmm0, xmm0, xmm1
	vunpckhpd	xmm1, xmm1, xmm1
	vaddsd	xmm0, xmm1, xmm0
	je	.L411
	and	edi, -2
	add	eax, edi
.L412:
	cdqe
	vmovsd	xmm4, QWORD PTR [rdx+rax*8]
	vfmadd231sd	xmm0, xmm4, QWORD PTR [rbx+rax*8]
.L411:
	vmovsd	xmm2, QWORD PTR [r9]
	vfnmadd231sd	xmm0, xmm2, QWORD PTR [rbx+rcx]
	vmovsd	xmm1, QWORD PTR [r14+rcx]
	mov	rax, QWORD PTR -96[rbp]
	add	r9, rax
	mov	rax, QWORD PTR -88[rbp]
	vsubsd	xmm0, xmm1, xmm0
	add	r8, rax
	mov	rax, QWORD PTR -104[rbp]
	vdivsd	xmm2, xmm0, xmm2
	vmovsd	QWORD PTR [r15+rcx], xmm2
	vsubsd	xmm2, xmm2, QWORD PTR [rbx+rcx]
	add	rcx, 8
	vandpd	xmm2, xmm2, XMMWORD PTR .LC1[rip]
	vmaxsd	xmm7, xmm2, QWORD PTR -120[rbp]
	cmp	rcx, rax
	vmovsd	QWORD PTR -120[rbp], xmm7
	jne	.L416
	mov	r10, QWORD PTR -152[rbp]
	mov	rsi, QWORD PTR -160[rbp]
.L408:
	vmovq	xmm4, rbx
	add	DWORD PTR -112[rbp], 1
	mov	rax, r10
	mov	rcx, rsi
	mov	rdi, QWORD PTR -144[rbp]
	cmp	BYTE PTR _ZL7VERBOSE[rip], 0
	mov	rdx, QWORD PTR 8[rdi]
	mov	r14, QWORD PTR 16[rdi]
	mov	QWORD PTR [rdi], r15
	mov	QWORD PTR 8[rdi], r10
	vpinsrq	xmm1, xmm4, rdx, 1
	mov	QWORD PTR -160[rbp], rdx
	mov	QWORD PTR -152[rbp], r14
	mov	QWORD PTR 16[rdi], rsi
	mov	QWORD PTR -64[rbp], r14
	vmovdqa	XMMWORD PTR -80[rbp], xmm1
	jne	.L484
	vmovsd	xmm4, QWORD PTR -120[rbp]
	vcomisd	xmm4, QWORD PTR -136[rbp]
	jbe	.L478
	mov	r10d, DWORD PTR -112[rbp]
	cmp	r10d, 100000
	je	.L479
	mov	rdx, r14
	mov	r14d, DWORD PTR -128[rbp]
	mov	QWORD PTR -120[rbp], rbx
	vmovq	xmm4, QWORD PTR .LC1[rip]
	mov	rbx, QWORD PTR [rdi]
	test	r14d, r14d
	je	.L446
	.p2align 4,,10
	.p2align 3
.L486:
	mov	rsi, QWORD PTR -168[rbp]
	mov	QWORD PTR -128[rbp], rdx
	xor	r8d, r8d
	vxorpd	xmm2, xmm2, xmm2
	mov	DWORD PTR -112[rbp], r10d
	mov	r11, QWORD PTR [rsi]
	mov	QWORD PTR -144[rbp], rdi
	mov	rsi, QWORD PTR -176[rbp]
	mov	QWORD PTR -152[rbp], rax
	mov	QWORD PTR -160[rbp], rcx
	mov	r9, r11
	mov	r15, QWORD PTR [rsi]
	xor	esi, esi
	.p2align 4,,10
	.p2align 3
.L432:
	cmp	DWORD PTR -108[rbp], 2
	lea	rdx, [r11+r8*8]
	jbe	.L447
	xor	eax, eax
	vxorpd	xmm0, xmm0, xmm0
	.p2align 4,,10
	.p2align 3
.L428:
	vmovupd	ymm6, YMMWORD PTR [rdx+rax]
	vmulpd	ymm6, ymm6, YMMWORD PTR [rbx+rax]
	add	rax, 32
	cmp	r12, rax
	vaddsd	xmm0, xmm0, xmm6
	vunpckhpd	xmm3, xmm6, xmm6
	vextractf128	xmm7, ymm6, 0x1
	vunpckhpd	xmm5, xmm7, xmm7
	vaddsd	xmm0, xmm0, xmm3
	vaddsd	xmm0, xmm0, xmm7
	vaddsd	xmm0, xmm0, xmm5
	jne	.L428
	cmp	r14d, r13d
	je	.L433
	mov	ecx, r13d
	mov	eax, r13d
.L427:
	mov	edi, r14d
	sub	edi, ecx
	cmp	edi, 1
	je	.L434
	lea	r10, [rcx+r8]
	vmovupd	xmm3, XMMWORD PTR [rbx+rcx*8]
	test	dil, 1
	vmulpd	xmm3, xmm3, XMMWORD PTR [r11+r10*8]
	vaddsd	xmm0, xmm0, xmm3
	vunpckhpd	xmm3, xmm3, xmm3
	vaddsd	xmm0, xmm3, xmm0
	je	.L433
	and	edi, -2
	add	eax, edi
.L434:
	cdqe
	vmovsd	xmm7, QWORD PTR [rdx+rax*8]
	vfmadd231sd	xmm0, xmm7, QWORD PTR [rbx+rax*8]
.L433:
	vmovsd	xmm5, QWORD PTR [r9]
	vfnmadd231sd	xmm0, xmm5, QWORD PTR [rbx+rsi]
	vmovsd	xmm3, QWORD PTR [r15+rsi]
	mov	rax, QWORD PTR -120[rbp]
	vsubsd	xmm0, xmm3, xmm0
	vdivsd	xmm5, xmm0, xmm5
	vmovsd	QWORD PTR [rax+rsi], xmm5
	mov	rax, QWORD PTR -96[rbp]
	vsubsd	xmm5, xmm5, QWORD PTR [rbx+rsi]
	add	rsi, 8
	add	r9, rax
	mov	rax, QWORD PTR -88[rbp]
	vandpd	xmm5, xmm5, xmm4
	add	r8, rax
	mov	rax, QWORD PTR -104[rbp]
	vmaxsd	xmm2, xmm5, xmm2
	cmp	rsi, rax
	jne	.L432
	mov	rdx, QWORD PTR -128[rbp]
	mov	r10d, DWORD PTR -112[rbp]
	mov	rdi, QWORD PTR -144[rbp]
	mov	rax, QWORD PTR -152[rbp]
	mov	rcx, QWORD PTR -160[rbp]
.L426:
	add	r10d, 1
	vcomisd	xmm2, QWORD PTR -136[rbp]
	mov	rsi, rax
	mov	QWORD PTR 16[rdi], rdx
	mov	rax, rcx
	vmovdqu	XMMWORD PTR [rdi], xmm1
	mov	rcx, rdx
	jbe	.L477
	cmp	r10d, 100000
	je	.L485
	vmovq	xmm6, rbx
	test	r14d, r14d
	mov	QWORD PTR -120[rbp], rbx
	mov	rdx, rax
	mov	rbx, QWORD PTR [rdi]
	mov	rax, QWORD PTR 8[rdi]
	vpinsrq	xmm1, xmm6, rsi, 1
	jne	.L486
.L446:
	vxorpd	xmm2, xmm2, xmm2
	jmp	.L426
.L447:
	xor	ecx, ecx
	xor	eax, eax
	vxorpd	xmm0, xmm0, xmm0
	jmp	.L427
.L484:
	lea	r14, _ZSt4cout[rip]
	mov	edx, 4
	lea	rsi, .LC28[rip]
	mov	rdi, r14
	vzeroupper
.LEHB11:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	esi, DWORD PTR -112[rbp]
	mov	rdi, r14
	call	_ZNSolsEi@PLT
	mov	edx, 16
	lea	rsi, .LC29[rip]
	mov	rdi, rax
	mov	r14, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	xmm0, QWORD PTR -120[rbp]
	mov	rdi, r14
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	mov	rdi, rax
	mov	edx, 1
	lea	rsi, .LC25[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.LEHE11:
	vmovsd	xmm4, QWORD PTR -120[rbp]
	vcomisd	xmm4, QWORD PTR -136[rbp]
	jbe	.L419
	cmp	DWORD PTR -112[rbp], 100000
	je	.L422
	mov	rsi, QWORD PTR -152[rbp]
	mov	r10, QWORD PTR -160[rbp]
	mov	r15, rbx
	jmp	.L424
.L444:
	xor	esi, esi
	xor	eax, eax
	vxorpd	xmm0, xmm0, xmm0
	jmp	.L409
.L477:
	mov	DWORD PTR -112[rbp], r10d
	vzeroupper
.L425:
	test	rbx, rbx
	je	.L403
	sub	rax, rbx
	mov	rdi, rbx
	mov	rsi, rax
	call	_ZdlPvm@PLT
.L403:
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	jne	.L481
	mov	eax, DWORD PTR -112[rbp]
	add	rsp, 160
	pop	rbx
	pop	r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	lea	rsp, -8[r10]
	.cfi_def_cfa 7, 8
	ret
.L443:
	.cfi_restore_state
	mov	QWORD PTR -120[rbp], 0x000000000
	jmp	.L408
.L483:
	mov	QWORD PTR -80[rbp], 0
	xor	r15d, r15d
	xor	r10d, r10d
	mov	QWORD PTR -64[rbp], 0
	jmp	.L407
.L478:
	vzeroupper
.L419:
	mov	rax, QWORD PTR -152[rbp]
	jmp	.L425
.L485:
	vzeroupper
.L438:
	mov	DWORD PTR -112[rbp], 100000
	jmp	.L425
.L481:
	call	__stack_chk_fail@PLT
	.p2align 4,,10
	.p2align 3
.L479:
	vzeroupper
.L422:
	mov	rax, QWORD PTR -152[rbp]
	jmp	.L438
.L482:
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	jne	.L481
	lea	rdi, .LC4[rip]
.LEHB12:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE12:
.L449:
	endbr64
	mov	rbx, rax
	jmp	.L440
	.section	.gcc_except_table
.LLSDA3657:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3657-.LLSDACSB3657
.LLSDACSB3657:
	.uleb128 .LEHB10-.LFB3657
	.uleb128 .LEHE10-.LEHB10
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB11-.LFB3657
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L449-.LFB3657
	.uleb128 0
	.uleb128 .LEHB12-.LFB3657
	.uleb128 .LEHE12-.LEHB12
	.uleb128 0
	.uleb128 0
.LLSDACSE3657:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC3657
	.type	_Z6jacobiRKSt6vectorIdSaIdEES3_idRS1_.cold, @function
_Z6jacobiRKSt6vectorIdSaIdEES3_idRS1_.cold:
.LFSB3657:
.L440:
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	.cfi_escape 0x10,0x6,0x2,0x76,0
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	mov	rdi, QWORD PTR -184[rbp]
	vzeroupper
	call	_ZNSt6vectorIdSaIdEED1Ev
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	jne	.L487
	mov	rdi, rbx
.LEHB13:
	call	_Unwind_Resume@PLT
.LEHE13:
.L487:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE3657:
	.section	.gcc_except_table
.LLSDAC3657:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC3657-.LLSDACSBC3657
.LLSDACSBC3657:
	.uleb128 .LEHB13-.LCOLDB30
	.uleb128 .LEHE13-.LEHB13
	.uleb128 0
	.uleb128 0
.LLSDACSEC3657:
	.section	.text.unlikely
	.text
	.size	_Z6jacobiRKSt6vectorIdSaIdEES3_idRS1_, .-_Z6jacobiRKSt6vectorIdSaIdEES3_idRS1_
	.section	.text.unlikely
	.size	_Z6jacobiRKSt6vectorIdSaIdEES3_idRS1_.cold, .-_Z6jacobiRKSt6vectorIdSaIdEES3_idRS1_.cold
.LCOLDE30:
	.text
.LHOTE30:
	.section	.text.unlikely
.LCOLDB31:
	.text
.LHOTB31:
	.p2align 4
	.globl	_Z9jacobiTriRKSt6vectorIdSaIdEES3_idRS1_
	.type	_Z9jacobiTriRKSt6vectorIdSaIdEES3_idRS1_, @function
_Z9jacobiTriRKSt6vectorIdSaIdEES3_idRS1_:
.LFB3658:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA3658
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movsx	r14, edx
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 168
	.cfi_def_cfa_offset 224
	mov	QWORD PTR 24[rsp], rsi
	mov	QWORD PTR 8[rsp], rcx
	vmovsd	QWORD PTR 16[rsp], xmm0
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 152[rsp], rax
	mov	rax, r14
	shr	rax, 60
	jne	.L566
	vpxor	xmm0, xmm0, xmm0
	test	r14, r14
	mov	rbp, r14
	vmovdqu	XMMWORD PTR 72[rsp], xmm0
	je	.L567
	lea	r12, 0[0+r14*8]
	mov	r15, rdi
	mov	rdi, r12
.LEHB14:
	call	_Znwm@PLT
.LEHE14:
	mov	rdx, r12
	xor	esi, esi
	lea	rbx, [rax+r12]
	mov	rdi, rax
	mov	QWORD PTR 64[rsp], rax
	mov	r13, rax
	mov	QWORD PTR 80[rsp], rbx
	call	memset@PLT
	vpxor	xmm0, xmm0, xmm0
	mov	rdi, r12
	mov	QWORD PTR 72[rsp], rbx
	vmovdqu	XMMWORD PTR 104[rsp], xmm0
.LEHB15:
	call	_Znwm@PLT
.LEHE15:
	mov	rdx, r12
	mov	rdi, rax
	lea	r12, [rax+r12]
	xor	esi, esi
	mov	QWORD PTR 96[rsp], rax
	mov	rbx, rax
	mov	QWORD PTR 112[rsp], r12
	mov	QWORD PTR 40[rsp], rdx
	call	memset@PLT
	mov	rdi, QWORD PTR 40[rsp]
	vpxor	xmm0, xmm0, xmm0
	mov	QWORD PTR 104[rsp], r12
	vmovdqu	XMMWORD PTR 136[rsp], xmm0
.LEHB16:
	call	_Znwm@PLT
.LEHE16:
	mov	rdx, QWORD PTR 40[rsp]
	xor	esi, esi
	mov	rdi, rax
	mov	r12, rax
	mov	QWORD PTR 128[rsp], rax
	lea	rcx, [rax+rdx]
	mov	QWORD PTR 144[rsp], rcx
	mov	QWORD PTR 32[rsp], rcx
	call	memset@PLT
	mov	rcx, QWORD PTR 32[rsp]
	cmp	r14d, 1
	mov	rdx, QWORD PTR [r15]
	mov	QWORD PTR 136[rsp], rcx
	je	.L568
	mov	rsi, QWORD PTR 40[rsp]
	lea	eax, -1[r14]
	cmp	eax, r14d
	cmovg	eax, r14d
	lea	rdi, 8[rsi]
	xor	ecx, ecx
	mov	rsi, rdx
.L498:
	vmovsd	xmm0, QWORD PTR [rsi]
	test	rcx, rcx
	vmovsd	QWORD PTR [rbx+rcx*8], xmm0
	je	.L494
.L569:
	vmovsd	xmm0, QWORD PTR -8[rsi]
	lea	r8, 1[rcx]
	cmp	eax, r8d
	vmovsd	QWORD PTR 0[r13+rcx*8], xmm0
	vmovsd	xmm0, QWORD PTR 8[rsi]
	vmovsd	QWORD PTR [r12+rcx*8], xmm0
	jle	.L495
	add	rsi, rdi
	mov	rcx, r8
	vmovsd	xmm0, QWORD PTR [rsi]
	test	rcx, rcx
	vmovsd	QWORD PTR [rbx+rcx*8], xmm0
	jne	.L569
.L494:
	vmovsd	xmm0, QWORD PTR 8[rsi]
	cmp	eax, 1
	vmovsd	QWORD PTR [r12], xmm0
	je	.L497
	add	rsi, rdi
	mov	ecx, 1
	jmp	.L498
.L568:
	mov	QWORD PTR 40[rsp], 8
	vmovsd	xmm0, QWORD PTR [rdx]
	vmovsd	QWORD PTR [rbx], xmm0
.L492:
	mov	rdi, QWORD PTR 8[rsp]
	lea	rdx, 56[rsp]
	mov	rsi, r14
	mov	QWORD PTR 56[rsp], 0x000000000
.LEHB17:
	call	_ZNSt6vectorIdSaIdEE14_M_fill_assignEmRKd
	test	r14, r14
	je	.L504
	mov	r15, QWORD PTR 40[rsp]
	mov	rdi, r15
	call	_Znwm@PLT
.LEHE17:
	lea	r14, [rax+r15]
	mov	rcx, rax
	cmp	r14, rax
	je	.L506
	mov	rdx, QWORD PTR 40[rsp]
	xor	esi, esi
	mov	rdi, rax
	call	memset@PLT
	mov	rcx, rax
.L506:
	mov	r9, r14
.L507:
	mov	rax, QWORD PTR 8[rsp]
	vmovq	xmm5, QWORD PTR .LC1[rip]
	xor	r15d, r15d
	vxorpd	xmm4, xmm4, xmm4
	mov	r10, QWORD PTR 8[rax]
	mov	rsi, QWORD PTR 16[rax]
	vmovapd	xmm3, xmm5
	mov	rdi, QWORD PTR [rax]
	lea	eax, -1[rbp]
	cmp	ebp, eax
	mov	r8d, eax
	mov	DWORD PTR 32[rsp], eax
	cmovle	r8d, ebp
	test	ebp, ebp
	je	.L532
	.p2align 4,,10
	.p2align 3
.L572:
	mov	rax, QWORD PTR 24[rsp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR 32[rsp]
	test	eax, eax
	jle	.L533
	vxorpd	xmm1, xmm1, xmm1
	vmovapd	xmm2, xmm5
	vxorpd	xmm6, xmm6, xmm6
	xor	eax, eax
	test	rax, rax
	je	.L510
	.p2align 4,,10
	.p2align 3
.L571:
	vmovsd	xmm6, QWORD PTR 0[r13+rax*8]
	vfmadd132sd	xmm6, xmm4, QWORD PTR -8[rdi+rax*8]
.L510:
	vmovsd	xmm7, QWORD PTR [r12+rax*8]
	vmovsd	xmm0, QWORD PTR [rdx+rax*8]
	lea	r11, 1[rax]
	vfmadd231sd	xmm6, xmm7, QWORD PTR 8[rdi+rax*8]
	cmp	r8d, r11d
	vsubsd	xmm0, xmm0, xmm6
	vdivsd	xmm0, xmm0, QWORD PTR [rbx+rax*8]
	vmovsd	QWORD PTR [rcx+rax*8], xmm0
	vsubsd	xmm0, xmm0, QWORD PTR [rdi+rax*8]
	vandpd	xmm0, xmm0, xmm3
	vmaxsd	xmm1, xmm0, xmm1
	jle	.L570
	mov	rax, r11
	vxorpd	xmm6, xmm6, xmm6
	test	rax, rax
	jne	.L571
	jmp	.L510
.L504:
	mov	r9, QWORD PTR 40[rsp]
	xor	ecx, ecx
	xor	r14d, r14d
	jmp	.L507
	.p2align 4,,10
	.p2align 3
.L570:
	add	eax, 1
	cmp	ebp, eax
	jle	.L508
.L509:
	cdqe
	.p2align 4,,10
	.p2align 3
.L518:
	test	eax, eax
	vxorpd	xmm6, xmm6, xmm6
	je	.L515
	lea	r11d, -1[rax]
	movsx	r11, r11d
	vmovsd	xmm6, QWORD PTR [rdi+r11*8]
	vfmadd132sd	xmm6, xmm4, QWORD PTR 0[r13+rax*8]
.L515:
	vmovsd	xmm0, QWORD PTR [rdx+rax*8]
	vsubsd	xmm0, xmm0, xmm6
	vdivsd	xmm0, xmm0, QWORD PTR [rbx+rax*8]
	vmovsd	QWORD PTR [rcx+rax*8], xmm0
	vsubsd	xmm0, xmm0, QWORD PTR [rdi+rax*8]
	add	rax, 1
	cmp	ebp, eax
	vandpd	xmm0, xmm0, xmm2
	vmaxsd	xmm1, xmm0, xmm1
	jg	.L518
.L508:
	add	r15d, 1
	vcomisd	xmm1, QWORD PTR 16[rsp]
	mov	rax, QWORD PTR 8[rsp]
	mov	QWORD PTR [rax], rcx
	jbe	.L520
	cmp	r15d, 100000
	mov	rax, r10
	mov	r10, r14
	je	.L520
	mov	rdx, r9
	mov	r14, rax
	test	ebp, ebp
	mov	rax, rcx
	mov	r9, rsi
	mov	rcx, rdi
	mov	rsi, rdx
	mov	rdi, rax
	jne	.L572
.L532:
	vxorpd	xmm1, xmm1, xmm1
	jmp	.L508
	.p2align 4,,10
	.p2align 3
.L533:
	vxorpd	xmm1, xmm1, xmm1
	xor	eax, eax
	vmovapd	xmm2, xmm5
	jmp	.L509
.L520:
	mov	rax, QWORD PTR 8[rsp]
	test	rdi, rdi
	mov	QWORD PTR 8[rax], r14
	mov	QWORD PTR 16[rax], r9
	je	.L523
	sub	rsi, rdi
	call	_ZdlPvm@PLT
.L523:
	test	r12, r12
	je	.L524
	mov	rsi, QWORD PTR 40[rsp]
	mov	rdi, r12
	call	_ZdlPvm@PLT
.L524:
	test	rbx, rbx
	je	.L525
	mov	rsi, QWORD PTR 40[rsp]
	mov	rdi, rbx
	call	_ZdlPvm@PLT
.L525:
	test	r13, r13
	je	.L488
	mov	rsi, QWORD PTR 40[rsp]
	mov	rdi, r13
	call	_ZdlPvm@PLT
.L488:
	mov	rax, QWORD PTR 152[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L565
	add	rsp, 168
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	mov	eax, r15d
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
.L495:
	.cfi_restore_state
	lea	eax, 1[rcx]
.L497:
	cmp	ebp, eax
	jle	.L492
	cdqe
	mov	rcx, rdi
	imul	rcx, rax
	add	rdx, rcx
	jmp	.L501
.L499:
	vmovsd	xmm0, QWORD PTR -8[rdx]
	vmovsd	QWORD PTR 0[r13+rax*8], xmm0
.L500:
	add	rax, 1
	add	rdx, rdi
	cmp	ebp, eax
	jle	.L492
.L501:
	vmovsd	xmm0, QWORD PTR [rdx]
	test	eax, eax
	vmovsd	QWORD PTR [rbx+rax*8], xmm0
	jne	.L499
	vmovsd	xmm0, QWORD PTR 8[rdx]
	vmovsd	QWORD PTR [r12+rax*8], xmm0
	jmp	.L500
.L567:
	mov	QWORD PTR 80[rsp], 0
	xor	r13d, r13d
	xor	ebx, ebx
	xor	r12d, r12d
	mov	QWORD PTR 112[rsp], 0
	mov	QWORD PTR 144[rsp], 0
	mov	QWORD PTR 40[rsp], 0
	vmovdqa	XMMWORD PTR 64[rsp], xmm0
	vmovdqa	XMMWORD PTR 96[rsp], xmm0
	vmovdqa	XMMWORD PTR 128[rsp], xmm0
	jmp	.L492
.L565:
	call	__stack_chk_fail@PLT
.L566:
	mov	rax, QWORD PTR 152[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L565
	lea	rdi, .LC4[rip]
.LEHB18:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE18:
.L538:
	endbr64
	mov	rbx, rax
	vzeroupper
	jmp	.L529
.L539:
	endbr64
	mov	rbx, rax
	vzeroupper
	jmp	.L528
.L540:
	endbr64
	mov	rbx, rax
	jmp	.L527
	.section	.gcc_except_table
.LLSDA3658:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3658-.LLSDACSB3658
.LLSDACSB3658:
	.uleb128 .LEHB14-.LFB3658
	.uleb128 .LEHE14-.LEHB14
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB15-.LFB3658
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L538-.LFB3658
	.uleb128 0
	.uleb128 .LEHB16-.LFB3658
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L539-.LFB3658
	.uleb128 0
	.uleb128 .LEHB17-.LFB3658
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L540-.LFB3658
	.uleb128 0
	.uleb128 .LEHB18-.LFB3658
	.uleb128 .LEHE18-.LEHB18
	.uleb128 0
	.uleb128 0
.LLSDACSE3658:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC3658
	.type	_Z9jacobiTriRKSt6vectorIdSaIdEES3_idRS1_.cold, @function
_Z9jacobiTriRKSt6vectorIdSaIdEES3_idRS1_.cold:
.LFSB3658:
.L527:
	.cfi_def_cfa_offset 224
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	lea	rdi, 128[rsp]
	vzeroupper
	call	_ZNSt6vectorIdSaIdEED1Ev
.L528:
	lea	rdi, 96[rsp]
	call	_ZNSt6vectorIdSaIdEED1Ev
.L529:
	lea	rdi, 64[rsp]
	call	_ZNSt6vectorIdSaIdEED1Ev
	mov	rax, QWORD PTR 152[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L573
	mov	rdi, rbx
.LEHB19:
	call	_Unwind_Resume@PLT
.LEHE19:
.L573:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE3658:
	.section	.gcc_except_table
.LLSDAC3658:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC3658-.LLSDACSBC3658
.LLSDACSBC3658:
	.uleb128 .LEHB19-.LCOLDB31
	.uleb128 .LEHE19-.LEHB19
	.uleb128 0
	.uleb128 0
.LLSDACSEC3658:
	.section	.text.unlikely
	.text
	.size	_Z9jacobiTriRKSt6vectorIdSaIdEES3_idRS1_, .-_Z9jacobiTriRKSt6vectorIdSaIdEES3_idRS1_
	.section	.text.unlikely
	.size	_Z9jacobiTriRKSt6vectorIdSaIdEES3_idRS1_.cold, .-_Z9jacobiTriRKSt6vectorIdSaIdEES3_idRS1_.cold
.LCOLDE31:
	.text
.LHOTE31:
	.section	.rodata.str1.1
.LC34:
	.string	"-"
.LC35:
	.string	"+"
	.section	.rodata.str1.8
	.align 8
.LC37:
	.string	"\320\234\320\265\321\202\320\276\320\264 \320\277\321\200\320\276\320\263\320\276\320\275\320\272\320\270 \320\275\320\265 \320\267\320\260\321\201\321\202\320\276\321\201\320\276\320\262\320\275\320\270\320\271\n"
	.section	.rodata.str1.1
.LC39:
	.string	"N = "
.LC40:
	.string	"\320\237\321\200\320\276\320\263\320\276\320\275\320\272\320\260:\n"
.LC41:
	.string	"  x"
.LC42:
	.string	" = "
.LC43:
	.string	"\320\257\320\272\320\276\320\261\321\226:\n"
.LC44:
	.string	", eps = "
.LC45:
	.string	", mode = "
	.section	.rodata.str1.8
	.align 8
.LC47:
	.string	"det A (\320\277\321\200\320\276\320\263\320\276\320\275\320\272\320\260)            = "
	.section	.rodata.str1.1
.LC48:
	.string	"10^"
	.section	.rodata.str1.8
	.align 8
.LC49:
	.string	"  (double \320\277\320\265\321\200\320\265\320\277\320\276\320\262\320\275\321\216\321\224\321\202\321\214\321\201\321\217)\n"
	.align 8
.LC50:
	.string	"\320\257\320\272\320\276\320\261\321\226: \321\226\321\202\320\265\321\200\320\260\321\206\321\226\320\271             = "
	.align 8
.LC51:
	.string	"||x_\320\277\321\200\320\276\320\263\320\276\320\275\320\272\320\260 - x_\320\257\320\272\320\276\320\261\321\226||    = "
	.align 8
.LC52:
	.string	"\320\235\320\265\320\262'\321\217\320\267\320\272\320\260 (\320\277\321\200\320\276\320\263\320\276\320\275\320\272\320\260 / \320\257\320\272\320\276\320\261\321\226) = "
	.section	.rodata.str1.1
.LC53:
	.string	" / "
.LC54:
	.string	"cond(A) \320\264\320\273\321\217 N="
.LC55:
	.string	"          = "
	.section	.rodata.str1.8
	.align 8
.LC56:
	.string	"\320\247\320\260\321\201, \320\274\321\201: \320\263\320\265\320\275\320\265\321\200\320\260\321\206\321\226\321\217 "
	.section	.rodata.str1.1
.LC57:
	.string	", \320\277\321\200\320\276\320\263\320\276\320\275\320\272\320\260 "
.LC58:
	.string	", \320\257\320\272\320\276\320\261\321\226 "
.LC59:
	.string	", \320\276\320\261\320\265\321\200\320\275\320\265\320\275\320\260 "
.LC60:
	.string	", cond "
	.section	.text.unlikely
.LCOLDB61:
	.section	.text.startup,"ax",@progbits
.LHOTB61:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3662:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA3662
	endbr64
	lea	r10, 8[rsp]
	.cfi_def_cfa 10, 0
	and	rsp, -32
	push	QWORD PTR -8[r10]
	push	rbp
	mov	rbp, rsp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	push	r15
	push	r14
	push	r13
	push	r12
	push	r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	push	rbx
	sub	rsp, 512
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -56[rbp], rax
	xor	eax, eax
	cmp	edi, 1
	jg	.L681
	xor	r12d, r12d
	vmovsd	xmm6, QWORD PTR .LC33[rip]
	mov	DWORD PTR -424[rbp], 600
	mov	r15d, 2000
	mov	DWORD PTR -404[rbp], r12d
	vmovsd	QWORD PTR -416[rbp], xmm6
.L575:
	mov	rax, QWORD PTR _ZSt4cout[rip]
	cmp	r15d, 10
	lea	r13, _ZSt4cout[rip]
	lea	rbx, -304[rbp]
	setle	BYTE PTR _ZL7VERBOSE[rip]
	lea	r14, -336[rbp]
	mov	rdx, QWORD PTR -24[rax]
	add	rdx, r13
	mov	eax, DWORD PTR 24[rdx]
	mov	QWORD PTR 8[rdx], 6
	and	eax, -261
	or	eax, 4
	mov	DWORD PTR 24[rdx], eax
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT
	vpxor	xmm0, xmm0, xmm0
	mov	rdx, rbx
	mov	rsi, r14
	mov	edi, r15d
	mov	QWORD PTR -448[rbp], rax
	mov	QWORD PTR -320[rbp], 0
	mov	QWORD PTR -288[rbp], 0
	mov	QWORD PTR -392[rbp], rbx
	mov	QWORD PTR -384[rbp], r14
	vmovdqa	XMMWORD PTR -336[rbp], xmm0
	vmovdqa	XMMWORD PTR -304[rbp], xmm0
.LEHB20:
	call	_Z10makeSystemiRSt6vectorIdSaIdEES2_
.LEHE20:
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT
	mov	QWORD PTR -464[rbp], rax
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT
	vpxor	xmm0, xmm0, xmm0
	sub	rsp, 8
	mov	edx, r15d
	mov	QWORD PTR -456[rbp], rax
	mov	rsi, rbx
	lea	rax, -272[rbp]
	lea	r9, -344[rbp]
	mov	QWORD PTR -400[rbp], rax
	mov	rcx, rax
	lea	rax, -356[rbp]
	lea	r8, -352[rbp]
	mov	QWORD PTR -256[rbp], 0
	mov	rdi, r14
	mov	QWORD PTR -352[rbp], 0x000000000
	mov	QWORD PTR -344[rbp], 0x000000000
	mov	DWORD PTR -356[rbp], 1
	vmovdqa	XMMWORD PTR -272[rbp], xmm0
	push	rax
.LEHB21:
	.cfi_escape 0x2e,0x10
	call	_Z6thomasRKSt6vectorIdSaIdEES3_iRS1_RdS5_Ri
.LEHE21:
	mov	r12d, eax
	pop	r10
	pop	r11
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT
	test	r12b, r12b
	mov	QWORD PTR -472[rbp], rax
	je	.L682
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT
	vxorpd	xmm5, xmm5, xmm5
	xor	r9d, r9d
	mov	edx, r15d
	vcvtsi2sd	xmm0, xmm5, rax
	cmp	DWORD PTR -404[rbp], 1
	lea	rax, -240[rbp]
	vdivsd	xmm7, xmm0, QWORD PTR .LC38[rip]
	vpxor	xmm0, xmm0, xmm0
	mov	QWORD PTR -224[rbp], r9
	mov	rsi, QWORD PTR -392[rbp]
	mov	rcx, rax
	vmovdqa	XMMWORD PTR -240[rbp], xmm0
	mov	rdi, QWORD PTR -384[rbp]
	vmovsd	xmm0, QWORD PTR -416[rbp]
	mov	QWORD PTR -432[rbp], rax
	vmovsd	QWORD PTR -376[rbp], xmm7
	je	.L683
.LEHB22:
	.cfi_escape 0x2e,0
	call	_Z6jacobiRKSt6vectorIdSaIdEES3_idRS1_
.L679:
	mov	DWORD PTR -492[rbp], eax
	movsx	rbx, r15d
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT
	vxorpd	xmm5, xmm5, xmm5
	vcvtsi2sd	xmm0, xmm5, rax
	vdivsd	xmm0, xmm0, QWORD PTR .LC38[rip]
	vsubsd	xmm7, xmm0, QWORD PTR -376[rbp]
	movabs	rax, 1152921504606846975
	cmp	rax, rbx
	vmovsd	QWORD PTR -488[rbp], xmm7
	jb	.L684
	vpxor	xmm0, xmm0, xmm0
	test	rbx, rbx
	vmovdqu	XMMWORD PTR -200[rbp], xmm0
	je	.L584
	lea	r12, 0[0+rbx*8]
	mov	rdi, r12
	call	_Znwm@PLT
.LEHE22:
	vmovq	xmm2, rax
	lea	rcx, [rax+r12]
	sub	rbx, 1
	mov	r14, rax
	vpunpcklqdq	xmm0, xmm2, xmm2
	mov	QWORD PTR -192[rbp], rcx
	lea	rdi, 8[rax]
	mov	QWORD PTR [rax], 0x000000000
	vmovdqa	XMMWORD PTR -208[rbp], xmm0
	je	.L585
	cmp	rcx, rdi
	je	.L586
	lea	rdx, -8[r12]
	xor	esi, esi
	mov	QWORD PTR -376[rbp], rcx
	call	memset@PLT
	mov	rcx, QWORD PTR -376[rbp]
.L586:
	mov	rdi, rcx
.L585:
	cmp	r15d, 1
	mov	QWORD PTR -200[rbp], rdi
	mov	rdx, QWORD PTR -272[rbp]
	mov	rcx, QWORD PTR -240[rbp]
	je	.L633
	lea	rsi, 8[rdx]
	mov	rax, r14
	sub	rax, rsi
	cmp	rax, 16
	jbe	.L633
	lea	rsi, 8[rcx]
	mov	rax, r14
	sub	rax, rsi
	cmp	rax, 16
	jbe	.L633
	lea	eax, -1[r15]
	mov	r8d, r15d
	cmp	eax, 2
	jbe	.L634
	mov	esi, r15d
	xor	eax, eax
	shr	esi, 2
	sal	rsi, 5
	.p2align 4,,10
	.p2align 3
.L589:
	vmovupd	ymm5, YMMWORD PTR [rdx+rax]
	vsubpd	ymm0, ymm5, YMMWORD PTR [rcx+rax]
	vmovupd	YMMWORD PTR [r14+rax], ymm0
	add	rax, 32
	cmp	rsi, rax
	jne	.L589
	mov	eax, r15d
	and	eax, -4
	cmp	eax, r15d
	mov	esi, eax
	je	.L675
	mov	r8d, r15d
	sub	r8d, eax
	cmp	r8d, 1
	je	.L685
	vzeroupper
.L588:
	vmovupd	xmm4, XMMWORD PTR [rdx+rsi*8]
	vsubpd	xmm0, xmm4, XMMWORD PTR [rcx+rsi*8]
	test	r8b, 1
	vmovupd	XMMWORD PTR [r14+rsi*8], xmm0
	je	.L597
	and	r8d, -2
	add	eax, r8d
.L594:
	cdqe
	vmovsd	xmm0, QWORD PTR [rdx+rax*8]
	vsubsd	xmm0, xmm0, QWORD PTR [rcx+rax*8]
	vmovsd	QWORD PTR [r14+rax*8], xmm0
.L597:
	cmp	rdi, r14
	je	.L592
	mov	QWORD PTR -376[rbp], 0x000000000
	vmovq	xmm1, QWORD PTR .LC1[rip]
	mov	rax, r14
	.p2align 4,,10
	.p2align 3
.L600:
	vmovsd	xmm0, QWORD PTR [rax]
	add	rax, 8
	cmp	rax, rdi
	vandpd	xmm0, xmm0, xmm1
	vmaxsd	xmm2, xmm0, QWORD PTR -376[rbp]
	vmovsd	QWORD PTR -376[rbp], xmm2
	jne	.L600
.L601:
	mov	r14, QWORD PTR -392[rbp]
	mov	rbx, QWORD PTR -384[rbp]
	mov	ecx, r15d
	mov	rdx, QWORD PTR -400[rbp]
	mov	rsi, r14
	mov	rdi, rbx
.LEHB23:
	call	_Z8residualRKSt6vectorIdSaIdEES3_S3_i
	mov	rdx, QWORD PTR -432[rbp]
	mov	ecx, r15d
	mov	rsi, r14
	mov	rdi, rbx
	vmovsd	QWORD PTR -512[rbp], xmm0
	call	_Z8residualRKSt6vectorIdSaIdEES3_S3_i
.LEHE23:
	mov	ebx, DWORD PTR -424[rbp]
	vmovsd	QWORD PTR -520[rbp], xmm0
	vpxor	xmm0, xmm0, xmm0
	vmovdqa	XMMWORD PTR -176[rbp], xmm0
	cmp	ebx, r15d
	vmovdqa	XMMWORD PTR -144[rbp], xmm0
	cmovg	ebx, r15d
	xor	esi, esi
	xor	edi, edi
	xor	r8d, r8d
	mov	QWORD PTR -160[rbp], rsi
	mov	QWORD PTR -128[rbp], rdi
	vmovdqa	XMMWORD PTR -112[rbp], xmm0
	mov	DWORD PTR -408[rbp], ebx
	mov	QWORD PTR -96[rbp], r8
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT
	vxorpd	xmm6, xmm6, xmm6
	lea	rdx, -112[rbp]
	mov	edi, ebx
	vcvtsi2sd	xmm0, xmm6, rax
	lea	rsi, -176[rbp]
	vdivsd	xmm5, xmm0, QWORD PTR .LC38[rip]
	mov	QWORD PTR -504[rbp], rdx
	lea	rax, -144[rbp]
	mov	QWORD PTR -480[rbp], rsi
	mov	QWORD PTR -424[rbp], rax
	vmovsd	QWORD PTR -440[rbp], xmm5
.LEHB24:
	call	_Z10makeSystemiRSt6vectorIdSaIdEES2_
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT
	vxorpd	xmm6, xmm6, xmm6
	vcvtsi2sd	xmm0, xmm6, rax
	vdivsd	xmm0, xmm0, QWORD PTR .LC38[rip]
	vsubsd	xmm7, xmm0, QWORD PTR -440[rbp]
	vmovsd	QWORD PTR -528[rbp], xmm7
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT
	mov	r12, QWORD PTR -176[rbp]
	mov	rbx, QWORD PTR -168[rbp]
	xor	ecx, ecx
	vxorpd	xmm6, xmm6, xmm6
	mov	QWORD PTR -64[rbp], rcx
	vcvtsi2sd	xmm0, xmm6, rax
	sub	rbx, r12
	vdivsd	xmm6, xmm0, QWORD PTR .LC38[rip]
	vpxor	xmm0, xmm0, xmm0
	vmovsd	QWORD PTR -440[rbp], xmm6
	vmovdqa	XMMWORD PTR -80[rbp], xmm0
	je	.L602
	movabs	rax, 9223372036854775800
	cmp	rax, rbx
	jb	.L686
	lea	rax, -144[rbp]
	mov	rdi, rbx
	mov	QWORD PTR -424[rbp], rax
	call	_Znwm@PLT
.LEHE24:
	lea	r14, [rax+rbx]
	cmp	rbx, 8
	mov	QWORD PTR -80[rbp], rax
	mov	rdi, rax
	mov	QWORD PTR -64[rbp], r14
	jle	.L605
	mov	rdx, rbx
	mov	rsi, r12
	call	memmove@PLT
.L606:
	mov	QWORD PTR -72[rbp], r14
	lea	rbx, -80[rbp]
	lea	r14, -144[rbp]
	mov	esi, DWORD PTR -408[rbp]
	mov	rdx, r14
	mov	rdi, rbx
	mov	QWORD PTR -424[rbp], r14
.LEHB25:
	call	_Z7inverseSt6vectorIdSaIdEEiRS1_
.LEHE25:
	mov	rdi, rbx
	mov	r12d, eax
	mov	BYTE PTR -493[rbp], al
	call	_ZNSt6vectorIdSaIdEED1Ev
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT
	vxorpd	xmm7, xmm7, xmm7
	vcvtsi2sd	xmm0, xmm7, rax
	vdivsd	xmm0, xmm0, QWORD PTR .LC38[rip]
	vsubsd	xmm6, xmm0, QWORD PTR -440[rbp]
	vmovsd	QWORD PTR -536[rbp], xmm6
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT
	vxorpd	xmm7, xmm7, xmm7
	test	r12b, r12b
	mov	QWORD PTR -440[rbp], 0x000000000
	vcvtsi2sd	xmm0, xmm7, rax
	vdivsd	xmm7, xmm0, QWORD PTR .LC38[rip]
	vmovsd	QWORD PTR -544[rbp], xmm7
	je	.L608
	mov	esi, DWORD PTR -408[rbp]
	mov	rdi, QWORD PTR -480[rbp]
	call	_Z7normMatRKSt6vectorIdSaIdEEi
	mov	rdi, r14
	vmovsd	QWORD PTR -440[rbp], xmm0
	call	_Z7normMatRKSt6vectorIdSaIdEEi
	vmulsd	xmm3, xmm0, QWORD PTR -440[rbp]
	vmovsd	QWORD PTR -440[rbp], xmm3
.L608:
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT
	vxorpd	xmm7, xmm7, xmm7
	cmp	BYTE PTR _ZL7VERBOSE[rip], 0
	vcvtsi2sd	xmm0, xmm7, rax
	vdivsd	xmm0, xmm0, QWORD PTR .LC38[rip]
	vsubsd	xmm6, xmm0, QWORD PTR -544[rbp]
	vmovsd	QWORD PTR -544[rbp], xmm6
	je	.L615
	lea	rsi, .LC40[rip]
	mov	rdi, r13
.LEHB26:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	xor	ebx, ebx
	lea	r14, .LC42[rip]
	jmp	.L611
	.p2align 4,,10
	.p2align 3
.L612:
	mov	edx, 3
	lea	rsi, .LC41[rip]
	mov	rdi, r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	lea	esi, 1[rbx]
	mov	rdi, r13
	call	_ZNSolsEi@PLT
	mov	edx, 3
	mov	rsi, r14
	mov	rdi, rax
	mov	r12, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rax, QWORD PTR -272[rbp]
	mov	rdi, r12
	vmovsd	xmm0, QWORD PTR [rax+rbx*8]
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	mov	rdi, rax
	mov	edx, 1
	lea	rsi, .LC25[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	add	rbx, 1
.L611:
	cmp	r15d, ebx
	jg	.L612
	lea	rsi, .LC43[rip]
	mov	rdi, r13
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	xor	ebx, ebx
	lea	r14, .LC42[rip]
	jmp	.L613
	.p2align 4,,10
	.p2align 3
.L614:
	mov	edx, 3
	lea	rsi, .LC41[rip]
	mov	rdi, r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	lea	esi, 1[rbx]
	mov	rdi, r13
	call	_ZNSolsEi@PLT
	mov	edx, 3
	mov	rsi, r14
	mov	rdi, rax
	mov	r12, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rax, QWORD PTR -240[rbp]
	mov	rdi, r12
	vmovsd	xmm0, QWORD PTR [rax+rbx*8]
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	mov	rdi, rax
	mov	edx, 1
	lea	rsi, .LC25[rip]
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	add	rbx, 1
.L613:
	cmp	r15d, ebx
	jg	.L614
.L615:
	mov	rax, QWORD PTR _ZSt4cout[rip]
	lea	rsi, .LC39[rip]
	mov	rdi, r13
	mov	rdx, QWORD PTR -24[rax]
	add	rdx, r13
	mov	eax, DWORD PTR 24[rdx]
	mov	QWORD PTR 8[rdx], 3
	and	eax, -261
	or	ah, 1
	mov	DWORD PTR 24[rdx], eax
	mov	edx, 4
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	esi, r15d
	mov	rdi, r13
	call	_ZNSolsEi@PLT
	mov	edx, 8
	lea	rsi, .LC44[rip]
	mov	rdi, rax
	mov	rbx, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	xmm0, QWORD PTR -416[rbp]
	mov	rdi, rbx
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	mov	edx, 9
	lea	rsi, .LC45[rip]
	mov	rdi, rax
	mov	rbx, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	esi, DWORD PTR -404[rbp]
	mov	rdi, rbx
	call	_ZNSolsEi@PLT
	lea	rbx, .LC25[rip]
	mov	rdi, rax
	mov	rsi, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	mov	r12, QWORD PTR -352[rbp]
	mov	edx, 38
	mov	rdi, r13
	vmovsd	xmm1, QWORD PTR .LC46[rip]
	lea	rsi, .LC47[rip]
	vmovq	xmm5, r12
	vandpd	xmm0, xmm5, XMMWORD PTR .LC1[rip]
	vucomisd	xmm1, xmm0
	jb	.L616
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovq	xmm0, r12
	mov	rdi, r13
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	mov	rdi, rax
	mov	rsi, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
.L617:
	mov	edx, 43
	lea	rsi, .LC50[rip]
	mov	rdi, r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	esi, DWORD PTR -492[rbp]
	mov	rdi, r13
	call	_ZNSolsEi@PLT
	mov	rdi, rax
	mov	rsi, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	mov	edx, 43
	lea	rsi, .LC51[rip]
	mov	rdi, r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	xmm0, QWORD PTR -376[rbp]
	mov	rdi, r13
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	mov	rdi, rax
	mov	rsi, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	mov	edx, 50
	lea	rsi, .LC52[rip]
	mov	rdi, r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	xmm0, QWORD PTR -512[rbp]
	mov	rdi, r13
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	mov	edx, 3
	lea	rsi, .LC53[rip]
	mov	rdi, rax
	mov	r12, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	xmm0, QWORD PTR -520[rbp]
	mov	rdi, r12
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	mov	rdi, rax
	mov	rsi, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	mov	edx, 17
	lea	rsi, .LC54[rip]
	mov	rdi, r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	esi, DWORD PTR -408[rbp]
	mov	rdi, r13
	call	_ZNSolsEi@PLT
	mov	edx, 12
	lea	rsi, .LC55[rip]
	mov	rdi, rax
	mov	r12, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmp	BYTE PTR -493[rbp], 0
	jne	.L619
	vmovsd	xmm7, QWORD PTR .LC36[rip]
	vmovsd	QWORD PTR -440[rbp], xmm7
.L619:
	vmovsd	xmm0, QWORD PTR -440[rbp]
	mov	rdi, r12
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	mov	rdi, rax
	mov	rsi, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	mov	rax, QWORD PTR _ZSt4cout[rip]
	lea	rsi, .LC56[rip]
	mov	rdi, r13
	mov	rdx, QWORD PTR -24[rax]
	add	rdx, r13
	mov	eax, DWORD PTR 24[rdx]
	mov	QWORD PTR 8[rdx], 2
	and	eax, -261
	or	eax, 4
	mov	DWORD PTR 24[rdx], eax
	mov	edx, 33
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vxorpd	xmm4, xmm4, xmm4
	mov	rdi, r13
	vcvtsi2sd	xmm0, xmm4, QWORD PTR -464[rbp]
	vdivsd	xmm0, xmm0, QWORD PTR .LC38[rip]
	vcvtsi2sd	xmm1, xmm4, QWORD PTR -448[rbp]
	vdivsd	xmm1, xmm1, QWORD PTR .LC38[rip]
	vsubsd	xmm0, xmm0, xmm1
	vaddsd	xmm0, xmm0, QWORD PTR -528[rbp]
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	mov	edx, 19
	lea	rsi, .LC57[rip]
	mov	rdi, rax
	mov	r12, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vxorpd	xmm4, xmm4, xmm4
	mov	rdi, r12
	vcvtsi2sd	xmm0, xmm4, QWORD PTR -472[rbp]
	vdivsd	xmm0, xmm0, QWORD PTR .LC38[rip]
	vcvtsi2sd	xmm1, xmm4, QWORD PTR -456[rbp]
	vdivsd	xmm1, xmm1, QWORD PTR .LC38[rip]
	vsubsd	xmm0, xmm0, xmm1
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	mov	edx, 13
	lea	rsi, .LC58[rip]
	mov	rdi, rax
	mov	r12, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	xmm0, QWORD PTR -488[rbp]
	mov	rdi, r12
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	mov	edx, 19
	lea	rsi, .LC59[rip]
	mov	rdi, rax
	mov	r12, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	xmm0, QWORD PTR -536[rbp]
	mov	rdi, r12
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	mov	edx, 7
	lea	rsi, .LC60[rip]
	mov	rdi, rax
	mov	r12, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	xmm0, QWORD PTR -544[rbp]
	mov	rdi, r12
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	mov	rdi, rax
	mov	rsi, rbx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
.LEHE26:
	mov	rdi, QWORD PTR -504[rbp]
	xor	ebx, ebx
	call	_ZNSt6vectorIdSaIdEED1Ev
	mov	rdi, QWORD PTR -424[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
	mov	rdi, QWORD PTR -480[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
	lea	rdi, -208[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
	mov	rdi, QWORD PTR -432[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
.L579:
	mov	rdi, QWORD PTR -400[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
	mov	rdi, QWORD PTR -392[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
	mov	rdi, QWORD PTR -384[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	jne	.L674
	lea	rsp, -48[rbp]
	mov	eax, ebx
	pop	rbx
	pop	r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	lea	rsp, -8[r10]
	.cfi_def_cfa 7, 8
	ret
.L683:
	.cfi_restore_state
.LEHB27:
	call	_Z9jacobiTriRKSt6vectorIdSaIdEES3_idRS1_
.LEHE27:
	jmp	.L679
.L633:
	xor	eax, eax
	.p2align 4,,10
	.p2align 3
.L596:
	vmovsd	xmm0, QWORD PTR [rdx+rax]
	vsubsd	xmm0, xmm0, QWORD PTR [rcx+rax]
	vmovsd	QWORD PTR [r14+rax], xmm0
	add	rax, 8
	cmp	rax, r12
	jne	.L596
	jmp	.L597
.L681:
	mov	r12d, edi
	mov	rdi, QWORD PTR 8[rsi]
	mov	r13, rsi
	mov	edx, 10
	xor	esi, esi
	call	__isoc23_strtol@PLT
	cmp	r12d, 2
	mov	r14, rax
	mov	r15d, eax
	je	.L629
	mov	rdi, QWORD PTR 16[r13]
	xor	esi, esi
	mov	edx, 10
	call	__isoc23_strtol@PLT
	cmp	r12d, 3
	mov	DWORD PTR -424[rbp], eax
	je	.L576
	mov	rdi, QWORD PTR 24[r13]
	xor	esi, esi
	call	strtod@PLT
	cmp	r12d, 4
	vmovsd	QWORD PTR -416[rbp], xmm0
	je	.L678
	mov	rdi, QWORD PTR 32[r13]
	mov	edx, 10
	xor	esi, esi
	call	__isoc23_strtol@PLT
	mov	DWORD PTR -404[rbp], eax
	jmp	.L575
.L682:
	lea	rsi, .LC37[rip]
	mov	rdi, r13
.LEHB28:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
.LEHE28:
	mov	ebx, 1
	jmp	.L579
.L584:
	xor	eax, eax
	vmovdqa	XMMWORD PTR -208[rbp], xmm0
	mov	QWORD PTR -192[rbp], rax
.L592:
	mov	QWORD PTR -376[rbp], 0x000000000
	jmp	.L601
.L616:
.LEHB29:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmp	DWORD PTR -356[rbp], 0
	lea	rsi, .LC35[rip]
	lea	rax, .LC34[rip]
	mov	rdi, r13
	cmovs	rsi, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	mov	edx, 3
	lea	rsi, .LC48[rip]
	mov	rdi, rax
	mov	r12, rax
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	mov	rax, QWORD PTR [r12]
	vmovsd	xmm0, QWORD PTR -344[rbp]
	mov	rdi, r12
	mov	rdx, QWORD PTR -24[rax]
	add	rdx, r12
	mov	eax, DWORD PTR 24[rdx]
	mov	QWORD PTR 8[rdx], 2
	and	eax, -261
	or	eax, 4
	mov	DWORD PTR 24[rdx], eax
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	mov	rdi, rax
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC49[rip]
	mov	rdx, QWORD PTR -24[rax]
	add	rdx, rdi
	mov	eax, DWORD PTR 24[rdx]
	mov	QWORD PTR 8[rdx], 3
	and	eax, -261
	or	ah, 1
	mov	DWORD PTR 24[rdx], eax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	jmp	.L617
.L629:
	mov	DWORD PTR -424[rbp], 600
.L576:
	cmp	r14d, 4
	jne	.L630
	vmovsd	xmm3, QWORD PTR .LC32[rip]
	xor	r13d, r13d
	mov	DWORD PTR -404[rbp], r13d
	vmovsd	QWORD PTR -416[rbp], xmm3
	jmp	.L575
.L675:
	vzeroupper
	jmp	.L597
.L630:
	vmovsd	xmm4, QWORD PTR .LC33[rip]
	vmovsd	QWORD PTR -416[rbp], xmm4
.L678:
	xor	ebx, ebx
	mov	DWORD PTR -404[rbp], ebx
	jmp	.L575
.L602:
	xor	edx, edx
	xor	r14d, r14d
	mov	QWORD PTR -80[rbp], rdx
	mov	QWORD PTR -64[rbp], rdx
	jmp	.L606
.L634:
	xor	eax, eax
	xor	esi, esi
	jmp	.L588
.L605:
	jne	.L606
	vmovsd	xmm0, QWORD PTR [r12]
	vmovsd	QWORD PTR [rax], xmm0
	jmp	.L606
.L685:
	vzeroupper
	jmp	.L594
.L686:
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	jne	.L674
	lea	rax, -144[rbp]
	mov	QWORD PTR -424[rbp], rax
	call	_ZSt28__throw_bad_array_new_lengthv@PLT
.LEHE29:
.L674:
	call	__stack_chk_fail@PLT
.L684:
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	jne	.L674
	lea	rdi, .LC4[rip]
.LEHB30:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE30:
.L642:
	endbr64
	mov	rbx, rax
	vzeroupper
	jmp	.L623
.L645:
	endbr64
	mov	r12, rax
	jmp	.L620
.L643:
	endbr64
	mov	rbx, rax
	vzeroupper
	jmp	.L622
.L644:
	endbr64
	mov	rbx, rax
	vzeroupper
	jmp	.L621
.L641:
	endbr64
	mov	rbx, rax
	vzeroupper
	jmp	.L624
.L640:
	endbr64
	mov	rbx, rax
	vzeroupper
	jmp	.L625
	.section	.gcc_except_table
.LLSDA3662:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3662-.LLSDACSB3662
.LLSDACSB3662:
	.uleb128 .LEHB20-.LFB3662
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L640-.LFB3662
	.uleb128 0
	.uleb128 .LEHB21-.LFB3662
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L641-.LFB3662
	.uleb128 0
	.uleb128 .LEHB22-.LFB3662
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L642-.LFB3662
	.uleb128 0
	.uleb128 .LEHB23-.LFB3662
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L643-.LFB3662
	.uleb128 0
	.uleb128 .LEHB24-.LFB3662
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L644-.LFB3662
	.uleb128 0
	.uleb128 .LEHB25-.LFB3662
	.uleb128 .LEHE25-.LEHB25
	.uleb128 .L645-.LFB3662
	.uleb128 0
	.uleb128 .LEHB26-.LFB3662
	.uleb128 .LEHE26-.LEHB26
	.uleb128 .L644-.LFB3662
	.uleb128 0
	.uleb128 .LEHB27-.LFB3662
	.uleb128 .LEHE27-.LEHB27
	.uleb128 .L642-.LFB3662
	.uleb128 0
	.uleb128 .LEHB28-.LFB3662
	.uleb128 .LEHE28-.LEHB28
	.uleb128 .L641-.LFB3662
	.uleb128 0
	.uleb128 .LEHB29-.LFB3662
	.uleb128 .LEHE29-.LEHB29
	.uleb128 .L644-.LFB3662
	.uleb128 0
	.uleb128 .LEHB30-.LFB3662
	.uleb128 .LEHE30-.LEHB30
	.uleb128 .L642-.LFB3662
	.uleb128 0
.LLSDACSE3662:
	.section	.text.startup
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC3662
	.type	main.cold, @function
main.cold:
.LFSB3662:
.L620:
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	.cfi_escape 0x10,0x6,0x2,0x76,0
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	mov	rdi, rbx
	vzeroupper
	mov	rbx, r12
	call	_ZNSt6vectorIdSaIdEED1Ev
.L621:
	mov	rdi, QWORD PTR -504[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
	mov	rdi, QWORD PTR -424[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
	mov	rdi, QWORD PTR -480[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
.L622:
	lea	rdi, -208[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
.L623:
	mov	rdi, QWORD PTR -432[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
.L624:
	mov	rdi, QWORD PTR -400[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
.L625:
	mov	rdi, QWORD PTR -392[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
	mov	rdi, QWORD PTR -384[rbp]
	call	_ZNSt6vectorIdSaIdEED1Ev
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	jne	.L687
	mov	rdi, rbx
.LEHB31:
	call	_Unwind_Resume@PLT
.LEHE31:
.L687:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE3662:
	.section	.gcc_except_table
.LLSDAC3662:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC3662-.LLSDACSBC3662
.LLSDACSBC3662:
	.uleb128 .LEHB31-.LCOLDB61
	.uleb128 .LEHE31-.LEHB31
	.uleb128 0
	.uleb128 0
.LLSDACSEC3662:
	.section	.text.unlikely
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE61:
	.section	.text.startup
.LHOTE61:
	.local	_ZL7VERBOSE
	.comm	_ZL7VERBOSE,1,1
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.set	.LC3,.LC1
	.align 16
.LC5:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC6:
	.long	0
	.long	1073741824
	.long	0
	.long	1072693248
	.long	0
	.long	0
	.long	0
	.long	0
	.align 32
.LC7:
	.long	0
	.long	1072693248
	.long	0
	.long	1076101120
	.long	0
	.long	-1072431104
	.long	0
	.long	0
	.align 32
.LC8:
	.long	0
	.long	0
	.long	0
	.long	1072693248
	.long	0
	.long	-1072431104
	.long	0
	.long	1073741824
	.align 32
.LC9:
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1072693248
	.long	0
	.long	1074790400
	.align 32
.LC10:
	.long	0
	.long	-1072431104
	.long	0
	.long	-1071513600
	.long	0
	.long	-1070333952
	.long	0
	.long	-1069875200
	.set	.LC11,.LC6
	.set	.LC12,.LC7
	.set	.LC13,.LC7+16
	.set	.LC14,.LC7+8
	.set	.LC15,.LC10+8
	.set	.LC16,.LC10+16
	.set	.LC17,.LC9+24
	.set	.LC18,.LC10+24
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC19:
	.long	-1717986918
	.long	1073846681
	.align 8
.LC20:
	.long	1202590843
	.long	1065646817
	.align 8
.LC21:
	.long	-2036257893
	.long	1023837339
	.align 8
.LC32:
	.long	-350469331
	.long	1058682594
	.align 8
.LC33:
	.long	-640172613
	.long	1037794527
	.align 8
.LC36:
	.long	0
	.long	-1074790400
	.align 8
.LC38:
	.long	0
	.long	1093567616
	.align 8
.LC46:
	.long	-1
	.long	2146435071
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
