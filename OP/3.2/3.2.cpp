#include<iostream>
#include<vector>
#include<set>

using namespace std;

void sample(vector<int>* source, set<vector<int>>* res, vector<int> inp = vector<int>{}, int depth = 0) 
{
	vector<int> b;
	for (int i = 0; i <= inp.size(); i++) {
		b = inp; // копируем массив (копируется по значению)
		b.insert(b.begin() + i, source->at(depth));
		if (depth + 1 == source->size()) {
			res->insert(b);
		}
		else {
			sample(source, res, b, depth + 1);
		}
	}
}

int main()
{
	vector<int> a{ 1,1,1,1,1,6 };
	set<vector<int>> res;
	sample(&a, &res);
	set<vector<int>>::iterator iter;
	cout << res.size() << "\n";
	for (iter = res.begin(); iter != res.end(); iter++) {
		vector<int> now_vect = *iter;
		for (int i = 0; i < now_vect.size(); i++) {
			cout << now_vect[i] << " ";
		}
		cout << ". \n";
	}
 }