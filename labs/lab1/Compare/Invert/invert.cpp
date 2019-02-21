#include <cassert>
#include <iostream>
using namespace std;
typedef double Matrix3x3[3][3];

void main()
{
	Matrix3x3 mat = {
		{ 3.0, 4.0, 8.0 },
		{ 2.4, -1.0, 11.0 },
		{ 7.0, -3.2, 0.0 },
	};
	cout << mat[0][0] << "\n";
	cout << mat[0][1] << "\n";
	cout << mat[0][2] << "\n";
	cout << mat[1][0] << "\n";
	cout << mat[1][1] << "\n";
	cout << mat[1][2] << "\n";
	cout << mat[2][0] << "\n";
	cout << mat[2][1] << "\n";
	cout << mat[2][2] << "\n";

}
int minor_a1 = (mat[1][1] * mat[2][2]) * (mat[2][1] * mat[1][2]) * mat[0][0];
