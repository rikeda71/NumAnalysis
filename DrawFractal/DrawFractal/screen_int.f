/* getmscrx.f */
#ifndef SLS_get_max_screen_x /* �d����`�h�~ */
#define SLS_get_max_screen_x /* �d����`�h�~�}�N�� */

#include <windows.h> /* SM_CXSCREEN,GetSystemMetrics */


int get_max_screen_x(void) /* �ő���X�T�C�Y�֐�
                              GET MAX SCREEN X-size function */
/*
 * �ő���X�T�C�Y(640�`800�`1024�`1152�`1280�`1600�`)[dot]
 */
{
  return GetSystemMetrics(SM_CXSCREEN);
} /* get_max_screen_x */


#endif /* SLS_get_max_screen_x */


/* getmscry.f */
#ifndef SLS_get_max_screen_y /* �d����`�h�~ */
#define SLS_get_max_screen_y /* �d����`�h�~�}�N�� */

#include <windows.h> /* SM_CYSCREEN,GetSystemMetrics */


int get_max_screen_y(void) /* �ő���Y�T�C�Y�֐�
                              GET MAX SCREEN Y-size function */
/*
 * �ő���X�T�C�Y(400�`480�`600�`768�`864�`1024�`1200�`)[dot]
 */
{
  return GetSystemMetrics(SM_CYSCREEN);
} /* get_max_screen_y */


#endif /* SLS_get_max_screen_y */


/* getscrnx.f */
#ifndef SLS_getscreenx /* �d����`�h�~ */
#define SLS_getscreenx /* �d����`�h�~�}�N�� */

#include <windows.h> /* HWND,RECT,GetClientRect */


int getscreenx(void) /* ���݉��X�T�C�Y�֐�  Get ScReeN X-size function */
/*
 * ���X�T�C�Y(1�`640�`)[dot]
 */
{
  extern HWND SLS_hwnd; /* �E�B���h�E�E�n���h��  Handle of WiNDow */
  RECT d;
  GetClientRect(SLS_hwnd,&d); /* �`��̈���W */
  return d.right;
} /* getscreenx */


#endif /* SLS_getscreenx */


/* getscrny.f */
#ifndef SLS_getscreeny /* �d����`�h�~ */
#define SLS_getscreeny /* �d����`�h�~�}�N�� */

#include <windows.h> /* HWND,RECT,GetClientRect */


int getscreeny(void) /* ���݉��Y�T�C�Y�֐�  Get ScReeN Y-size function */
/*
 * ���Y�T�C�Y(1�`400�`)[dot]
 */
{
  extern HWND SLS_hwnd; /* �E�B���h�E�E�n���h��  Handle of WiNDow */
  RECT d;
  GetClientRect(SLS_hwnd,&d); /* �`��̈���W */
  return d.bottom;
} /* getscreeny */


#endif /* SLS_getscreeny */


/* getwinx.f */
#ifndef SLS_getwinx /* �d����`�h�~ */
#define SLS_getwinx /* �d����`�h�~�}�N�� */

#include <windows.h> /* HWND,RECT,GetWindowRect */


int getwinx(void) /* �E�B���h�EX�T�C�Y�֐�  Get WINdow X-size function */
/*
 * �E�B���h�EX�T�C�Y(1�`640�`)[dot]=���X�T�C�Y+�gX*2
 */
{
  extern HWND SLS_hwnd; /* �E�B���h�E�E�n���h��  Handle of WiNDow */
  RECT d;
  GetWindowRect(SLS_hwnd,&d); /* �E�B���h�E�����` */
  return d.right-d.left;
} /* getwinx */


#endif /* SLS_getwinx */


/* getwiny.f */
#ifndef SLS_getwiny /* �d����`�h�~ */
#define SLS_getwiny /* �d����`�h�~�}�N�� */

#include <windows.h> /* HWND,RECT,GetWindowRect */


int getwiny(void) /* �E�B���h�EY�T�C�Y�֐�  Get WINdow Y-size function */
/*
 * �E�B���h�EY�T�C�Y(1�`400�`)[dot]=���Y�T�C�Y+�^�C�g��Y+�gY*2
 */
{
  extern HWND SLS_hwnd; /* �E�B���h�E�E�n���h��  Handle of WiNDow */
  RECT d;
  GetWindowRect(SLS_hwnd,&d); /* �E�B���h�E�����` */
  return d.bottom-d.top;
} /* getwiny */


#endif /* SLS_getwiny */


/* gint.f */
#ifndef SLS_gint /* �d����`�h�~ */
#define SLS_gint /* �d����`�h�~�}�N�� */

