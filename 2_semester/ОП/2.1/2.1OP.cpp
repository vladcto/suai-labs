#include <iostream>
#include <vector>
#include <unordered_set>
#include<Windows.h>
using namespace std;

int main()
{
	setlocale(LC_ALL, "");
	SetConsoleCP(1251); 
	SetConsoleOutputCP(1251);
	unordered_set<char> vowels = unordered_set<char>{ 'а','и','е','ё','о','у','ы','э','ю','я' };

	cout << "Введите строку: ";
	vector<vector<char>> words = vector<vector<char>>();
	vector<char> word = vector<char>();
	bool spacePassed = true // Потенциально далее новое слово.
		, newWordCreating = false; // Слово следует занести в массив.
	char a;
	cin.get(a);
	cin.get(a);
	// Считываем поток до кавычек.
	while (a != '\"')
	{
		//Если разделитель, начинаем новое слово.
		if (a == ' ') {
			spacePassed = true;
			newWordCreating = false;
			if (!word.empty()) words.push_back(word);
			word.clear();
		}
		else {
			if (spacePassed && vowels.find(tolower(a)) != vowels.end()) {
				newWordCreating = true;
				word.push_back(a);
			}
			else if (newWordCreating) {
				word.push_back(a);
			}
			spacePassed = false;
		}
		cin.get(a);
	}
	// Вывод результата.
	if (!word.empty()) words.push_back(word);
	for (int i = 0; i < words.size(); i++) {
		for (int j = 0; j < words[i].size(); j++) {
			cout << words[i][j];
		}
		cout << " ";
	}
}