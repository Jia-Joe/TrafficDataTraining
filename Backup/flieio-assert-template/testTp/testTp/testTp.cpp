#include <iostream>
#include <stdio.h>
#include <assert.h>
#include <vector>

using namespace std;


template<class T>
class Compare
 {
     public:
         static bool IsEqual(const T lh,const T rh)
          {	
              return lh!=rh;
          }
 };



template<class T>
class Compare<T*>
{
public:
    static bool IsEqual(const T* lh, const T* rh)
    {
        return Compare<T>::IsEqual(*lh, *rh);
    }
};
//=========================================================
template<>
class Compare<float>
{
public:
    static bool IsEqual(const float& lh, const float& rh)
    {
        return abs(lh - rh) < 10e-3;
    }
};

template<>
class Compare<char> {
    public:
        static bool IsEqual(char t1,char t2) {
            return t1==t2;     
        }

};
//=========================================================
template <class T1> 
struct SpecializedType
{
    T1 x1;
    T1 x2;
};
template <class T>
class Compare<SpecializedType<T> >
{
public:
    static bool IsEqual(const SpecializedType<T>& lh, const SpecializedType<T>& rh)
    {
        return Compare<T>::IsEqual(lh.x1 + lh.x2, rh.x1 + rh.x2);
    }
};
//=========================================================
template<class T>
class Compare<vector<T> >
{
	public:
    static bool IsEqual(const vector<T>& lh, const vector<T>& rh)
    {
        if(lh.size() != rh.size()) return false;
        else
        {
            for(int i=0;i<lh.size();++i)
            {
                if(lh[i]!= rh[i]) return false;
            }
        }
        return true;
    }
};
//template<>
//class Compare<char*> {
//    public:
//        static bool IsEqual(char* t1,char* t2) {
//            return strcmp(t1,t2)==0;     //NOT t1==t2
//        }
//
//};


//=========================================================



int main()
{
	int a=10;
	int b=10;
	char c1='a';
	char c2='a';
	char str1[]="abc";  
	char str2[]="1bc";  


	bool r1=Compare<float>::IsEqual(a,b);
	bool r2=Compare<char*>::IsEqual(str1,str2);//加入T*,变为0
	bool r3=Compare<char>::IsEqual(c1,c2);

	int* p1 = &a;
    int* p2 = &b;
    bool r4 = Compare<int*>::IsEqual(p1, p2);//加入T*,变为0
//	assert(p1=p2);
	cout<<r1<<r2<<r3<<r4<<endl;

	vector<int> v1;
    v1.push_back(1);
    v1.push_back(2);

    vector<int> v2;
    v2.push_back(1);
    v2.push_back(2);
    bool r5 = Compare<vector<int> >::IsEqual(v1, v2);

    // custom template class 
    SpecializedType<float> s1 = {10.1,10.2};
    SpecializedType<float> s2 = {10.3,10.0};
    bool r6 = Compare<SpecializedType<float> >::IsEqual(s1, s2);
	cout<<r5<<r6<<endl;

	system("pause");
	return 0;
}

