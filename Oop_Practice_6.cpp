#include<iostream>
using namespace std;

//Create a class Person with name and age, and a class Employee that inherits from it with an additional salary field. Demonstrate:

//Constructor chaining

//Method overriding

class Person{
public:
	string name;
	int age;
	Person(){
		name = " ";
		age = 0;
	}
	Person(string n, int ag){
		this->name = n;
		this->age = ag;
	}
	virtual void show(){
		cout << "Name of the Person is: " << name << endl;
		cout << "Age of the person is: " << age << endl;
	}
};
class Employee : public Person{
public:
	int salary;
	Employee():Person(){
		salary = 0;
	}
	Employee(int sal, string n, int ag) : Person(n , ag){
		this->salary = sal;
		this->name = n;
		this->age = ag;
	}
	void show()override{
		cout << "Name of the person is: " << name << endl;
		cout << "Age of the person is: " << age << endl;
		cout << "Salary of the Person is: " << salary << endl;
	}
};

int main(){
	Person P("Azib", 20);
	P.show();
	cout << endl;
	Employee E(100000, "Aaiza", 23);
	E.show();
	return 0;
}
