/**
 * 積分の近似導出
 * 区分求積法
 * 複合台形法
 * 複合シンプソン法
 */

#include <stdio.h>
#include <math.h>
#include <time.h>
#include <sys/time.h>

#define ANSWER 0.69314748 // 答え
double start,end; // 時間を測定するために使用

double gettimeofday_sec(); // 時間を返す
double EquationVal(double x); // 方程式の解を返す
void ClassQuad(int n, int maxlange, int minlange); // 区分求積法
void ComposTrape(int n, int maxlange, int minlange); // 複合台形法
void ComposSimpson(int n, int maxlange, int minlange); // 複合シンプソン


int main(void) {
  int n;
  int maxlange=1; int minlange=0;
  // 分割数を代入
  printf("n="); scanf("%d",&n);
  // 各手法を実行。値と誤差を導出する
  ClassQuad(n, maxlange, minlange);
  ComposTrape(n, maxlange, minlange);
  ComposSimpson(n, maxlange, minlange);
  return 0;
}

// 時間を返す
double gettimeofday_sec() {
  struct timeval tv;
  gettimeofday(&tv,NULL);
  return tv.tv_sec + tv.tv_usec * 1e-6;
}

// 方程式の解を返す
// 方程式 integral 0 ~ 1 1/(1+x)dx
double EquationVal(double x) {
  return 1/(1+x);
}
// 区分求積法
void ClassQuad(int n, int maxlange, int minlange) {
  double x;
  double step = 1.0/n;
  double val = 0;
  
  puts("区分求積法");
  
  start = gettimeofday_sec();
  for (x = minlange; x <= maxlange; x += step) {
    val += EquationVal(x);
  }
  val /= n;
  end = gettimeofday_sec();
  
  printf("解:%lf 相対誤差:%lf 処理時間:%lf\n", val, fabs((ANSWER-val)/val), end-start);
  return;
}

// 複合台形法
void ComposTrape(int n, int maxlange, int minlange) {
  double h = (maxlange - minlange) / (double)n;
  double x;
  double val = 0;

  puts("複合台形法");
  
  start = gettimeofday_sec();
  for (x = minlange; x <= maxlange; x += h) {
    if(x == minlange || x == maxlange){ val += EquationVal(x); }
    else{ val += 2 * EquationVal(x); }
  }
  // 公式通りの式
  val *= (h/2);
  end = gettimeofday_sec();
  
  printf("解:%lf 相対誤差:%lf 処理時間:%lf\n", val, fabs((ANSWER-val)/val), end-start);
  return;
}

// 複合シンプソン
void ComposSimpson(int n, int maxlange, int minlange) {
  double h = (double)(maxlange - minlange) / (2.0 * n);
  double x = minlange;
  double val = 0;
  int i;

  puts("複合シンプソン");
  start = gettimeofday_sec();
  // 最初と最後の値を加算
  val += EquationVal(minlange) + EquationVal(maxlange);
  //それ以外の値を加算
  for (x = 1; x <= n; x++) {
    val += 4 * EquationVal(minlange + h*2*(x-1));
    if(x != n) { val += 2 * EquationVal(minlange + h*2*x); }
  }
  // 公式通りの式
  val *= (h/3);
  end = gettimeofday_sec();
  
  printf("解:%lf 相対誤差:%lf, 処理時間:%lf\n", val, fabs((ANSWER-val)/val), end-start);
  return;
}
