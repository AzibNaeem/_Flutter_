#include<iostream>
#include<string>
#include<vector>
using namespace std;


//10 : Design a class Student and a class Department where:

//A Department can have multiple Students (aggregation)

//A Student object can exist even without a department

class Student{
public:
	int rollNo;
	string name;
	Student(){
		rollNo = 0;
		name = " ";
	}
	Student(string n, int rn){
		name = n;
		rollNo = rn;
	}
	void show(){
		cout << "Name of the student is: " << name << endl;
		cout << "Roll Number of the student is: " << rollNo << endl;
	}
};

class Department{
public:
	string dept_name;
	vector<Student*> s1;
	Department(){
		dept_name = " ";
	}
	Department(string name){
		dept_name = name;
	}
	void addStudent(Student& ss){
		s1.push_back(&ss);
	}
	void show(){
		cout << "Name of the department is: " << dept_name << endl;
		for(Student* s : s1){
			s->show();
			s1.pop_back();	
		}
	}
};


int main(){
	Student s1("Azib", 2541);
	Student s2("Ahmad", 2510);
	Student s3("Zulnoorain", 2539);
	Student s4("Omer", 2502);
	
	
	Department d1("Data Science");
	d1.addStudent(s1);
	d1.addStudent(s2);
	d1.addStudent(s3);
	d1.addStudent(s4);
	d1.show();
	
	
	return 0;
}