#include <stdio.h> /* FILENAME_MAX,NULL */
#include <stdlib.h> /* EXIT_SUCCESS,exit */
#include <windows.h> /* CALLBACK,DWORD,HDC,HWND,LPARAM,LPMINMAXINFO,
  LRESULT,MSG,PAINTSTRUCT,POINT,RECT,SIZE,UINT,WNDCLASS,WPARAM,
  BLACK_BRUSH,CW_USEDEFAULT,FALSE,HWND_NOTOPMOST,HWND_TOPMOST,IDC_ARROW,
  MM_TEXT,SB_HORZ,SB_LINEDOWN,SB_LINELEFT,SB_LINERIGHT,SB_LINEUP,SB_VERT,
  SB_PAGELEFT,SB_PAGERIGHT,SB_PAGEDOWN,SB_PAGEUP,SB_THUMBPOSITION,
  SC_MAXIMIZE,SC_MINIMIZE,SC_RESTORE,
  SIMPLEREGION,SM_CXVSCROLL,SM_CYHSCROLL,
  SRCCOPY,STD_INPUT_HANDLE,SW_SHOWDEFAULT,SWP_NOMOVE,SWP_NOSIZE,TRUE,
  WM_CLOSE,WM_CREATE,WM_ERASEBKGND,WM_EXITSIZEMOVE,WM_GETMINMAXINFO,
  WM_HSCROLL,WM_NCHITTEST,WM_PAINT,WM_SIZE,WM_SIZING,WM_SYSCOMMAND,WM_VSCROLL,
  WMSZ_BOTTOM,WMSZ_BOTTOMLEFT,WMSZ_BOTTOMRIGHT,WMSZ_LEFT,WMSZ_RIGHT,WMSZ_TOP,
  WMSZ_TOPLEFT,WMSZ_TOPRIGHT,
  WS_CAPTION,WS_HSCROLL,WS_OVERLAPPED,WS_MAXIMIZEBOX,WS_MINIMIZEBOX,
  WS_SYSMENU,WS_THICKFRAME,WS_VSCROLL,
  HIWORD,LOWORD,
  AdjustWindowRect,BeginPaint,BitBlt,CreateCompatibleBitmap,CreateCompatibleDC,
  CreateRectRgn,CreateWindow,DefWindowProc,DeleteDC,DispatchMessage,
  DestroyWindow,EndPaint,FlushConsoleInputBuffer,GetClipBox,GetMapMode,
  GetMessage,GetModuleFileName,GetModuleHandle,GetStdHandle,GetStockObject,
  GetSystemMetrics,GetViewportExtEx,GetViewportOrgEx,GetWindowExtEx,
  GetWindowOrgEx,LoadCursor,PostQuitMessage,RegisterClass,ScrollWindow,
  SelectClipRgn,SetMapMode,SetRect,SetScrollPos,SetScrollRange,
  SetViewportExtEx,SetViewportOrgEx,SetWindowExtEx,SetWindowPos,SetWindowOrgEx,
  ShowScrollBar,ShowWindow,TranslateMessage,UpdateWindow,ValidateRect */

//#include "getmscrx.f" /* �ő���X�T�C�Y�֐�  get_max_screen_x */
//#include "getmscry.f" /* �ő���Y�T�C�Y�֐�  get_max_screen_y */
//#include "getscrnx.f" /* ���݉��X�T�C�Y�֐�  getscreenx */
//#include "getscrny.f" /* ���݉��Y�T�C�Y�֐�  getscreeny */
//#include "getwinx.f"  /* �E�B���h�EX�T�C�Y�֐� */
//#include "getwiny.f"  /* �E�B���h�EY�T�C�Y�֐� */


HDC SLS_hdc; /* �\�����u�\���n���h��  Handle of Device Context */
HWND SLS_hwnd; /* �E�B���h�E�E�n���h��  Handle of WiNDow */
int SLS_screen_x; /* �������X�T�C�Y(1�`640�`)[dot](XMAX�p) */
int SLS_screen_y; /* �������Y�T�C�Y(1�`400�`)[dot](YMAX�p) */

#define hpaint     SLS_gint_hpaint /* �d����`����}�N�� */
#define hdc2       SLS_gint_hdc2
#define window_x   SLS_gint_window_x
#define window_y   SLS_gint_window_y
#define window_sx  SLS_gint_window_sx
#define window_sy  SLS_gint_window_sy
#define gend_first SLS_gint_gend_first
static PAINTSTRUCT hpaint; /* �`����n���h��  Handle of PAINTing */
static HDC hdc2; /* ��ʕۑ��p�\�����u�\���n���h��  Handle of Device Context */
static int window_x; /* �����E�B���h�EX�T�C�Y[dot] */
static int window_y; /* �����E�B���h�EY�T�C�Y[dot] */
static int window_sx; /* �X�N���[���E�E�B���h�EX�T�C�Y[dot] */
static int window_sy; /* �X�N���[���E�E�B���h�EY�T�C�Y[dot] */
static int gend_first=1; /* gend���s(0:��, 1:��, 2:gmemory) */

