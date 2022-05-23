; Listing generated by Microsoft (R) Optimizing Compiler Version 19.29.30142.1 

	TITLE	E:\CSC_342\Assignments\Take Home Test 3\Emdad_15thMay2022_Take_Home_Test_3\Debug\Emdad_DotProductPointer.obj
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB MSVCRTD
INCLUDELIB OLDNAMES

PUBLIC	?Emdad_DotProductPointer@@YAMPAM0H@Z		; Emdad_DotProductPointer

; Function compile flags: /Odtp /RTCsu /ZI
;	COMDAT ?Emdad_DotProductPointer@@YAMPAM0H@Z

_TEXT	SEGMENT
_b$ = -32						; size = 4
_a$ = -20						; size = 4
_sum$ = -8						; size = 4
_arr1$ = 8						; size = 4
_arr2$ = 12						; size = 4
_size$ = 16						; size = 4
?Emdad_DotProductPointer@@YAMPAM0H@Z PROC		; Emdad_DotProductPointer, COMDAT

; 1    : float Emdad_DotProductPointer(float* arr1, float* arr2, int size) {

	push	ebp
	mov	ebp, esp
	sub	esp, 228				; 000000e4H
	push	ebx
	push	esi
	push	edi
	
; 2    : 	float sum = 0.0;

	vmovss	DWORD PTR _sum$[ebp], xmm0

; 3    : 	float* a, * b;
; 4    : 
; 5    : 	for (a = &arr1[0], b = &arr2[0]; a < &arr1[size]; a++, b++)

	mov	eax, 4
	imul	ecx, eax, 0
	add	ecx, DWORD PTR _arr1$[ebp]
	mov	DWORD PTR _a$[ebp], ecx
	mov	edx, 4
	imul	eax, edx, 0
	add	eax, DWORD PTR _arr2$[ebp]
	mov	DWORD PTR _b$[ebp], eax
	jmp	SHORT $LN4@Emdad_DotP
$LN2@Emdad_DotP:
	mov	eax, DWORD PTR _a$[ebp]
	add	eax, 4
	mov	DWORD PTR _a$[ebp], eax
	mov	ecx, DWORD PTR _b$[ebp]
	add	ecx, 4
	mov	DWORD PTR _b$[ebp], ecx
$LN4@Emdad_DotP:
	mov	eax, DWORD PTR _size$[ebp]
	mov	ecx, DWORD PTR _arr1$[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	cmp	DWORD PTR _a$[ebp], edx
	jae	SHORT $LN3@Emdad_DotP

; 6    : 		sum += ((*a) * (*b));

	mov	eax, DWORD PTR _a$[ebp]
	mov	ecx, DWORD PTR _b$[ebp]
	vmovss	xmm0, DWORD PTR [eax]
	vmulss	xmm0, xmm0, DWORD PTR [ecx]
	vmovss	xmm1, DWORD PTR _sum$[ebp]
	vaddss	xmm0, xmm1, xmm0
	vmovss	DWORD PTR _sum$[ebp], xmm0
	jmp	SHORT $LN2@Emdad_DotP
$LN3@Emdad_DotP:

; 7    : 	return sum;

	fld	DWORD PTR _sum$[ebp]

; 8    : }

	pop	edi
	pop	esi
	pop	ebx
	add	esp, 228				; 000000e4H
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
?Emdad_DotProductPointer@@YAMPAM0H@Z ENDP		; Emdad_DotProductPointer
_TEXT	ENDS
END