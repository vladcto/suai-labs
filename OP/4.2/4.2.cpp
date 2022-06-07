#include<iostream>
#include<unordered_set>
#include<vector>
#include<string>
#include<math.h>

// Ввод бойцов как N1 N2 N3 N4 : A , где N - номер скилла; A - зарплата

using namespace std;

struct Employer {
	unordered_set<int> skils; int salary;
};

int FullHave(vector<Employer> employers, int sampleNum, unordered_set<int> skils, int *salary) {
	unordered_set<int> sampleSkills;
	int i = -1;
	while(sampleNum > 0){
		int remainder = sampleNum % 2;
		i += 1;
		sampleNum /= 2;
		if (remainder == 0) continue;
		sampleSkills.insert(employers[i].skils.begin(), employers[i].skils.end());
		*salary += employers[i].salary;
	}
	return sampleSkills.size() - skils.size();
}

int main() {
	setlocale(LC_ALL,"Russian");
	int n;
	cout << "Введите количество бойцов: ";
	cin >> n;
	int maxSalary;
	cout << "Введите максимальную плату: ";
	cin >> maxSalary;
	int skilsCount;
	cout << "Введите количество скиллов: ";
	cin >> skilsCount;
	unordered_set<int> skils;
	for (int i = 1; i <= skilsCount; i++) {
		skils.insert(i);
	}

	vector<Employer> employers;
	for (int i = 0; i < n; i++) {
		cout << i+1 << " = ";
		employers.push_back(Employer());
		string skillText;
		cin >> skillText;
		while (skillText != ":")
		{
			employers[i].skils.insert(stoi(skillText));
			cin >> skillText;
		}
		
		int salaryEmpl;
		cin >> salaryEmpl;
		employers[i].salary = salaryEmpl;
	}

	int nowSample = 1;
	int resSample = 0, salarySample, skilsMax = -1 - skils.size();
	while (nowSample < pow(2,employers.size()))
	{
		if (FullHave(employers, nowSample, skils,&salarySample) > skilsMax) {
			if (salarySample < maxSalary) {
				resSample = nowSample;
				skilsMax = FullHave(employers, nowSample, skils, &salarySample);
			}
		}
		salarySample = 0;
		nowSample += 1;
	}

	cout << "Нужно взять бойцов:\n ";
	int tmpRes = resSample;
	for (int i = 1; tmpRes > 0; i++) {
		int remainder = tmpRes % 2;
		tmpRes /= 2;
		if (remainder == 1) {
			cout << i << " ";
		}
	}
}
