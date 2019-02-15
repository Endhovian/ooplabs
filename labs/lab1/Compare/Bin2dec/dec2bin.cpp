#include <fstream>
#include <iostream>
#include <string>
#include <stdio.h>
using namespace std;
void main()
{
	int digit;
	cin >> digit;
	int i = 0;
	int digitT = digit;
	int rest = 1;
	//Определение числа разрядов
	while (digitT >= 1 && rest <= 1)
	{
		rest = digitT % 10;
		digitT = digitT / 10;
		i = i + 1;
	}
	int two = 1;
	int sum = 0;
	digitT = digit;
	if (rest > 1)
	{
		//Проверка на двоичность
		cout << "It's not two-position system!\n";
	}
	else
	{
		//Цикл выполняется, если число двоичное
		while (i > 0)
		{
			rest = digitT % 10;
			digitT = digitT / 10;
			sum = sum + rest * two;
			two = two * 2;
			i = i - 1;
		}
		//Вывод результатов
		cout << "Digits: \n"
			 << "2-p: " << digit << endl
			 << "10-p: " << sum << endl;
	}
	system("pause");
}