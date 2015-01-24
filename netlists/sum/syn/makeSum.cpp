#include <iostream>
#include <fstream>
#include <cstdlib>

using namespace std;

int main(int argc, char* argv[])
{
	if(argc !=3)
	{
		cout << "usage ./makeSum N outfile" << endl;
		cout << " N: number of FAs" << endl;
	}

	int N = atoi(argv[1]);
	const char *outfilename = argv[2];

	ofstream outfile(outfilename);



	outfile << "module sum ( clk, rst, a, b, c );" << endl;
	outfile << "input  ["<< N-1 << ":0] a;" << endl ;
	outfile << "input  ["<< N-1 << ":0] b;" << endl ;
	outfile << "output ["<< N-1 << ":0] c;" << endl ;
	outfile << "input clk, rst;" << endl << endl;


	outfile << "wire ";
	for(int i=0;i<3*N;i++)
	{
		outfile << "n" << i;
		if(i==3*N-1)
			outfile << ";" << endl << endl;
		else if(i%10 == 9) 
			outfile << ", "<< endl << "\t";
		else
			outfile << ", ";
	}
	


	outfile << "wire ";
	for(int i=0;i<N;i++)
	{
		outfile << "c" << i;
		if(i==N-1)
			outfile << ";" << endl << endl;
		else if(i%10 == 9) 
			outfile << ", "<< endl << "\t";
		else
			outfile << ", ";
	}

	int wire = 0;
	int gid = 0;
	for(int i=0;i<N;i++)
	{
		outfile <<   
			"XOR U"  << gid <<  " ( .A(c" << i << "), .B(n"<< wire <<"), .Z(c" << i + 1 << ") );" << endl <<
			"ANDN U" << gid+1 <<  " ( .B(n"<< wire+1 <<"), .A(n"<< wire+2 <<"), .Z(n"<< wire <<") );" << endl <<
			"XOR U"  << gid+2 <<  " ( .A(c" << i << "), .B(b["<< i <<"]), .Z(n"<< wire+1 <<") );" << endl <<
			"XNOR U" << gid+3 <<  " ( .A(b["<< i <<"]), .B(n"<< wire+2 <<"), .Z(c["<< i <<"]) );" << endl <<
			"XNOR U" << gid+4 <<  " ( .A(a["<< i <<"]), .B(c" << i << "), .Z(n"<< wire+2 <<") );" << endl;
			wire += 3;
			gid  += 5;
	}

	outfile << endl << endl << "endmodule" << endl;
	outfile.close();
}