#define window_proc SLS_gint_window_proc /* �d����`����}�N�� */
static LRESULT CALLBACK window_proc( /* �E�B���h�E���͏����֐� */
  HWND hwnd,UINT uMsg,WPARAM wParam,LPARAM lParam);

//HBRUSH hback_brush; // �w�i�u���V�E�n���h��

int gint( /* �O���t�B�b�N�X�������֐��i�X�N���[���Łj
             Graphics INiTializing function */
/*
 * 0:����(EXIT_SUCCESS)
 * 1:���s(�E�B���h�E�E�N���X�o�^���s)
 */
int rx, /* ���X�T�C�Y(1�`640�`)[dot] Resolution-X */
int ry, /* ���Y�T�C�Y(1�`400�`)[dot] Resolution-Y */
COLORREF back)
{
  char fn[FILENAME_MAX]; /* ���s�t�@�C����  File Name */
  RECT ws; /* �E�B���h�E�E�T�C�Y  Window Size */
  WNDCLASS wc; /* �E�B���h�E�E�N���X  Window Class */

  DWORD wstyle /* �E�B���h�E�E�X�^�C��  Window STYLE */
  =WS_OVERLAPPED  /* �����\���ʒu */
  |WS_CAPTION     /* �^�C�g���E�o�[,�ړ��\ */
  |WS_SYSMENU     /* ����\ */
  |WS_THICKFRAME  /* �E�B���h�E�E�T�C�Y�ϊD���g */
  |WS_MINIMIZEBOX /* �ŏ����\ */
  |WS_MAXIMIZEBOX /* �ő剻�\ */
  |WS_HSCROLL     /* �����X�N���[�� */
  |WS_VSCROLL;    /* �����X�N���[�� */
  /*
   *�m����n�����\���ʒu�ړ��\�ϊD���g�X�N���[���E�B���h�E
   *�i�^�C�g���E�o�[,�D�����E,�傫����,�\���ʒu�s��,�ړ��\,����\,
   * �ŏ����\,�ő剻�\,�X�N���[���\�j
   */

  wc.lpszClassName="gint"; /* �E�B���h�E�E�N���X�� */
  wc.lpszMenuName =NULL; /* �N���X�E���j���[�E���\�[�X�� */
  wc.hInstance    =GetModuleHandle(NULL); /* �C���X�^���X�E�n���h�� */
  wc.lpfnWndProc  =window_proc; /* �E�B���h�E�E�v���V�[�W�� */
  wc.hCursor      =LoadCursor(NULL,IDC_ARROW); /* �N���X�E�J�[�\�� */
  wc.hIcon        =NULL; /* �N���X�E�A�C�R���i��`�����j */
  if(back==CLR_INVALID)
    wc.hbrBackground // �N���X�w�i�u���V
              =NULL; // �_���u���V�Ȃ�
  else
    wc.hbrBackground // �N���X�w�i�u���V
      =CreateSolidBrush(back); // �_���u���V����

  wc.style        =0; /* �N���X�E�X�^�C���i�w�肹���j */
  wc.cbClsExtra   =0; /* �⑫�N���X�E������[�o�C�g] */
  wc.cbWndExtra   =0; /* �⑫�E�B���h�E�E������[�o�C�g] */
  if(!RegisterClass(&wc))return 1; /* ���E�B���h�E�E�N���X�o�^���s */

  gend_first=1; /* gend�֐������s */
  SetRect(&ws,0,0,rx,ry); /* �����`�l�ݒ� */
  AdjustWindowRect(&ws,wstyle,0); /* �E�B���h�E�E�T�C�Y�v�Z */
  rx=ws.right-ws.left; /* �E�B���h�EX�T�C�Y[dot](�g�܂�) */
  ry=ws.bottom-ws.top; /* �E�B���h�EY�T�C�Y[dot](�g,�^�C�g���E�o�[�܂�) */
  if(rx>get_max_screen_x())rx=get_max_screen_x(); /* �ő���X�T�C�Y�ȓ� */
  if(ry>get_max_screen_y())ry=get_max_screen_y(); /* �ő���Y�T�C�Y�ȓ� */
  window_x=rx; /* �����E�B���h�EX�T�C�Y[dot] */
  window_y=ry; /* �����E�B���h�EY�T�C�Y[dot] */
  window_sx /* �X�N���[���E�E�B���h�EX�T�C�Y[dot] */
    =window_x+GetSystemMetrics(SM_CXVSCROLL);
  window_sy /* �X�N���[���E�E�B���h�EY�T�C�Y[dot] */
    =window_y+GetSystemMetrics(SM_CYHSCROLL);

  GetModuleFileName(NULL,fn,FILENAME_MAX); /* ���s�t�@�C���� */

  SLS_hwnd=CreateWindow( /* �E�B���h�E���� */
    wc.lpszClassName, /* �N���X�� */
    fn,               /* �E�B���h�E���i���s�t�@�C�����j */
    wstyle,           /* �E�B���h�E�E�X�^�C�� */
    CW_USEDEFAULT,    /* �E�B���h�E�\��X�ʒu�i�����j */
    CW_USEDEFAULT,    /* �E�B���h�E�\��Y�ʒu�i�����j */
    rx,               /* �E�B���h�EX�T�C�Y[dot](�g�܂�) */
    ry,               /* �E�B���h�EY�T�C�Y[dot](�g,�^�C�g���E�o�[�܂�) */
    NULL,             /* �e�E�B���h�E�E�n���h�� */
    NULL,             /* ���j���[�n���h�� */
    wc.hInstance,     /* �A�v���P�[�V�����E�C���X�^���X�E�n���h�� */
    NULL);            /* �E�B���h�E�쐬�f�[�^ */

  SetWindowPos( /* �\�Ȍ���E�B���h�E����O�ɕ\�� */
    SLS_hwnd,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE|SWP_NOSIZE);
  ShowWindow(SLS_hwnd,SW_SHOWDEFAULT); /* �E�B���h�E�\����Ԑݒ� */

  SLS_screen_x=getscreenx(); /* �������X�T�C�Y[dot](XMAX�p) */
  SLS_screen_y=getscreeny(); /* �������Y�T�C�Y[dot](YMAX�p) */
/*
 *�m����nShowWindow�֐����Ăяo���āA�X�N���[���E�o�[�̖����������Ă���A
 * SLS_screen_x,SLS_screen_y��ݒ�B
 */

  SLS_hdc=BeginPaint(SLS_hwnd,&hpaint); /* �`��J�n */

  FlushConsoleInputBuffer( /* �L�[���̓o�b�t�@�f�o�ikeyread�֐��΍�j */
    GetStdHandle(STD_INPUT_HANDLE));

  return 0; /* �������I��(EXIT_SUCCESS) */
} /* gint */



