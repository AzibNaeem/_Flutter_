//Create a class Student with data members name, rollNo, and marks. Write member functions to:

//Input student data

//Display student data

#include<iostream>
using namespace std;

class Student{
public:
	string name;
	int rollNo;
	int marks;
	Student(){
		name = " ";
		rollNo = 0;
		marks = 0;
	}
	Student(string n, int rn, int m){
		this->name = n;
		this->rollNo = rn;
		this->marks = m;
	}
	void display(){
		cout << "Name of the student is: " << name << endl;
		cout << "Roll Number of the student is: " << rollNo << endl;
		cout << "Marks of the student are: " << marks << endl;
	}
};

int main(){
	Student s("Azib Naeem", 2541, 95);
	s.display();
}
