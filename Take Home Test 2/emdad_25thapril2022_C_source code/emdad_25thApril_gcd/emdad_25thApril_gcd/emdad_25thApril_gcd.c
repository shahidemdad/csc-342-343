int gcd(int a, int b) {
	if (a == 0) {
		return b;
	}
	return gcd(b % a, a);
}

void main() {
	int a = 12;
	int b = 30;
	int gcd_result = gcd(a, b);
}