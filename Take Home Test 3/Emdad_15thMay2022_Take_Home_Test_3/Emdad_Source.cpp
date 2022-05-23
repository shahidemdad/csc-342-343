#include <iostream>
#include <algorithm>
#include <windows.h>
#include <vector>

using namespace std;

const int array_size = 4096; //array size {we will keep change it to 8,16,32,64,128,256,512,1024,2048,4096}
static float X[array_size];
static float Y[array_size];

float Emdad_DotProductPointer(float* arr1, float* arr2, const int size);
int main() {
	__int64 ctr1 = 0, ctr2 = 0, freq = 0;
	int acc = 0, i = 0;
	int d_prod = 0;
	double total_time = 0;

	for (int i = 0; i < array_size; i++) {
		X[i] = i / 2.0;
		Y[i] = i / 3.0;
	}

	for (int j = 0; j < 10; j++) {
		if (QueryPerformanceCounter((LARGE_INTEGER*)&ctr1) != 0) {
			d_prod = Emdad_DotProductPointer(&X[0], &Y[0], array_size);
			QueryPerformanceCounter((LARGE_INTEGER*)&ctr2);
			cout << "Start Value: " << ctr1 << endl;
			cout << "End Value: " << ctr2 << endl;

			QueryPerformanceFrequency((LARGE_INTEGER*)&freq);

			cout << "QueryPerformance minimum resolution: 1/" << freq << " seconds" << endl;
			cout << "Array size: " << array_size << endl << "Run number: " << j + 1 << "\nRunning Time: " << (ctr2 - ctr1) * 1.0 / freq << " seconds" << endl;
			total_time += (ctr2 - ctr1) * 1.0 / freq;
		}

		else {
			DWORD dwError = GetLastError();
			cout << "Error value = " << dwError << endl;
		}
	}

	cout << "Average time: " << (total_time / 10) << endl;

	cout << "---------" << endl;

	system("pause");
	return 0;
}