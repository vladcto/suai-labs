#include <iostream>
#include <cmath>

using namespace std;

double f(double x) {
    return sin(0.5 * x + 0.4) / (1.2 + cos(x*x + 0.4));
}

double trapezoidal(double a, double b, int n) {
    double h = (b - a) / n; 
    double sum = (f(a) + f(b)) / 2; 
    for (int i = 1; i < n; i++) {
        double x = a + i * h;
        sum += f(x); 
    }
    return h * sum;
}

int main() {
    cout << "Enter the interval boundary(a, b) and integration step(n) in the format : a b n\n";
    double a, b; 
    int n;
    cin >> a >> b >> n;
    double result = trapezoidal(a, b, n);
    cout << "Result: " << result << endl;
    return 0;
}