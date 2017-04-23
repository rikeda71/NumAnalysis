//ニュートン法で非線形方程式を導出する方法
//教科書p45　問題2.6

#include <stdio.h>
#include <math.h>

double differential_value(double x); //微分された方程式の値を返す
double equation_value(double x); //方程式の値を返す

int main(void){
  double x0; //初期値
  double xk1; //次の値
  double xk; //現在の値
  double xk_1; //1つ前の値
  double e = 0.0001; //閾値
  int i=0;

  printf("初期値を入力して下さい:"); scanf("%lf",&x0);
  xk = x0; //初期値を設定
  while(1){
      i++; //計算回数を加算
      //値の判定
      if(fabs(differential_value(xk)) < e) {
        printf("値が発散します。初期値を変更してください\n");
        printf("1\n解の近似値:%.5f\n計算回数:%d\n",xk1,i);
        return -1;
      }
      //新しい値の計算
      xk1 = xk - equation_value(xk)/differential_value(xk);
      if(fabs(xk1 - xk) <= e){
        printf("解の近似値:%.5f\n計算回数:%d\n",xk1,i);
        return 0;
      }
      else if(fabs(xk1 - xk) > fabs(xk - xk_1) && i > 1){
        printf("値が発散します。初期値を変更してください\n");
        printf("2\n解の近似値:%.5f\n計算回数:%d\n",xk1,i);
        return -1;
      }
      else {
        printf("xk:%lf,xk-xk_1:%lf\n",xk1,fabs(xk1-xk));
        xk_1 = xk;
        xk = xk1;
      }
  }
}

double differential_value(double x){
  return 2*x - 2;
}

double equation_value(double x){
  return x*x - 2*x - 1;
}
