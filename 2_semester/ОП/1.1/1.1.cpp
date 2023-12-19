#include <iostream>
#include <vector>
#include <string>
#include <math.h>

using namespace std;

vector<string> splitBy(string input, char sep) {
	vector<string> res;
	string word = "";
	for (int i = 0; i < input.length(); i++) {
		if (input[i] == sep) {
			res.push_back(word);
			word = "";
		}
		else {
			word += input[i];
		}
	}
	if (!word.empty()) res.push_back(word);
	return res;
}

struct Point { int x, y; };

bool isosceles(Point p1, Point p2, Point p3) {
	float dist1 = pow(p2.x - p1.x, 2) + pow(p2.y - p1.y, 2);
	float dist2 = pow(p3.x - p2.x, 2) + pow(p3.y - p2.y, 2);
	float dist3 = pow(p3.x - p1.x, 2) + pow(p3.y - p1.y, 2);
	return dist1 == dist2 || dist2 == dist3 || dist3 == dist1;
}

void main()
{
	string input;
	Point points[4];
	for (int i = 0; i < 4; i++) {
		cin >> input;
		vector<string> coord_t = splitBy(input, ',');
		points[i] = Point{ stoi(coord_t[0]), stoi(coord_t[1]) };
	}
	if (isosceles(points[0], points[1], points[2]) &&
		isosceles(points[1], points[2], points[3]) &&
		isosceles(points[0], points[2], points[3]) &&
		isosceles(points[0], points[1], points[3])) {
		cout << "true";
	}
	else {
		cout << "false";
	}
}