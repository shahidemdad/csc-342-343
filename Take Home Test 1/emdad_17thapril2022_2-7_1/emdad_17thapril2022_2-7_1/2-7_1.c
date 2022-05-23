#include <stdio.h>

int main() {
	static int a = 5;
	static int b = 10;
	static int save[100];

	save[5] = 10;
	save[6] = 10;
}