#include <iostream>
#include <math.h>
#include <ctime>
#include <cstdlib>

using namespace std;

void main()
{
	unsigned long num;
	cin >> num;
	int n;
	cout << "Indexes to delete: ";
	cin >> n;

	unsigned long mask = 0;
	for (int i = 0; i < n; i++) {
		int bit_to_null;
		cin >> bit_to_null;
		mask += 1 << bit_to_null;
	}
	mask = ~mask;

	num &= mask;
	cout << num;
}