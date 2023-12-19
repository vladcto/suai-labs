#include <iostream>
#include <vector>
#include <string>
#include <math.h>

using namespace std;

void main()
{
	string num_t;
	cin >> num_t;
	char del_symb;
	cin >> del_symb;

	for (int i = 0; i < num_t.length(); i++) {
		if (num_t[i] == del_symb) {
			num_t = num_t.erase(i, 1);
			i -= 1;
		}
	}

	if (num_t.empty()) {
		cout << 0;
	}
	else {
		cout << num_t;
	}
}