#include <iostream> 
#include <cmath> 
#include <functional>

using namespace std;

double dichotomy(std::function<double(double)> f ,double a, double b, double epsilon) {
	double c;
	int step = 0;
	cout << "Начало нахождения решения методом половинного деления." << endl;
	while (abs(a - b) > epsilon) {
		c = (a + b) / 2;
		cout << "Шаг " << step++ << ": f(" << c << ") = " << f(c) << endl;
		if (f(c) == 0) return c;
		f(a)* f(c) < 0 ? b = c : a = c;
	}
	return (a + b) / 2;
}

int main() {
	setlocale(LC_ALL, "RUS");
	double start, end, epsilon, a , b;
	
	cout << "Для уравнения f(x) = sqrt(a - x * x) + b * x * x введите," << endl;
	cout << "a = ";
	cin >> a;
	cout << "b = ";
	cin >> b;
	auto fx = [&](double x) {
		return sqrt(a - x * x) + b * x * x;
	};

	cout << "Введите начало промежутка: ";
	cin >> start;
	cout << "Введите конец промежутка: ";
	cin >> end;
	cout << "Введите точность: ";
	cin >> epsilon;
	cout << "Решением является: " << dichotomy(fx, start, end, epsilon) << endl;
	return 0;
}
