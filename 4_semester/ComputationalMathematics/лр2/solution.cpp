#include <iostream>
#include <cmath>
#include <vector>
#include <string>

using namespace std;

bool convergence(vector<vector<double>> a) {
	if (a.size() != a[0].size()) return false;
	double sum = 0;
	for (int i = 0; i < a.size(); i++) {
		for (int j = 0; j < a.size(); j++) {
			if (i == j) continue;
			sum += abs(a[i][j]);
		}
		if (abs(a[i][i]) > sum) return true;
		sum = 0;
	}
	return false;
}

vector<double> seindel(vector<vector<double>> a,
	vector<double> b,
	double epsilon) {
	if (!convergence(a)) {
		cout << "SLAE does not converge.";
		return vector<double>();
	}

	vector<double> x(a.size(), 0), prev_x = x;
	int iteration = 1;
	double error = epsilon + 1;

	while (error >= epsilon)
	{
		// Seindel method.
		for (int i = 0; i < a.size(); i++)
		{
			prev_x[i] = x[i];
			double sum = 0;
			for (int j = 0; j < a.size(); j++)
			{
				if (j != i)
				{
					sum += a[i][j] * x[j];
				}
			}
			x[i] = (b[i] - sum) / a[i][i];
		}

		// Calculate error.
		error = 0;
		for (int i = 0; i < a.size(); i++)
		{
			error += abs(x[i] - prev_x[i]);
		}

		cout << iteration++ << ": " << error << endl;
	}

	return x;
}

vector<double> split_s(string inp) {
	vector<double> res;
	string token = "";
	inp += " ";
	for (int i = 0; i < inp.size(); i++) {
		if (inp[i] == ' ') {
			res.push_back(stod(token));
			token.clear();
		}
		else {
			token += inp[i];
		}
	}
	return res;
}

int main()
{
	vector<vector<double>> a;
	vector<double> b;
	double epsilon;

	//User data input.
	{
		double size;
		string inp;
		cout << "Enter size: ";
		cin >> size;

		cout << "Enter matrix: " << endl;
		getline(cin, inp);
		for (int i = 0; i < size; i++) {
			cout << i << " : ";
			getline(cin, inp);
			a.push_back(split_s(inp));
		}

		cout << "Enter b:" << endl;
		getline(cin, inp);
		b = split_s(inp);

		cout << "Enter epsilon: ";
		cin >> epsilon;
	}

	vector<double> x = seindel(a, b, epsilon);
	if (x.empty()) { 
		cout << "SLAE solutions is empty.";
		return 0;
	}
	cout << "Solution: ";
	for (int i = 0; i < 4; i++)
	{
		cout << x[i] << " ";
	}
	cout << endl;

	return 0;
}