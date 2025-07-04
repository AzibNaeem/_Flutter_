#include<iostream>
#include<string>
using namespace std;

//11 : Create an abstract class Animal with a pure virtual function makeSound().
 //Derive Dog, Cat, and Cow and override makeSound().

class Animal{
public:
	virtual void makeSound() = 0;
};
class Dog : public Animal{
public:
	string d1;
	Dog(){
		d1 = " ";
	}
	Dog(string name){
		d1 = name;
	}
	void makeSound()override{
		cout << d1 <<" makes a sound: Bow! Bow! " << endl;
	}
};
class cat : public Animal{
public:
	string d2;
	cat(){
		d2 = " ";
	}
	cat(string name){
		d2 = name;
	}
	void makeSound()override{
		cout << d2<< " makes a sound: Meow! Meow! " << endl;
	}
};
class cow : public Animal{
public:
	string d3;
	cow(){
		d3 = " ";
	}
	cow(string name){
		d3 = name;
	}
	void makeSound()override{
		cout << d3 << " makes a sound: MOO! MOO! " << endl;
	}
};
int main(){
	cow c("cow");
	c.makeSound();
	cout << endl;
	
	Dog d("dog");
	d.makeSound();
	cout << endl;
	
	cat c1("cat");
	c1.makeSound();
	cout << endl;
	return 0;
}
