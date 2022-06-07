#include <iostream> 
#include <vector>
#include <string>
#include <algorithm>
#include <set>

using namespace std;

//Структуры, описывающая героя.
struct Champion {
	int stunAbillity;
	int stunCooldown;
	int splash;
	int damage;
	int hp;
	int stunedSecs = 0;
	int stunCooldownRemain = 0;
};

//Структуры для компоновки победных чемпионов и их результатов.
//не связана никак с ареной.
struct MyFightResult {
	vector<int> championIndexes;
	int fightSecs;
	float hpLeft;
};

//Класс в котором симулируется сражение.
class Arena {
private:
	vector<Champion> enemyTeam, alliesTeam;

	//Чемпионы команды, чей сейчас ход, выполняют свои действия.
	void TeamAttack(bool enemyTurn) {
		vector<Champion>& nowTeam = enemyTurn ? enemyTeam : alliesTeam;
		for (int i = 0; i < nowTeam.size(); i++) {
			ChampionAction(i, enemyTurn);
		}
	}

	//Проверка состояния чемпиона, и его действия.
	void ChampionAction(int champIndex, bool enemyTurn) {
		Champion& myChampion = enemyTurn ? enemyTeam[champIndex] : alliesTeam[champIndex];
		//Перезаряка его способности.
		myChampion.stunCooldownRemain = max(myChampion.stunCooldownRemain - 1, 0);
		//Если герой в стане, уменьшаем его длительность и пропускаем все действия.
		if (myChampion.stunedSecs > 0) {
			myChampion.stunedSecs -= 1;
			return;
		}

		//Действия героя.
		vector<Champion>& opositTeam = enemyTurn ? alliesTeam : enemyTeam;
		//Станим героем.
		if (myChampion.stunAbillity > 0 && myChampion.stunCooldownRemain <= 0) {
			opositTeam[0].stunedSecs = max(opositTeam[0].stunedSecs, myChampion.stunAbillity);
			myChampion.stunCooldownRemain = myChampion.stunCooldown;
		}
		//Атакуем.
		for (int i = 0; i < myChampion.splash && i < opositTeam.size(); i++) {
			opositTeam[i].hp -= myChampion.damage;
			//Если герой сдох, то убираем его из команды.
			if (opositTeam[i].hp <= 0) {
				opositTeam.erase(opositTeam.begin() + i);
				i--;
			}
		}
	}

	//Подсчитать количество ХП команды.
	int CountHp(bool countEnemy) {
		int res = 0;
		vector<Champion> myTeam = countEnemy ? enemyTeam : alliesTeam;
		for (int i = 0; i < myTeam.size(); i++) {
			res += myTeam[i].hp;
		}
		return res;
	}

public:
	void SetTeam(vector<Champion> team, bool enemy) {
		//Отсортировать команду так, чтоб первыми были те
		//у кого больше дамаг.
		sort(team.begin(), team.end(),
			[](Champion f, Champion s) {return f.damage > s.damage; });
		if (enemy) {
			enemyTeam = team;
		}
		else {
			alliesTeam = team;
		}
	}

	//Симулирование сражения команды.
	//Если выйграют союзниник,вернет время сражения
	//иначе -1.
	int FightTeams(float* hpLeft) {
		float hpBeginAlies = CountHp(false);
		int secondsFight = 0;
		bool enemyTurn = true; //может сделать случайным... или через аргумент передавать...

		//Сражение, пока одна из команд не проиграет.
		while (enemyTeam.size() != 0 && alliesTeam.size() != 0) {
			TeamAttack(enemyTurn);
			enemyTurn ^= true; // меняем ход
			TeamAttack(enemyTurn);
			enemyTurn ^= true; // меняем ход
			secondsFight += 1;
		}

		if (enemyTeam.size() == 0) {
			*hpLeft = CountHp(false) / hpBeginAlies;
			return secondsFight;
		}
		else {
			*hpLeft = -1;
			return -1;
		}
	}
};

//Метод-шаблон для красивого запроса данных у юзера.
template<typename T>
T RequestInput(string message) {
	T data;
	cout << message;
	cin >> data;
	return data;
}

