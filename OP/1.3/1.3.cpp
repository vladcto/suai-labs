#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <set>
#include <math.h>

using namespace std;
// D:\Projects\SUAI\OP_1\tmp\input.txt

vector<string> splitBy(string input, char sep) {
    vector<string> res;
    long nextWordIndex = 0;
    for (int i = 0; i < input.length(); i++) {
        if (input[i] == sep) {
            if (i != nextWordIndex)
                res.push_back(input.substr(nextWordIndex, i - nextWordIndex));
            nextWordIndex = i + 1;
        }
    }
    if (nextWordIndex < input.length())
        res.push_back(input.substr(nextWordIndex));
    return res;
}

bool isSimple(int num) {
    for (int i = 2; i <= sqrt(num) + 1; i++) {
        if (num % i == 0) return false;
    }
    return true;
}

int main()
{
    string path;
    cin >> path;
    ifstream inputFile(path);
    string text;
    inputFile >> text;
    inputFile >> text;
    vector<string> inpArray = splitBy(text, ',');
    set<string> res = set<string>();
    for (int i = 0; i < inpArray.size(); i++)
    {
        if (isSimple(stoi(inpArray[i]))) {
            cout << inpArray[i];
            res.insert(inpArray[i]);
        }
    }

    ofstream resFile("results.txt");
    set<string>::iterator pi;
    resFile << res.size() << '\n';
    for (pi = res.begin(); pi != res.end(); pi++) {
        resFile << *pi << " ";
    }
}