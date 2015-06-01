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

//#define _ASSERTE(expr) \
//   do { \
//      if (!(expr) && (1 == _CrtDbgReport( \
//         _CRT_ASSERT, __FILE__, __LINE__, #expr))) \
//         _CrtDbgBreak(); \
//   } while (0)


//#undef  _EXAM_ASSERT_TEST_    //Ω˚”√
#define  _EXAM_ASSERT_TEST_   //∆Ù”√
#ifdef _EXAM_ASSERT_TEST_     //∆Ù”√∂œ—‘≤‚ ‘

void assert_report( const char * file_name, const char * function_name, unsigned int line_no )
{
	 printf( "\n[EXAM]Error Report file_name: %s, function_name: %s, line %u\n", 
			 file_name, function_name, line_no );
//	 abort();
}
	 #define  ASSERT_REPORT(expr)       \
		 do{       \
			 if (expr)       \
			  NULL;        \
		 else         \
		     assert_report( __FILE__, __FUNCTION__, __LINE__ ); \
	 }while(0)
 #else // Ω˚”√∂œ—‘≤‚ ‘ 
#define ASSERT_REPORT( condition )  NULL 
#endif /* end of ASSERT */


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
	_ASSERT(a==0); //If expression is true ,continue.
	assert(a==0);
	ASSERT_REPORT(a==1);
	//assert (0);
	cout<<"haha"<<endl;
	system("pause");

	
}
