/**
 * 微分方程式の数値解法
 * オイラー法
 * ホイン法
 * ルンゲ・クッタ法
 * テイラー展開の値の取り方が変わる
 * 制度は昇順で高くなっていく。
 */

#include <stdio.h>
#include <math.h>
#include <sys/time.h>

double time1, time2; // 時間を測定するために使用

// 時間を返す
double gettimeofday_sec() {
  struct timeval tv;
  gettimeofday(&tv,NULL);
  return tv.tv_sec + tv.tv_usec * 1e-6;
}

// 方程式
// 1: y' = -y
// 2: y' = 3y/(1+x)

// 方程式の解を返す
double equation_val1(double x, double y) {
  return -1 * y;
}

double equation_val2(double x, double y) {
  return 3 * y / (1 + x);
}

// 方程式の初期値
void equation_start1(double *x, double *y) {
  *x = 1; *y = 1;
}

void equation_start2(double *x, double *y) {
  *x = 0; *y = 1;
}

// 方程式の本当の解
double equation_ans1(double x) {
  return exp(-x+1);
}

double equation_ans2(double x) {
  return pow(x+1, 3);
}

// 局所宣言
double euler(int minlange, int maxlange, int n, void (*start)(double*,double*),
		double (*val)(double,double), double (*ans)(double)); // オイラー法
double heun(int minlange, int maxlange, int n, void (*start)(double*,double*),
		double (*val)(double,double), double (*ans)(double)); // ホイン法
double runge_kutta(int minlange, int maxlange, int n, void (*start)(double*,double*),
		double (*val)(double,double), double (*ans)(double)); // ルンゲ・クッタ法

int main(void){
  int n;

  printf("n:"); scanf("%d", &n);
  puts("オイラー法");
  puts("1");
  euler(1,2,n,equation_start1,equation_val1, equation_ans1); // (1)オイラー法
  puts("2");
  euler(0,1,n,equation_start2,equation_val2, equation_ans2); // (2)オイラー法

  puts("ホイン法");
  puts("1");
  heun(1,2,n,equation_start1,equation_val1, equation_ans1); // (1)ホイン法
  puts("2");
  heun(0,1,n,equation_start2,equation_val2, equation_ans2); // (2)ホイン法

  puts("ルンゲ・クッタ法");
  puts("1");
  runge_kutta(1,2,n,equation_start1,equation_val1, equation_ans1); // (1)ルンゲ・クッタ法
  puts("2");
  runge_kutta(0,1,n,equation_start2,equation_val2, equation_ans2); // (2)ルンゲ・クッタ法
  return 0;
}

// オイラー法
double euler(int minlange, int maxlange, int n, void (*start)(double*,double*),
		double (*val)(double,double), double (*ans)(double)) {
  double h = (maxlange - minlange) / (double)n;
  int i;
  double oldx, oldy;

  time1 = gettimeofday_sec();
  start(&oldx, &oldy); // 初期値を決定
  printf("x:,%lf, y:,%lf,\n", oldx, oldy);
  // 数値計算
  for(i = 0; i < n; i++){
    oldy = oldy + h * val(oldx, oldy);
    oldx = oldx + h;
    printf("x:,%lf, y:,%lf, 相対誤差:,%lf\n", oldx, oldy, fabs(ans(oldx)-oldy)/oldy);
  }
  time2 = gettimeofday_sec();
  printf("処理時間:%lf\n",time2-time1);
}

// ホイン法
double heun(int minlange, int maxlange, int n, void (*start)(double*,double*),
		double (*val)(double,double), double (*ans)(double)) {
  double h = (maxlange - minlange) / (double)n;
  int i;
  double oldx, oldy;
  double k1, k2;

  time1 = gettimeofday_sec();
  start(&oldx, &oldy);
  printf("x:,%lf, y:,%lf,\n", oldx, oldy); // 初期値を決定
  // 数値計算
  for(i = 0; i < n; i++){
    k1 = h * val(oldx, oldy); k2 = h * val(oldx + h, oldy + k1);
    oldy = oldy + (k1 + k2) / 2;
    oldx = oldx + h;
    printf("x:,%lf, y:,%lf, 相対誤差:,%lf\n", oldx, oldy, fabs(ans(oldx)-oldy)/oldy);
  }
  time2 = gettimeofday_sec();
  printf("処理時間:%lf\n",time2-time1);
}

//ルンゲ・クッタ法
double runge_kutta(int minlange, int maxlange, int n, void (*start)(double*,double*),
			double (*val)(double,double), double (*ans)(double)) {
  double h = (maxlange - minlange) / (double)n;
  int i;
  double oldx, oldy;
  double k1, k2, k3, k4;

  time1 = gettimeofday_sec();
  start(&oldx, &oldy);
  printf("x:,%lf, y:,%lf,\n", oldx, oldy); // 初期値を決定
  // 数値計算
  for(i = 0; i < n; i++){
    k1 = h * val(oldx, oldy); k2 = h * val(oldx + h/2, oldy + k1/2);
    k3 = h * val(oldx + h/2, oldy + k2/2); k4 = h * val(oldx + h, oldy + k3);
    oldy = oldy + (k1 + 2*k2 + 2*k3 + k4) / 6;
    oldx = oldx + h;
    printf("x:,%lf, y:,%lf, 相対誤差:,%lf\n", oldx, oldy, fabs(ans(oldx)-oldy)/oldy);
  }
  time2 = gettimeofday_sec();
  printf("処理時間:%lf\n",time2-time1);
}
