float Emdad_VDPPS_DotProductPointer(float* a, float* b, int i) {
	float x = 0.0;
	_asm {
		vxorps ymm3, ymm3, ymm3
		mov eax, dword ptr[a]
		mov ebx, dword ptr[b]
		mov ecx, i

		$mainloop:
		vmovups ymm0, [eax]
		vmovups ymm1, [ebx]
		vdpps ymm2, ymm0, ymm1, 0xFF
		vaddps ymm3, ymm2, ymm3

		add eax, 32
		add ebx, 32
		sub ecx, 8
		jnz $mainloop

		vperm2f128 ymm0, ymm3, ymm3, 1
		vaddps ymm3, ymm0, ymm3

		vextractI128 xmm3, ymm3, 1
		movss dword ptr[x], xmm3
	}
	return x;
}