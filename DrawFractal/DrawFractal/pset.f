/* pset.f */
#ifndef SLS_pset /* �d����`�h�~ */
#define SLS_pset /* �d����`�h�~�}�N�� */

#include <windows.h> /* HDC,SetPixelV */

void pset( /* �_�֐�  Point SETting function */
int x, /* x���W(0�`639�`)[dot] */
int y, /* y���W(0�`399�`)[dot] */
COLORREF c) /* �F�ԍ�(0�`7�`15) Color */
{
  extern HDC SLS_hdc; /* �\�����u�\���n���h��  Handle of Device Context */

  SetPixelV(SLS_hdc,x,y,c); /* �_��ł� */
} /* pset */


#endif /* SLS_pset */
