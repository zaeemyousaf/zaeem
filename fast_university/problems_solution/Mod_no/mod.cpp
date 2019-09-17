#include <iostream>
using namespace std;
int main(){
	cout << "It computes the mod out of user entered numbers one by one\n"; 
	int rogue=-1;
	int p_no,n_no,cur_rep,max_rep=0,mod;
	//previous no and next number
	//current repitition & max repitition
	cout << "Enter first no: ";
	cin >> n_no;
	p_no=n_no;
	mod = p_no;

	if(p_no != rogue){
		cout << "Enter second no: ";
		cin >> n_no;
		cur_rep=1;
		max_rep=cur_rep;
	}

	while(n_no != rogue){
		if( n_no == p_no){
			cout << "same to previous\n";
			cur_rep++;
			if (cur_rep > max_rep ){
				max_rep = cur_rep;
				cout << "new Max rep found " << max_rep << endl;
				mod = p_no;
			}
			// cout << "Mod so far : " << mod << endl;
			// cout << "cur_rep " << cur_rep << endl;
		}
		
		else{
			// if (cur_rep > max_rep ){
			// 	cout << "new Max rep found " << max_rep << endl;
			// 	max_rep = cur_rep;
			// 	mod = p_no;
			// }
			cur_rep=1;
		}
		cout << "Mod so far : " << mod << endl;
		cout << "cur_rep " << cur_rep << endl;

		p_no = n_no;
		cout << "Enter another integer: ";
		cin >> n_no;
	} //end while
	if (mod == rogue) { cout << "Terminated before entering any number: \n";}
	else{ cout << "Mod is: " << mod << endl;}
}