void gend(void) /* �O���t�B�b�N�X�I���֐�  Graphics ENDing function */
{
  void gmemory(int mode);
  MSG msg; /* ���b�Z�[�W  MeSsaGe */
  gmemory(1); /* �O���t�B�b�N�X��ʋL�� */
  gend_first=0; /* gend���s�� */

  while(GetMessage(&msg,NULL,0,0)) /* ���b�Z�[�W�擾�i���ׂāj */
  {
    TranslateMessage(&msg); /* ���z�L�[�E���b�Z�[�W�ϊ� */
    DispatchMessage(&msg); /* �E�B���h�E�E�v���V�[�W���Ƀ��b�Z�[�W�𑗏o */
  } /* while */

  gmemory(0); /* �O���t�B�b�N�X��ʋL������ */
  EndPaint(SLS_hwnd,&hpaint); /* �`��I��(SLS_hwnd,SLS_hdc���폜) */
  UnregisterClass("gint",GetModuleHandle(NULL)); /* �E�B���h�E�E�N���X�폜 */
} /* gend */



void gmemory( /* �O���t�B�b�N�X�L���֐�  Graphics MEMORY function */
int mode) /* ���[�h(1:�L��, 0:�L������) */
{
  static int map_mode=MM_TEXT; /* �ʑ����[�h */
  static int clip_box_mode=SIMPLEREGION; /* ���̈惂�[�h */
  static HBITMAP hbitmap; /* ��ʕۑ��p�摜 */
  static RECT cb; /* ����`��̈� Clip Box */
  static POINT worg; /* �E�B���h�E���_  Window ORiGin */
  static POINT vorg; /* �r���[�|�[�g���_  Viewport ORiGin */
  static SIZE wext; /* �E�B���h�E�͈�  Window EXTent */
  static SIZE vext; /* �r���[�|�[�g�͈�  Viewport EXTent */

  if(mode==0) /* �L������ */
  {
    if(gend_first==1)return; /* �����L�^ */

    SetWindowPos( /* �\�Ȍ���E�B���h�E����O�ɕ\�� */
      SLS_hwnd,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE|SWP_NOSIZE);
    UpdateWindow(SLS_hwnd); /* WM_PAINT���b�Z�[�W�𑗏o */
    gend_first=1; /* gend�֐������s */
    DeleteDC(hdc2); /* ��ʕۑ��p���u�\���폜 */
    DeleteObject(hbitmap); /* ��ʕۑ��p�摜�폜 */

    if(map_mode!=MM_TEXT)
    { /* ��W���ʑ� */
      SetMapMode(SLS_hdc,map_mode); /* �ʑ����A(base_screen�֐��΍�) */
      SetWindowOrgEx(SLS_hdc,worg.x,worg.y,NULL); /* �E�B���h�E���_�ݒ� */
      SetWindowExtEx(SLS_hdc,wext.cx,wext.cy,NULL); /* �E�B���h�E�͈͐ݒ� */
      SetViewportOrgEx(SLS_hdc,vorg.x,vorg.y,NULL); /* �r���[�|�[�g���_�ݒ� */
      SetViewportExtEx(SLS_hdc,vext.cx,vext.cy,NULL); /* �r���[�|�[�g�͈͐ݒ�*/
    }
    if(clip_box_mode==SIMPLEREGION) /* �P�꒷���` */
      SelectClipRgn( /* ����`��̈�ݒ�(view�֐��΍�) */
        SLS_hdc,CreateRectRgn(cb.left,cb.top,cb.right,cb.bottom));
    /*
     *�m����n�ďo��������
     * SetWindowPos��UpdateWindow��gend_first
     * UpdateWindow��SetMapMode��SetWindowExtEx��SetViewportExtEx
     *  ��SelectClipRgn
     */
    return; /* �� */
  }

  if(gend_first==2)return; /* ���L�^�� */
#if 1 /* 0 �ɂ���ƁAgend�֐��ďo�O����X�N���[���\�ɂȂ� */
  SLS_screen_x=getscreenx(); /* ����x�𑜓x[dot] */
  SLS_screen_y=getscreeny(); /* ����y�𑜓x[dot] */
#endif

  map_mode=GetMapMode(SLS_hdc); /* �ʑ����[�h�擾 */
  if(map_mode!=MM_TEXT)
  { /* ��W���ʑ� */
    GetWindowOrgEx(SLS_hdc,&worg); /* �E�B���h�E���_�擾 */
    GetWindowExtEx(SLS_hdc,&wext); /* �E�B���h�E�͈͎擾 */
    GetViewportOrgEx(SLS_hdc,&vorg); /* �r���[�|�[�g���_�擾 */
    GetViewportExtEx(SLS_hdc,&vext); /* �r���[�|�[�g�͈͎擾 */
    SetMapMode( /* �ʑ��W�����i���̎ʑ��ɂȂ��Ă���Ɖ摜�������j*/
      SLS_hdc,MM_TEXT);
  }

  clip_box_mode=GetClipBox(SLS_hdc,&cb); /* ����`��̈�擾 */
  /*�m����nGetClipRgn�֐�(Win32 API)�͎g�p�ł��Ȃ� */
  SelectClipRgn( /* ����`��̈�폜�i�`��̈�S�̂�ۑ����邽�߁j*/
    SLS_hdc,NULL);

  hdc2=CreateCompatibleDC(SLS_hdc); /* �݊����u�\������ */
  hbitmap=CreateCompatibleBitmap( /* �݊��r�b�g�}�b�v�쐬 */
    SLS_hdc, /* �����u�\�� */
    SLS_screen_x,SLS_screen_y); /* �𑜓x */
  SelectObject(hdc2,hbitmap); /* ��ʕۑ��p���u�\���ݒ� */

  BitBlt( /* ��ʕۑ� */
    hdc2,    /* �]���摕�u�\�� */
    0,0,     /* �]������W */
    SLS_screen_x,SLS_screen_y, /* �𑜓x */
    SLS_hdc, /* �]�������u�\�� */
    0,0,     /* �]�������W */
    SRCCOPY); /* ���̂܂܃R�s�[ SouRCe COPY */

  SetWindowPos( /* ���̃E�B���h�E�̉��ɂ��Ȃ��悤�� */
    SLS_hwnd,HWND_NOTOPMOST,0,0,0,0,SWP_NOMOVE|SWP_NOSIZE);

#if 1 /* 0 �ɂ���ƁAgend�֐��ďo�O����X�N���[���\�ɂȂ� */
  window_x=getwinx(); /* ���݃E�B���h�EX�T�C�Y[dot] */
  window_y=getwiny(); /* ���݃E�B���h�EY�T�C�Y[dot] */
  hpaint.rcPaint.right =window_x; /* �`��x�͈� */
  hpaint.rcPaint.bottom=window_y; /* �`��y�͈� */
  window_sx /* �X�N���[���E�E�B���h�EX�T�C�Y[dot] */
    =window_x+GetSystemMetrics(SM_CXVSCROLL);
  window_sy /* �X�N���[���E�E�B���h�EY�T�C�Y[dot] */
    =window_y+GetSystemMetrics(SM_CYHSCROLL);
#else
  hpaint.rcPaint.right =window_x; /* �`��x�͈� */
  hpaint.rcPaint.bottom=window_y; /* �`��y�͈� */
#endif

  gend_first=2; /* gmemory���s(SetWindowPos�ďo�Ȍ�Őݒ�) */
} /* gmemory */


