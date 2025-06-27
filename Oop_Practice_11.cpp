#include<iostream>
#include<string>
using namespace std;

//12 : Write code to demonstrate function overloading vs function overriding clearly.

class Student{
public:
	int rollNo;
	string name;
	Student(){
		rollNo = 0;
		name = " ";
	}
	// Function Overloading
	Student(int r, string n){
		rollNo= r;
		name = n;
	}
	virtual void show(){
		cout << "Name of the student is: " << name << endl;
		cout << "Roll Number of the student is: " << rollNo << endl;
	}
};
class Department : public Student{
public:
	string dept_name;
	Department() : Student(){
		dept_name = " ";
	}
	Department(string n, string naam, int r): Student(r, naam){
		dept_name = n;
	}
	void show()override{
		cout << "Name of the department is: " << dept_name << endl;
		cout << "Name of the student is: " << name << endl;
		cout << "Roll Number of the student is: "<< rollNo << endl;
	}
};


int main(){
	Department d1("Computer Science", "Azib Naeem", 2541);
	d1.show();
	cout << endl << endl;
	Student s1(69, "Pyara bacha");
	s1.show();
	return 0;
}
