#include "screen_int.f"
#include "pset.f"
#include <math.h>
#include <stdbool.h>

//スクリーンサイズ
#define width 300
#define height 300

// 実数と虚数を考える
typedef struct {
	double real; //実数部
	double imaginary; //虚数部
}complex;

//虚数同士の掛け算
complex MulComplex(complex x, complex y) {
	complex z;
	z.real = x.real * y.real - x.imaginary * y.imaginary;
	z.imaginary = x.real * y.imaginary + y.real * x.imaginary;

	return z;
}

void Cal_f(double f[2], double x, double y) {
	f[0] = -(pow(x, 3) - 3 * x * pow(y, 2) + 1);
	f[1] = -(3 * pow(x, 2) * y - pow(y, 3));
}

void Cal_ff(double ff[2][2], double x, double y) {
	ff[0][0] = 3 * pow(x, 2) - 3 * pow(y, 2);
	ff[0][1] = -6 * x * y;
	ff[1][0] = 6 * x * y;
	ff[1][1] = 3 * pow(x, 2) - 3 * pow(y, 2);
}

void InverseM(double matrix[2][2], double oldMatrix[2][2]) {
	double denominator = matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0];
	int i, j;

	for (i = 0; i < 2; i++) {
		for (j = 0; j < 2; j++) {
			oldMatrix[j][i] = matrix[j][i];
		}
	}
	matrix[0][0] = oldMatrix[1][1] / denominator;
	matrix[0][1] = -1 * oldMatrix[0][1] / denominator;
	matrix[1][0] = -1 * oldMatrix[1][0] / denominator;
	matrix[1][1] = oldMatrix[0][0] / denominator;
}

void MultiM(double ff[2][2], double f[2], double ans[2]) {
	ans[0] = ff[0][0] * f[0] + ff[0][1] * f[1];
	ans[1] = ff[1][0] * f[0] + ff[1][1] * f[1];
}


int ConvergenceTest(double x, double y, double e) {
	//条件を満たしたら1
	//if (hypot(x,y) <= e) { return 1; }
	if (fabs(x) <= e && fabs(y) <= e) { return 1; }
	else { return 0; }
}

int ConvergenceNearValue(complex *A, double x, double y, int length) {
	int position = 0;
	int i;
	double distance; //収束判定用

	distance = fabs(A[0].real - x) + fabs(A[0].real - y);
	for (i = 1; i < length; i++) {
		if (distance > fabs(A[i].real - x) + fabs(A[i].imaginary - y)) {
			distance = fabs(A[i].real - x) + fabs(A[i].imaginary - y);
			position = i;
		}
	}
	// 収束した値の配列上の位置を返す
	return position;
}

void Draw(int i, int j, int ColorDecision) {
	if (ColorDecision == 0) {
		pset(i, j, RGB(255, 0, 0));
	}
	else if (ColorDecision == 1) {
		pset(i, j, RGB(0, 255, 0));
	}
	else if (ColorDecision == 2) {
		pset(i, j, RGB(0, 0, 255));
	}

}

void Calculation(double *x0, double *y0, double *f, double **ff, double *ans, double *oldMatrix) {
	//fの導出
	Cal_f(f, *x0, *y0);
	//f''-1の導出
	Cal_ff(ff, *x0, *y0);
	InverseM(ff, oldMatrix);
	//f''-1*f
	MultiM(ff, f, ans);
}