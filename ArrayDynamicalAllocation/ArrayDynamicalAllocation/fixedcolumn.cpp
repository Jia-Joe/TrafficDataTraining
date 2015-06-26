/**
*ContinuousIntArray.cpp
*C语言中如何动态申请连续的二维数组。
*可以采用多申请一些指针,然后这一些指针分别指向后面数据区中对应的位置
**/
#include "stdafx.h"

using namespace std;

//int tmain1(int argc, _TCHAR* argv[])
//{
//	const int fixcol=6;
//	int nRow;
//	cin>>nRow;
//
//	//申请一维数据并将其转成二维数组指针
//	int *pp_arr = new int[nRow*fixcol];  
//	int (*p)[fixcol/3] = (int(*)[fixcol/3])pp_arr; 
//
//
//    //为二维数组赋值  
//    int i, j, w=1;  
//    for (i = 0; i < nRow; i++)  
//        for (j = 0; j < fixcol; j++)  
//		{    p[i][j] = w++;  
//	cout<<i<<"  "<<j<<"  "<<p[i][j]<<endl;}
//
//      
//    //输出二维数组  
//    for (i = 0; i < nRow; i++)  
//    {  
//        for (j = 0; j < fixcol; j++)  
//            cout<<p[i][j]<<setw(5);  
//        putchar('\n');  
//    }  
//
//    //释放资源  
//    delete[] pp_arr;  
//	system("pause");
//	return 0;
//}