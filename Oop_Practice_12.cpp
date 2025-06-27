#include<iostream>
#include<string>

using namespace std;

//14 : Create a simple polymorphic menu system:

//Base class MenuItem with virtual display()

//Derived classes like MainCourse, Drink, Dessert override display()

//Store them in an array and loop through to call display() polymorphically

class MenuItem{
public:
	int ID;
	string Name;
	string arr[10];
	MenuItem(){
		ID = 0;
		Name = " ";
		for(int i = 0; i < 10; i++){
			arr[i] = " ";
		}
	}
	MenuItem(int id, string n){
		ID = id;
		Name = n;
	}
	MenuItem(int id, string n, string arr1[]){
		ID = id;
		Name = n;
		for(int i = 0; i < sizeof(arr1); i++){
			arr[i] = arr1[i];
		}
	}
	virtual void display(){
		for(int i = 0; i <= sizeof(arr); i++){
			cout << "ID of the item is: " << ID << endl;
			cout << "Name of the item is: " << Name << endl;
		}
	}
};
class MainCourse : public MenuItem{
	int type;
	MainCourse(){
		type = -1;
	}
	MainCourse(int typee){
		type = typee;
	}
	void display()override{
		
		cout << "You chose biryani as Main Course. Enjoy :) " << endl;
	}
};


int main(){
	
	return 0;
}
