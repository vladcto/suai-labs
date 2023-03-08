#include <iostream>
#include <cmath>
#include <vector>

using namespace std;

bool convergence(vector<vector<double>> a) {
	if (a.size() != a[0].size())
		return false;
	
	double diagonal_sum = 0;
	for (int i = 0; i < a.size(); i++) {
		for (int j = 0; j < a.size(); j++) {
			if (i == j) continue;
			diagonal_sum += abs(a[i][j]);
		}
		if (a[i][i] > diagonal_sum) return true;
		diagonal_sum = 0;
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

	vector<double> x(4, 0), prev_x = x;
	int iteration = 1;
	double error = epsilon + 1;

	while (iteration < 20)
	{
		for (int i = 0; i < 4; i++)
		{
			prev_x[i] = x[i];
			double sum = 0;
			for (int j = 0; j < 4; j++)
			{
				if (j != i)
				{
					sum += a[i][j] * x[j];
				}
			}
			x[i] = (b[i] - sum) / a[i][i];
		}

		error = 0;
		for (int i = 0; i < 4; i++)
		{
			error += abs(x[i] - prev_x[i]);
		}

		cout << iteration++ << ": " << error << endl;

	}

	return x;
}

int main()
{
	double a[4][4] = { {29, 6, 3, 8},
					   {4, 26, 7, 4},
					   {2, 3, 25, 3},
					   {4, 8, 3, 27} };
	double b[4] = { 3, 1, 4, 2 };
	double epsilon = 0.0001;

	vector<double> b_out = vector<double>(begin(b), end(b));
	vector<vector<double>> a_out = vector<vector<double>>();
	for (int i = 0; i < 4; i++) {
		a_out.push_back(vector<double>(begin(a[i]), end(a[i])));
	}

	vector<double> x = seindel(a_out, b_out, epsilon);
	if (x.empty()) return 0;
	cout << "Solution: ";
	for (int i = 0; i < 4; i++)
	{
		cout << x[i] << " ";
	}
	cout << endl;

	return 0;
}