Champion InputChampion() {
	int stunAbillity = RequestInput<int>("Введите продолжительность стана: ");
	int stunCooldown = stunAbillity > 0 ? RequestInput<int>("Введите кд стана: ") : 0;
	int splash = RequestInput<int>("Введите сплеш: ");
	int damage = RequestInput<int>("Введите дамаг: ");
	int hp = RequestInput<int>("Введите хп: ");

	Champion champ{ stunAbillity,stunCooldown,splash,
		damage,hp };
	return champ;
}

void PrintVector(const vector<int> inp) {
	for (int i = 0; i < inp.size(); i++) {
		cout << inp[i] << " ";
	}
}

//Создать вектор чемпионов на indexes вектора чемпионов source.
vector<Champion> ChampionsFromIndex(vector<int> indexes, const vector<Champion> source) {
	vector<Champion> res;
	for (int i = 0; i < indexes.size(); i++) {
		res.push_back(source[indexes[i]]);
	}
	return res;
}

int main() {
	setlocale(LC_ALL, "Russian");

	//Ввод чемпионов.
	vector<Champion> champions;
	int championsCount = RequestInput<int>("Введите количество чемпионов = ");
	for (int i = 0; i < championsCount; i++) {
		cout << i << " герой:\n ";
		champions.push_back(InputChampion());
		cout << "\n";
	}

	//Ввод команды противника.
	vector<Champion> enemyChampions;
	set<int> enemyChampIndex;
	int enemysChempCount = RequestInput<int>("Введите количество чемпионов = ");
	cout << "Введите индексы чемпионов противника через пробел = ";
	for (int i = 0; i < enemysChempCount; i++) {
		int champIndex;
		cin >> champIndex;
		enemyChampIndex.insert(champIndex);
		enemyChampions.push_back(champions[champIndex]);
	}

	Arena arena;
	// маска из лидирующий 0 и младших единиц, для отображения перестановок всех возм. команд размером enemysChempCount.
	string bitmask(enemysChempCount, 1);
	bitmask.resize(champions.size(), 0);
	bool unical; // не был использован чемпион из вражеской команды.
	vector<int> aliesIndex; // индексы чемпионов будущей команды.
	vector<MyFightResult> results;
	do {
		unical = true;
		aliesIndex.clear();
		//вытаскиваем из битовой маски индексы чемпионов
		for (int i = 0; i < champions.size(); i++)
		{
			if (bitmask[i]) {
				//если был уже использован чемпион - завершаем цикл.
				if (enemyChampIndex.find(i) != enemyChampIndex.end()) {
					unical = false;
					break;
				}
				else {
					aliesIndex.push_back(i);
				}
			}
		}
		if (unical) {
			auto aliesTeam = ChampionsFromIndex(aliesIndex, champions);
			arena.SetTeam(enemyChampions, true);
			arena.SetTeam(aliesTeam, false);

			float hpLeft;
			int fightSeconds = arena.FightTeams(&hpLeft);
			//Если выйграла союзная команда.
			if (fightSeconds > 0) {
				results.push_back(MyFightResult{ aliesIndex,fightSeconds,hpLeft });
			}
		}
	} while (std::prev_permutation(bitmask.begin(), bitmask.end())); // следующая лексикографическая перестановка.
	// Надо бы память освободить, но она и так освобдится в конце выполнения.

	bool sortHp = RequestInput<bool>("Сортировать по хп? (0 - false , остальное - true): ");
	if (sortHp) {
		sort(results.begin(), results.end(),
			[](MyFightResult f, MyFightResult s) {return f.hpLeft > s.hpLeft; });
	}
	else {
		sort(results.begin(), results.end(),
			[](MyFightResult f, MyFightResult s) {return f.fightSecs > s.fightSecs; });
	}

	cout << "Результат: \n";
	for (int i = 0; i < results.size(); i++) {
		PrintVector(results[i].championIndexes);
		cout << ": " << (sortHp ? results[i].hpLeft : results[i].fightSecs) << "\n";
	}
}
