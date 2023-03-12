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

void printSubstitutionRoots(vector<vector<double>> a, vector<double> x, vector<double> b) {
	const double round_sign = 10000;
	cout << "\n---Roots Substitution---\n";
	for (int i = 0; i < x.size(); i++) {
		cout << "Root b" << i << " : ";
		double b_res = 0;
		for (int j = 0; j < a.size(); j++) {
			cout << a[i][j] << " * " << x[j] << (j != a.size() - 1 ? " + " : "");
			b_res += a[i][j] * x[j];
		}
		cout << " = "
			<< round(b_res * round_sign) / round_sign
			<< " expected " << round(b[i] * round_sign) / round_sign
			<< ".\n";
	}
}

vector<double> split_str(string inp) {
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
			getline(cin, inp);
			a.push_back(split_str(inp));
		}

		cout << "Enter b:" << endl;
		getline(cin, inp);
		b = split_str(inp);

		cout << "Enter epsilon: ";
		cin >> epsilon;
	}

	vector<double> x = seindel(a, b, epsilon);
	cout << "\n---Solution---\n";
	if (x.empty()) {
		cout << "SLAE solutions is empty.";
		return 0;
	};
	for (int i = 0; i < x.size(); i++)
	{
		cout << x[i] << " ";
	}
	cout << endl;
	printSubstitutionRoots(a, x, b);
	return 0;
}