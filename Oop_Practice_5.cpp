//Create two objects of a class Book and copy data from one object to another using:

//A copy constructor

//An assignment operator

#include<iostream>
using namespace std;

class Book{
public:
	int ISSN;
	string name;
	string genre;
	Book(){
		ISSN = 0;
		name = " ";
		genre = " ";
	}
	Book(int is, string n, string g){
		this->ISSN = is;
		this->name = n;
		this->genre = g;
	}
	Book(const Book& other){
		this->name = other.name;
		this->ISSN = other.ISSN;
		this->genre = other.genre;
	}
	Book& operator=(const Book& other){
		this->name = other.name;
		this->ISSN = other.ISSN;
		this->genre = other.genre;
		return *this;
	}
	void display(){
		cout << "Name of the Book is: " << name << endl;
		cout << "ISSN of the Book is: " << ISSN << endl;
		cout << "Genre of the Book is: " << genre << endl;
	}
	
};

int main(){
	Book b1(8123712, "Game Of Thrones", "Action");
	b1.display();
	
	cout << endl;
	
	Book b2(6923601, "Flower Of Evil", "Thriller");
	b2.display();
	
	cout << endl;
	
	Book b3;
	b3 = b1;
	b3.display();
	
	cout << endl;
	
	Book b4(b2);
	b4.display();
}
