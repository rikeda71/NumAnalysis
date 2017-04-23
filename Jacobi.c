#include <stdio.h>
#include <math.h>

int main(void){
  int i;
  int A[3][3] = {5,2,1,
                 1,4,2,
                 2,1,4};
  int b[3] = {17,16,11};
  double now_x[3] = {0,0,0}; //現在の解候補
  double new_x[3]; //次の解候補
  double ans[3] = {2,3,1}; //実際の解
  double ek; //収束判定
  int count = 0; //計算回数のカウント用

  //ヤコビ法による解の近似導出
  while(1){
    count++; //計算回数の加算
    //新しい解候補の導出
    new_x[0] = (b[0] - (A[0][1]*now_x[1] + A[0][2]*now_x[2])) / A[0][0];
    new_x[1] = (b[1] - (A[1][0]*now_x[0] + A[1][2]*now_x[2])) / A[1][1];
    new_x[2] = (b[2] - (A[2][0]*now_x[0] + A[2][1]*now_x[1])) / A[2][2];
    //収束させていいか判定
    ek = fabs(new_x[0]-ans[0]) + fabs(new_x[1]-ans[1]) + fabs(new_x[2]-ans[2]);
    //収束判定
    if(ek <= 0.001){
      break;
    }
    for(i=0;i<3;i++){
      now_x[i] = new_x[i]; //現在の解の更新
    }
  }

  puts("ヤコビ法による解の近似導出");
  printf("x1:%lf,x2:%lf,x3:%lf\n計算回数:%d\n",new_x[0],new_x[1],new_x[2],count);
  return 0;
}
