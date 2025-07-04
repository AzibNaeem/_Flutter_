#include<iostream>
#include<string>
#include<cstring>
using namespace std;

class department{
public:
	int ID;
	string name;
	virtual void show(){
		cout << "Department name is: " << name << " with ID: " << ID << endl;
	}
};
class Professor : public department{
public:
	void show()override{
		cout << "Professor's name is: " << name << " with ID: " << ID << endl;
	}
};
int main(){
	department d;
	d.ID = 1122;
	d.name = "BSCS";
	d.show();
	
	Professor P;
	P.ID = 8224;
	P.name = "Azib Naeem";
	P.show();
	
	department* D = new Professor();
	D->ID = 82269;
	D->name = "Aaiza Naeem";
	D->show();
	
	
}
