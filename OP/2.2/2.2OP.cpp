#include <iostream>
#include <vector>
#include <Windows.h>
#include <set>
#include <string> 
#include <map>
#include <math.h>

using namespace std;

int hashsum(string input, int P, int M) {
	int sum = 0;
	for (int i = 0; i <= input.size(); i++) {
		sum += input[i] * pow(P, i);
	}
	return sum % M;
}

string cutString(string input, set<int> indexesLeft) {
	string res = "";
	for (int i = 0; i < input.size(); i++) {
		if (indexesLeft.find(i) != indexesLeft.end()) {
			res += input[i];
		}
	}
	return res;
}

// Сочетания без повторений.
vector<set<int>> sample(int length) {
	vector<set<int>> res = vector<set<int>>();
	res.push_back(set<int>{-1});
	for (int i = 0; i < length; i++) {
		long startSize = res.size();
		for (int j = 0; j < startSize; j++) {
			set<int> newSet(res[j]);
			newSet.insert(i);
			res.push_back(newSet);
		}
	}
	return res;
}


int main()
{
	setlocale(LC_ALL, "");
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	string b;
	int P, M;
	cout << "S: ";
	cin >> b;
	cout << "P: ";
	cin >> P;
	cout << "M: ";
	cin >> M;
	vector<set<int>> samples = sample(b.size());
	map<int, vector<string>> dict = map<int, vector<string>>();

	/*
	set<int> ::iterator si;
	for (int i = 0; i < samples.size(); i++) {
		for (si = samples[i].begin(); si != samples[i].end(); si++) {
			cout << *si << " ";
		}
		cout<< "||" << cutString(b, samples[i]) << "\n";
	}
	*/

	//Добавляем в словарь обрезанные строки по их хеш-сумме.
	for (int i = 1; i < samples.size(); i++) {
		string cuttedStr = cutString(b, samples[i]);
		dict[hashsum(cuttedStr, P, M)].push_back(cuttedStr);
	}

	map<int, vector<string>> ::iterator ii;
	cout << "result: \n";
	bool twoHashes = false; // Было минимум два одинаковых хеша.
	for (ii = dict.begin(); ii != dict.end(); ii++) {
		if ((ii->second).size() < 2) continue;
		twoHashes = true;
		cout << "{" << ii->first << "}: "; // отображаем хеш.
		vector<string> strings = ii->second;
		for (int i = 0; i < strings.size(); i++) {
			cout << "\"" << strings[i] << "\" , "; // отображаем строку.
		}
		cout << "\n";
	}
	if (!twoHashes) {
		cout << "false";
	}
}
