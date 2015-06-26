//ArrayDynamicalAllocation.cpp : 定义控制台应用程序的入口点。
//列大小固定的二维数组可以申请一维数据并将指针强转成二维数组  
//内存调试，地址逐个错位覆盖
#include "stdafx.h"
using namespace std;

int _tmain(int argc, _TCHAR* argv[])
{
	const int fixcol=6;
	int nRow;
	cin>>nRow;

	//申请一维数据并将其转成二维数组指针
	int *pp_arr = new int[nRow*fixcol];  
	int (*p)[fixcol/3] = (int(*)[fixcol/3])pp_arr; 


    //为二维数组赋值  
    int i, j, w=1;  
    for (i = 0; i < nRow; i++)  
        for (j = 0; j < fixcol; j++)  
		{    p[i][j] = w++;  
	cout<<i<<"  "<<j<<"  "<<p[i][j]<<endl;}

      
    //输出二维数组  
    for (i = 0; i < nRow; i++)  
    {  
        for (j = 0; j < fixcol; j++)  
            cout<<"   "<<p[i][j];  
        putchar('\n');  
    }  

    //释放资源  
    delete[] pp_arr;  
	system("pause");
	return 0;
}