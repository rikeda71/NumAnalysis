#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void Gauth_delete(float matrix[][4], int n);
float sigma_val(float *xk, int length, int index);
float return_ans(float *xk, float *fk, int length, int xk_index);
void insert_val_matrix1(float matrix1[2][4], float *xk, float *fk, int length);
void insert_val_matrix2(float matrix2[3][4], float *xk, float *fk, int length);

int main(void)
{
  int i,j,k;
  int n;
  // 一次式 関数の都合上、1次式の列も4と定義している
  float matrix1[2][4], matrix2[3][4];
  float store = 0,store_matrix; //storeは条件分岐用、store_matrixは配列の値の一時格納用
  int once_i;
  float xk[] = { 0.5, 1.0, 1.5, 2.0 };
  float fk[] = { 0.125, 1.0, 3.375, 8.0};

  puts("insert");
  //行列に値を挿入していく
  insert_val_matrix1(matrix1, xk, fk, sizeof(xk) / sizeof(xk[0]));
  insert_val_matrix2(matrix2, xk, fk, sizeof(xk) / sizeof(xk[0]));

  puts("gauss_delete");
  // ガウスの消去法による導出
  Gauth_delete(matrix1,2);
  Gauth_delete(matrix2,3);

  puts("答え");
  // 一次式の答え
  printf("一次式:%f + %fx\n",matrix1[0][2],matrix1[1][2]);
  printf("二次式:%f + %fx + %fx^2\n",matrix2[0][3], matrix2[1][3], matrix2[2][3]);

  return 0;
}

void Gauth_delete(float matrix[][4], int n){
  int i, j, k;
  int once_i;
  float store, store_matrix; //一時的に値を保持する関数

  //ピボット操作
  for(i=0;i<n;i++){
    store = matrix[i][i];
    once_i = i;
    //その列での最大値を探す
    for(j=i;j<n;j++){
      if(store < matrix[j][i]){
        store = matrix[j][i];
        once_i = j;
      }
    }

    //入れ替え作業
    for(j=0;j<n+1;j++){
      store_matrix = matrix[i][j];
      matrix[i][j] = matrix[once_i][j];
      matrix[once_i][j] = store_matrix;
    }

    //参照した位置を1にして残りを参照した位置で割る作業
    for(j=0;j<n+1;j++){
      matrix[i][j] /= store;
    }

    //残りの列をすべて0にする作業
    for(j=0;j<n;j++){
      store = matrix[j][i];
      for(k=0;k<n+1;k++){
          if(i!=j){ matrix[j][k] -= matrix[i][k] * store; }
      }
    }
  }
}
// 要素の合計を返す lengthは要素の数 indexは指数
float sigma_val(float *xk, int length, int index){
  int i;
  float sum = 0;
  for(i=0;i<length;i++){
    sum += pow(xk[i],index);
  }
  return sum;
}

float return_ans(float *xk, float *fk, int length, int xk_index){
  int i;
  float sum = 0;
  for(i=0;i<length;i++){
    sum += pow(xk[i],xk_index) * fk[i];
  }
  return sum;
}

// a+bx = ?の式の値を代入する
void insert_val_matrix1(float matrix1[2][4], float *xk, float *fk, int length){
  matrix1[0][0] = length;
  matrix1[0][1] = sigma_val(xk, length, 1);
  matrix1[0][2] = return_ans(xk, fk, length, 0);
  matrix1[1][0] = matrix1[0][1];
  matrix1[1][1] = sigma_val(xk, length, 2);
  matrix1[1][2] = return_ans(xk,fk,length,1);
}

void insert_val_matrix2(float matrix2[3][4], float *xk, float *fk, int length){
  matrix2[0][0] = length;
  matrix2[0][1] = sigma_val(xk, length, 1);
  matrix2[0][2] = sigma_val(xk, length, 2);
  matrix2[0][3] = return_ans(xk, fk, length, 0);
  matrix2[1][0] = matrix2[0][1];
  matrix2[1][1] = matrix2[0][2];
  matrix2[1][2] = sigma_val(xk, length, 3);
  matrix2[1][3] = return_ans(xk,fk,length,1);
  matrix2[2][0] = matrix2[1][1];
  matrix2[2][1] = matrix2[1][2];
  matrix2[2][2] = sigma_val(xk,length, 4);
  matrix2[2][3] = return_ans(xk,fk,length,2);
}
