// 0.2 0.3 0.5 0.7 0.9 1.1 1.2
// 1.63 1.2 0.7 0.3 -0.3 -1.4 -1.36

#include <iostream>
#include <vector>

using namespace std;

double divided_diff(vector<double> x, vector<double> y, int i, int j) {
	if (i == j)
		return y[i];
	else
		return (divided_diff(x, y, i + 1, j) - divided_diff(x, y, i, j - 1)) / (x[j] - x[i]);
}

double newton_interpolation(vector<double> x, vector<double> y, double point) {
	double result = y[0];
	for (int i = 1; i < x.size(); i++) {
		double term = divided_diff(x, y, 0, i);
		for (int j = 0; j < i; j++)
			term *= (point - x[j]);
		result += term;
	}
	return result;
}

int main() {
	int n;
	vector<double> x, y;
	double temp;

	cout << "Enter number of data points: ";
	cin >> n;

	cout << "Enter x values separated by space: ";
	for (int i = 0; i < n; i++) {
		cin >> temp;
		x.push_back(temp);
	}

	cout << "Enter y values separated by space: ";
	for (int i = 0; i < n; i++) {
		cin >> temp;
		y.push_back(temp);
	}

	double steps;
	cout << "Interpolation steps: ";
	cin >> steps;
	cout << "Interpolated values:\n";
	cout << "x\tf(x)\n";
	for (double point = x[0]; point <= x.back(); point += (x.back() - x[0]) / steps) {
		cout << point << "\t" << newton_interpolation(x, y, point) << endl;
	}

	return 0;
}