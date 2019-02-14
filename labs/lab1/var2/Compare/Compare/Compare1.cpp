#include <fstream>
#include <iostream>
#include <string>

using namespace std;
int main()
{
	// Считывание информации из файлов
	string file1, file2, s1, s2;
	cin >> file1 >> file2;
	ifstream i1(file1), i2(file2);
	if (!i1 || !i2)
	{
		cout << "\"File not found\"";
		return 1;
	}
	// Обработка и вывод результата сравнения
	int m = 0;
	while (!i1.eof() && !i2.eof())
	{
		getline(i1, s1);
		getline(i2, s2);
		n++;
		//проверка строк на равность
		if (s1 != s2)
		{
			cout << "\"Files are different. Line number is " << n << "\"";
			return 1;
		}
		//проверка на то что один из файлов закончился
		if ((i1.eof() == 0 && i2.eof() != 0) || (i2.eof() == 0 && i1.eof() != 0))
		{
			n++;
			cout << "\"Files are different. Line number is " << n << "\"";
			return 1;
		}
	}
	cout << "\"Files are equal\"";
	return 0;
}
