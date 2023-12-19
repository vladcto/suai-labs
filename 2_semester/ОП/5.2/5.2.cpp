#include <iostream>
#include <math.h>
#include <string>

using namespace std;

void print_binary(long n,int bits) {
	string res = "";
	while (bits > 0)
	{
		res = to_string(n % 2) + res; n /= 2; bits--;
	}
	cout << res << '\n';
}


void main(){
	int k, m, s;
	cin >> k >> m >> s;
	long first_seq = 0;
	for (int i = 0; i < k; i++)
		first_seq = first_seq | (long)pow(2, i);
	long second_seq = 1;
	for (int i = 0; i < 10 && first_seq > 0; i++) {
		print_binary(first_seq >> (k-s),s);
		for (int j = 0; j < pow(2, k - s); j++) {
			long first_seq_part = first_seq % (long)pow(2,m - s);
			long my_seq = (first_seq_part << (m-k)) + second_seq;
			print_binary(my_seq,m - s);
			first_seq -= 1;
			if (first_seq < 0)
				break;
		}
		cout << "\n";
	}
}