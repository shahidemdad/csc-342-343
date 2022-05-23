float Emdad_DotProductPointer(float* arr1, float* arr2, int size) {
	float sum = 0.0;
	float* a, * b;

	for (a = &arr1[0], b = &arr2[0]; a < &arr1[size]; a++, b++)
		sum += ((*a) * (*b));
	return sum;
}