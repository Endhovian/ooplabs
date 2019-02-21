#include <cstring>
#include <iostream>
#include <string>

using namespace std;
#define INT_BITS 32
int leftRotate(int n, unsigned int d)
{
	return (n << d) | (n >> (INT_BITS - d));
}

int rightRotate(int n, unsigned int d)
{
	return (n >> d) | (n << (INT_BITS - d));
}

int main(int argc, char* argv[])
{
	if (argc != 4)
	{
		cout << "Invalid arguments count\n"
			 << "Usage: rotatebyte.exe <byte> <number of bits> <L / R>\n";
		return 1;
	}
	int n = stoi(argv[1]), d = stoi(argv[2]);
	if (!strcmp(argv[3], "L"))
	{
		cout << leftRotate(n, d);
		return 0;
	}
	if (!strcmp(argv[3], "R"))
	{
		cout << rightRotate(n, d);
		return 0;
	}
	cout << "Invalid arguments\n"
		 << "Usage: rotatebyte.exe <byte> <number of bits> <L / R>\n";
	return 1;
}
