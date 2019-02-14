#include <fstream>
#include <iostream>
#include <string>

using namespace std;
int CompareFiles(const string& fileName1, const string& fileName2)
{
	string s1, s2;
	ifstream file1(fileName1), file2(fileName2);

	if (!file1.is_open())
	{
		cout << "Failed to open " << fileName1 << " for reading\n";
		return 1;
	}
	if (!file2.is_open())
	{
		cout << "Failed to open " << fileName2 << " for writing\n";
		return 1;
	}
	// Обработка и вывод результата сравнения
	if (!file1 || !file2)
	{
		cout << "File not found";
		return 1;
	}

	int n = 0;
	while (!file1.eof() && !file2.eof())
	{
		getline(file1, s1);
		getline(file2, s2);
		n++;
		//проверка строк на равность
		if (s1 != s2)
		{
			cout << "Files are different. Line number is " << n;
			return 1;
		}
		//проверка на то что один из файлов закончился
		if ((file1.eof() == 0 && file2.eof() != 0) || (file2.eof() == 0 && file1.eof() != 0))
		{
			n++;
			cout << "Files are different. Line number is " << n;
			return 1;
		}
	}
	cout << "Files are equal";
	return 0;
}

int main(int argc, char* argv[])
{
	if (argc != 3)
	{
		cout << "Invalid arguments count\n"
			 << "Usage: compare.exe <input file1> <input file2>\n";
		return 1;
	}
	string fileName1 = argv[1], fileName2 = argv[2];	
	CompareFiles(fileName1, fileName2);
	return 0;
}

