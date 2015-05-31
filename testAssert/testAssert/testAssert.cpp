//#define NDEBUG  
#include <assert.h>
#include <stdio.h>
#include <math.h>
#include <iostream>
#include <stack>
using namespace std;
#define N 10
int count = 0;

int x[N] = {7,3,1,6,2,44,0,5,12,9};



 
void main()
{
	int a,i,*b;
	stack <int> mystack;
	for(i=0;i<N;i++)	
	mystack.push(i);
	for(i=0;i<N;i++)
	{
		a=mystack.top();
		mystack.pop();
		cout<<a<<endl;
	}
	assert(a==0); //If expression is true ,continue.
	cout<<"haha"<<endl;
	system("pause");

	
}
