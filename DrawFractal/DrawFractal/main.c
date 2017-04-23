#include <Windows.h>
#include "Header.h"

void Cal_f(double f[2], double x, double y); //f���v�Z
void Cal_ff(double ff[2][2], double x, double y); //f'���v�Z
void InverseM(double matrix[2][2], double oldMatrix[2][2]); //�s����t�s��ɂ���
void MultiM(double ff[2][2], double f[2], double ans[2]); //�s��̊|���Z(f'-1*f)
int ConvergenceTest(double x, double y, double e); //��������
int ConvergenceNearValue(complex *A, double x, double y, int length); //�ǂ̒l�Ɏ������Ă��邩����
void Draw(int i, int j, int ColorDecision); //�`��֐�
void Calculation(double *x0, double *y0, double *f, double **ff, double *ans, double *oldMatrix); //�v�Z���s��

int main(void) {
	double e = pow(10, -8); //臒l
	double x0, y0, x1, y1; //��
	double f[2], ff[2][2]; //f�͌��̕������̉�,ff�͕Δ��������l���i�[
	double ans[2]; //f'-1*f���i�[
	complex *A;//�������̉����i�[
	double oldMatrix[2][2]; // �s��̒l�̊i�[�p
	int count = 0; // �v�Z�񐔃J�E���g
	int length = 3; //�����̐�
	int i, j;

	//���̐ݒ�
	A = (complex*)malloc(sizeof(complex) * 3);
	A[0].real = -1; A[0].imaginary = 0;
	A[1].real = 0.5; A[1].imaginary = -0.866;
	A[2].real = 0.5; A[2].imaginary = 0.866;

	//�X�N���[���Ăяo��
	screen_int(width, height, RGB(255, 255, 255));
	
	//�`��
	for (i = 0; i < width; i++) {
		for (j = 0; j < height; j++) {
			//�����l�̌���
			x0 = i - width / 2;
			y0 = j - height / 2;
			while (1) {
				count++;
				//�s��̌v�Z
				Calculation(&x0, &y0, f, ff, ans, oldMatrix);
				//���̍X�V
				x1 = x0 + ans[0];
				y1 = y0 + ans[1];
				//�����𖞂����Ă���Ȃ烋�[�v���I����
				if (ConvergenceTest(ans[0], ans[1], e) || count == 100) { break; }
				x0 = x1;
				y0 = y1;
			}
			//�`��
			Draw(i,j,ConvergenceNearValue(A, x1,y1,length));
			count = 0;
		}
	}
	free(A);
}