#include <iostream>
#include <vector>
#include <string>
#include <math.h>

using namespace std;

// Не понимаю, зачем тут считать глубину.
int S(int x, int n, int* memory, int depth = 0) {
	if (*memory < depth) *memory = depth;
	cout << "n: " << n << " ,depth: " << depth << " .\n";
	if (n == 0) {
		return x;
	}
	else if (n % 2 == 0) {
		return S(x, n - 1, memory, depth + 1) + 2;
	}
	else {
		return S(x, n - 1, memory, depth + 1) * 2;
	}
}

void main()
{
	int x, n;
	cin >> n >> x;
	int depth;
	int res = S(x, n, &depth);
	cout << res << "\ndepth: " << depth;
}