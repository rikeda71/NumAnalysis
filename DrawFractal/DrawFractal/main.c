#include <Windows.h>
#include "Header.h"

void Cal_f(double f[2], double x, double y); //fを計算
void Cal_ff(double ff[2][2], double x, double y); //f'を計算
void InverseM(double matrix[2][2], double oldMatrix[2][2]); //行列を逆行列にする
void MultiM(double ff[2][2], double f[2], double ans[2]); //行列の掛け算(f'-1*f)
int ConvergenceTest(double x, double y, double e); //収束判定
int ConvergenceNearValue(complex *A, double x, double y, int length); //どの値に収束しているか判定
void Draw(int i, int j, int ColorDecision); //描画関数
void Calculation(double *x0, double *y0, double *f, double **ff, double *ans, double *oldMatrix); //計算を行う

int main(void) {
	double e = pow(10, -8); //閾値
	double x0, y0, x1, y1; //解
	double f[2], ff[2][2]; //fは元の方程式の解,ffは偏微分した値を格納
	double ans[2]; //f'-1*fを格納
	complex *A;//方程式の解を格納
	double oldMatrix[2][2]; // 行列の値の格納用
	int count = 0; // 計算回数カウント
	int length = 3; //答えの数
	int i, j;

	//解の設定
	A = (complex*)malloc(sizeof(complex) * 3);
	A[0].real = -1; A[0].imaginary = 0;
	A[1].real = 0.5; A[1].imaginary = -0.866;
	A[2].real = 0.5; A[2].imaginary = 0.866;

	//スクリーン呼び出し
	screen_int(width, height, RGB(255, 255, 255));
	
	//描画
	for (i = 0; i < width; i++) {
		for (j = 0; j < height; j++) {
			//初期値の決定
			x0 = i - width / 2;
			y0 = j - height / 2;
			while (1) {
				count++;
				//行列の計算
				Calculation(&x0, &y0, f, ff, ans, oldMatrix);
				//解の更新
				x1 = x0 + ans[0];
				y1 = y0 + ans[1];
				//条件を満たしているならループを終える
				if (ConvergenceTest(ans[0], ans[1], e) || count == 100) { break; }
				x0 = x1;
				y0 = y1;
			}
			//描画
			Draw(i,j,ConvergenceNearValue(A, x1,y1,length));
			count = 0;
		}
	}
	free(A);
}