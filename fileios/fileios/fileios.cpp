#include<map>
#include<iostream>
#include<fstream>
#include<string>
#include<assert.h>

using namespace std;

string src="D:\\MY PJ\\DebuggingLevel\\fileios\\fileios\\host_config.txt";


int read_mysql_xml(string &host,string &user,string &pass, string &dbname,int &port)
{
    ifstream readfile;
    string line;
    int count=5;
    map<string ,string> infile;
    
    readfile.open(src.c_str(),ios::in);
//  readfile.open("host_config.txt",ios::in); 

    if(!readfile)
    {
        return 1; /*没有打开该文件*/
    }
    while(count--)
    {
        getline(readfile,line);
        string::size_type index = line.find_first_of(" ",0);    
        string first = line.substr(0,index);//(begin,length)
        string second = line.substr(index+1);
        infile[first]=second;
    }
    host = infile["host"];
    user = infile["user"];
    pass = infile["pass"];
    dbname = infile["dbname"];
    port = atoi(infile["port"].c_str());
}

int main()
{
	string host="IS",user="Joe",pass="jia",dbname="b1";
	int port=0;
	int h=read_mysql_xml(host,user,pass,dbname,port);
	assert(h!=1);
	cout<<host<<'\n'<<user<<'\n'<<pass<<'\n'<<dbname<<'\n'<<port<<endl;
	system("pause");
	return 1;
}