static LRESULT CALLBACK window_proc( /* �E�B���h�E���͏����֐� */
HWND     hwnd, /* �E�B���h�E�E�n���h��  Handle of the WiNDow */
UINT     uMsg, /* ���b�Z�[�WID          Unsigned MeSsaGe identifier */
WPARAM wParam, /* ��1���b�Z�[�W�E�p�����[�^ Word PARAMeter(������) */
LPARAM lParam) /* ��2���b�Z�[�W�E�p�����[�^ Long int PARAMeter(�L����) */
{
  switch(uMsg)
  {
    static int rollx;  /* �����X�N���[���l(0�`)[dot]  ROLL X */
    static int rolly;  /* �����X�N���[���l(0�`)[dot]  ROLL Y */
    static int maxrlx; /* �ő吅���X�N���[��(0�`)[dot]  MAXimum scRoLl X */
    static int maxrly; /* �ő吂���X�N���[��(0�`)[dot]  MAXimum scRoLl Y */
    static int sbarx;  /* �����X�N���[���\��(0:�Ȃ�,1:����)  Scroll BAR X */
    static int sbary;  /* �����X�N���[���\��(0:�Ȃ�,1:����)  Scroll BAR Y */
    static int cont_scroll; /* �A���X�N���[��(0:�Ȃ�,1:����)CONTinuity SCROLL*/

    case WM_PAINT: /* �`��v�� */
    ValidateRect(hwnd,NULL); /* �X�V�`��̈�폜�A�`��̈�L���� */
    /*
     *�m����nValidateRect�֐��ďo���Ȃ��ƁAWM_PAINT���b�Z�[�W������ꑱ����B
     */
    if(gend_first==1)return 0; /* ��gend,gmemory�֐��ďo�O */
    {
    RECT *p=&hpaint.rcPaint;
    BitBlt( /* ��ʕ��� */
      SLS_hdc,        /* �]���摕�u�\�� */
      p->left,p->top, /* �]������W */
      p->right-p->left,p->bottom-p->top, /* �X�N���[����ʓ���ʉ𑜓x */
      hdc2,     /* �]�������u�\�� */
      p->left+rollx,p->top+rolly, /* �]�������W */
      SRCCOPY); /* ���̂܂܃R�s�[ SouRCe COPY */
    }
    return 0; /* �� */

    case WM_SYSCOMMAND: /* �V�X�e���R�}���h�v�� */
    switch(wParam)
    {
      case SC_MINIMIZE: /* �ŏ��� */
      if(maxrlx>0)sbarx=1;else sbarx=0;
      if(maxrly>0)sbary=1;else sbary=0;
      break;
      case SC_MAXIMIZE: /* �ő剻 */
      sbarx=sbary=0; /* �X�N���[���o�[��\�� */
      rollx=rolly=0; /* �X�N���[���ʒu���_ */
      SetScrollPos(hwnd,SB_HORZ,0,FALSE); /* �����X�N���[���o�[���_ */
      SetScrollPos(hwnd,SB_VERT,0,FALSE); /* �����X�N���[���o�[���_ */
      /*
       *�m����n�u�����{�^���v�΍�
       */
      ShowScrollBar(hwnd,SB_HORZ,FALSE); /* �����X�N���[���o�[��\�� */
      ShowScrollBar(hwnd,SB_VERT,FALSE); /* �����X�N���[���o�[��\�� */
      /*
       *�m����n�ő剻���ꂽ�E�B���h�E�̓T�C�Y�ύX�ł��Ȃ��B
       */
      break;
      case SC_RESTORE:  /* ���� */
      if(maxrlx>0)sbarx=1;else sbarx=0;
      if(maxrly>0)sbary=1;else sbary=0;
    } /* switch */
    break; /* �� */

    case 0x214: /* WM_SIZING:�T�C�Y�ύX�� */
    switch(wParam)
    {
      case 1 /* WMSZ_LEFT   */: /* ���[ */
      case 2 /* WMSZ_RIGHT  */: /* �E�[ */
      sbarx=1;
      break;
      case 3 /* WMSZ_TOP    */: /* ��[ */
      case 6 /* WMSZ_BOTTOM */: /* ���[ */
      sbary=1;
      break;
      case 4 /* WMSZ_TOPLEFT     */: /* ����[ */
      case 5 /* WMSZ_TOPRIGHT    */: /* �E��[ */
      case 7 /* WMSZ_BOTTOMLEFT  */: /* �����[ */
      case 8 /* WMSZ_BOTTOMRIGHT */: /* �E���[ */
      sbarx=sbary=1;
    } /* switch */
    break; /* �� */

    case WM_SIZE: /* �E�B���h�E�T�C�Y�ύX */
#if 1 /* 0 �ɂ���ƁAgend�֐��ďo�O����X�N���[���\�ɂȂ� */
    if(gend_first==1) /* gend,gmemory�֐��ďo�O */
    {
      ShowScrollBar(hwnd,SB_HORZ,FALSE); /* �����X�N���[���o�[��\�� */
      ShowScrollBar(hwnd,SB_VERT,FALSE); /* �����X�N���[���o�[��\�� */
      return 0; /* �� */
    }
#endif

    if(sbarx==0)
    {
      ShowScrollBar(hwnd,SB_HORZ,FALSE); /* �����X�N���[���o�[��\�� */
    }
    else
    { /* �����X�N���[���E�o�[�\�� */
      maxrlx=SLS_screen_x-LOWORD(lParam);
      if(maxrlx<0)maxrlx=0;

      SetScrollRange(hwnd,SB_HORZ,0,maxrlx,FALSE); /* �����X�N���[���͈͐ݒ� */
      if(maxrlx<=0)
      {
        sbarx=0;
      }
      else
      {
        if(rollx>maxrlx)rollx=maxrlx;
        SetScrollPos(hwnd,SB_HORZ,rollx,TRUE); /* �����X�N���[���o�[�ĕ`�� */
      }
    }

    if(sbary==0)
    {
      ShowScrollBar(hwnd,SB_VERT,FALSE); /* �����X�N���[���o�[��\�� */
    }
    else
    { /* �����X�N���[���E�o�[�\�� */
      maxrly=SLS_screen_y-HIWORD(lParam);
      if(maxrly<0)maxrly=0;

      SetScrollRange(hwnd,SB_VERT,0,maxrly,FALSE); /* �����X�N���[���͈͐ݒ� */
      if(maxrly<=0)
      {
        sbary=0;
      }
      else
      {
        if(rolly>maxrly)rolly=maxrly;
        SetScrollPos(hwnd,SB_VERT,rolly,TRUE); /* �����X�N���[���o�[�ĕ`�� */
      }
    }
    return 0; /* �� */

    case 0x232 /* WM_EXITSIZEMOVE */: /* �ړ��T�C�Y�ύX�I��*/

#if 1 /* 0 �ɂ���ƁAgend�֐��ďo�O����X�N���[���\�ɂȂ� */
    if(gend_first==1)return 0; /* ��gend,gmemory�֐��ďo�O */
#endif

    if(sbarx==1 && sbary==0)
    { /* X���̂݃X�N���[���E�o�[���� */
      if(getwinx()>window_x) /* X���������傫���Ȃ��Ă��� */
      SetWindowPos(SLS_hwnd,HWND_NOTOPMOST,0,0,window_x,window_sy,SWP_NOMOVE);
      else
      SetWindowPos(SLS_hwnd,HWND_NOTOPMOST,0,0,getwinx(),window_sy,SWP_NOMOVE);
    }

    if(sbarx==0 && sbary==1)
    { /* Y���̂݃X�N���[���E�o�[���� */
      if(getwiny()>window_y) /* Y���������傫���Ȃ��Ă��� */
      SetWindowPos(SLS_hwnd,HWND_NOTOPMOST,0,0,window_sx,window_y,SWP_NOMOVE);
      else
      SetWindowPos(SLS_hwnd,HWND_NOTOPMOST,0,0,window_sx,getwiny(),SWP_NOMOVE);
    }

    if(sbarx==0 && sbary==0) /* X��Y�����X�N���[���E�o�[�Ȃ� */
      SetWindowPos(SLS_hwnd,HWND_NOTOPMOST,0,0,window_x,window_y,SWP_NOMOVE);
    return 0; /* �� */

    case WM_HSCROLL: /* �����X�N���[���v�� */
    {
    int x;
    int dx; /* �ω���x */

    switch(LOWORD(wParam)) /* �X�N���[�����e�iwParam���ʃ��[�h�j*/
    {
      case SB_LINELEFT : /* 1�P�ʍ��X�N���[�� */
      case SB_LINERIGHT: /* 1�P�ʉE�X�N���[�� */
      cont_scroll++; /* �A���X�N���[�� */
      if(cont_scroll<10)
      {
        dx=1;
      }
      else
      {
        dx=cont_scroll-8; /* ���� */
        if(dx>maxrlx/10)dx=maxrlx/10;
      }
    } /* switch */

    switch(LOWORD(wParam)) /* �X�N���[�����e�iwParam���ʃ��[�h�j*/
    {
      case SB_PAGELEFT :x=rollx-maxrlx/10;break; /* 1�����X�N���[�� */
      case SB_PAGERIGHT:x=rollx+maxrlx/10;break; /* 1���E�X�N���[�� */
      case SB_LINELEFT :x=rollx-dx;break; /* 1�P�ʍ��X�N���[�� */
      case SB_LINERIGHT:x=rollx+dx;break; /* 1�P�ʉE�X�N���[�� */
      case SB_THUMBPOSITION:x=HIWORD(wParam);break; /* ��Έʒu�X�N���[�� */
      default:return 0; /* ���ω��Ȃ� */
    } /* switch */

    if(x<0)x=0;else if(x>maxrlx)x=maxrlx;
    if(x==rollx)return 0; /* ���ω��Ȃ� */

    ScrollWindow(hwnd,rollx-x,0,NULL,NULL); /* �����X�N���[�� */
    SetScrollPos(hwnd,SB_HORZ,x,TRUE); /* �����X�N���[���o�[�ĕ`�� */
    rollx=x;
    }
    return 0; /* �� */

    case WM_VSCROLL: /* �����X�N���[���v�� */
    {
    int y;
    int dy; /* �ω���y */
    switch(LOWORD(wParam)) /* �X�N���[�����e�iwParam���ʃ��[�h�j*/
    {
      case SB_LINEUP   : /* 1�s��X�N���[�� */
      case SB_LINEDOWN : /* 1�s���X�N���[�� */
      cont_scroll++; /* �A���X�N���[�� */
      if(cont_scroll<10)
      {
        dy=1;
      }
      else
      {
        dy=cont_scroll-8; /* ���� */
        if(dy>maxrly/10)dy=maxrly/10;
      }
    } /* switch */

    switch(LOWORD(wParam)) /* �X�N���[�����e�iwParam���ʃ��[�h�j*/
    {
      case SB_PAGEUP   :y=rolly-maxrly/10;break; /* 1�y�[�W��X�N���[�� */
      case SB_PAGEDOWN :y=rolly+maxrly/10;break; /* 1�y�[�W���X�N���[�� */
      case SB_LINEUP   :y=rolly-dy;break; /* 1�s��X�N���[�� */
      case SB_LINEDOWN :y=rolly+dy;break; /* 1�s���X�N���[�� */
      case SB_THUMBPOSITION:y=HIWORD(wParam);break; /* ��Έʒu�X�N���[�� */
      default:return 0; /* ���ω��Ȃ� */
    } /* switch */

    if(y<0)y=0;else if(y>maxrly)y=maxrly;
    if(y==rolly)return 0; /* ���ω��Ȃ� */

    ScrollWindow(hwnd,0,rolly-y,NULL,NULL); /* �����X�N���[�� */
    SetScrollPos(hwnd,SB_VERT,y,TRUE); /* �����X�N���[���o�[�ĕ`�� */
    rolly=y;
    }
    return 0; /* �� */

    case WM_NCHITTEST: /* �}�E�X�J�[�\���ʒu */
    cont_scroll=0; /* �A���X�N���[����~ */
    break; /* �� */

    case WM_CLOSE: /* �E�B���h�E�E�N���[�Y�v�� */
    if(gend_first==0)
    { /* gend�֐��ďo�� */
      DestroyWindow(hwnd); /* �E�B���h�E�j�� */
      PostQuitMessage(0); /* ���s���I�� */
      return 0; /* �� */
    }
    exit(EXIT_SUCCESS); /* �� */
    /*
     *�m����ngend�֐��ďo�ȑO��keyread�֐��ɂ��u����{�^���v�F��
     */

    case WM_GETMINMAXINFO: /* �ő�ŏ����T�C�Y���v�� */
    ((LPMINMAXINFO)lParam)->ptMaxSize.x=window_x;
    ((LPMINMAXINFO)lParam)->ptMaxSize.y=window_y;
    /*
     *�m����n���ꂪ�Ȃ��Ɖ�ʂ����ς��ɂȂ��Ă��܂��B
     */
    return 0; /* �� */

    case WM_ERASEBKGND: /* �E�B���h�E�w�i�����v�� */
    if(gend_first!=1 && getwinx()<=window_x && getwiny()<=window_y)
      return 0; /* ��gend(0),gmemory(2)�֐��ďo�� */
    /*
     *�m����ngend,gmemory�֐��ďo�O�͕K�v�ȕ����������������B
     */
    break; /* �� */

    case WM_CREATE: /* �E�B���h�E���� */
    rollx=rolly=0; /* �X�N���[���ʒu���_ */
    maxrlx=maxrly=0; /* �X�N���[���ʃ[�� */
    sbarx=sbary=0; /* �X�N���[���o�[��\�� */
    cont_scroll=0; /* �A���X�N���[����~ */
    break; /* �� */
  } /* switch */

  return DefWindowProc(hwnd,uMsg,wParam,lParam); /* �� */
} /* window_proc */


#undef hpaint /* �d����`����}�N�� */
#undef hdc2
#undef window_x
#undef window_y
#undef window_sx
#undef window_sy
#undef gend_first


#endif /* SLS_gint */


/* scrn_int.f */
#ifndef SLS_screen_int /* �d����`�h�~ */
#define SLS_screen_int /* �d����`�h�~�}�N�� */


#include <stdlib.h>   /* atexit */
//#include "gint.f"     /* �O���t�B�b�N�X�������֐� gint,gend */


void screen_int( /* ��ʏ������֐�  Screen INiTializing function */
int x, /* ���X�T�C�Y(1�`640�`)[dot] Resolution-X */
int y, /* ���Y�T�C�Y(1�`400�`)[dot] Resolution-Y */
COLORREF back) //�w�i�F Windows�t���J���[�F
{
  gint(x,y,back); /* �O���t�B�b�N�X������ */
  atexit(gend); /* �O���t�B�b�N�X�I���֐������ďo�\�� */
} /* screen_int */


#endif /* SLS_screen_int */
