#include "stdafx.h"
using namespace std;


//动态申请二维数组 
template <typename T>
T** get2DArray(int row,int col)
{
	int size=sizeof(T);
	int psize=sizeof(T*);
	//最开始存放每一行的指针
	int totsize=psize*row + size*row*col;
	T **arr=(T **)malloc(totsize);
	if(arr!=NULL)
	{
		memset(arr,0,totsize);
		T *head=(T*)((int)arr + psize*row);
		while(row--)
			arr[row]=(T*)((int)head + size*row*col);
	}
	return (T**)arr;
}
//释放二维数组
void free2DArray(void **arr)
{
	if(arr!=NULL)
		free(arr);
}


int _tmain1(int argc, _TCHAR* argv[])
{
	int row,col;
	scanf("%d%d",&row,&col);
	int **p = get2DArray<int>(row,col);  

    //为二维数组赋值  
    int i, j, w=1;  
    for (i = 0; i < row; i++)  
        for (j = 0; j < col; j++)  
			p[i][j] = w++;  


      
    //输出二维数组  
    for (i = 0; i < row; i++)  
    {  
        for (j = 0; j < col; j++)  
            cout<<setw(5)<<p[i][j];
        putchar('\n');  
    }  
	cout<<"数组大小： "<<_msize(p)<<endl;
    //释放资源  
    free2DArray((void**)p);  
	system("pause");
	return 0;
}