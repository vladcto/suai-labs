#include <iostream>
#include <math.h>
#include <ctime>
#include <cstdlib>

using namespace std;

struct Point { int x, y; };

unsigned long sqrDistance(Point p1, Point p2) {
	return pow(p1.x - p2.x, 2) + pow(p1.y - p2.y, 2);
}

Point* minDistanceBtw(Point* points, int n) {
	unsigned long sqr_dist = 0 - 1;
	unsigned long now_dist;
	int p1_index = 0, p2_index = 0;
	for (int i = 0; i < n - 1; i++) {
		for (int j = i + 1; j < n; j++) {
			now_dist = sqrDistance(points[i], points[j]);
			if (now_dist < sqr_dist) {
				sqr_dist = now_dist;
				p1_index = i;
				p2_index = j;
			}
		}
	}
	return new Point[]{ points[p1_index],points[p2_index] };
}

void main()
{
	int n;
	cin >> n;
	Point* points = new Point[n];
	for (int i = 0; i < n; i++) {
		int x, y;
		x = rand() % 5000 - 200;
		y = rand() % 5000 - 200;
		cout << "\n" << "p" << i << ": "
			<< x << " " << y;
		points[i] = Point{ x,y };
	}

	auto startTct = clock();
	Point* res = minDistanceBtw(points, n);
	auto end = clock();
	cout << "\n" << res[0].x << " " << res[0].y << " \n"
		<< res[1].x << " " << res[1].y;
	cout << "\nTime res: " << (end - startTct);
	delete[] res;
	delete[] points;
}