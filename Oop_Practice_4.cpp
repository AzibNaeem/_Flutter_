#include<iostream>
using namespace std;

//Write a class Rectangle with:

//Data members length and width

//Functions: setDimensions(), getArea(), getPerimeter()

class Rectangle{
public:
	int width;
	int length;
	Rectangle(){
		width = 0;
		length = 0;
	}
	void setDimensions(int l, int w){
		this->length = l;
		this->width = w;
	}
	double getArea(){
		return (length * width);
	}
	double getPerimeter(){
		return 2 * (length + width);
	}
};

int main(){
	Rectangle r;
	r.setDimensions(5,4);
	cout << "Area of the Rectangle is: " << r.getArea() << endl;
	cout << "Perimeter of the Rectangle is: " << r.getPerimeter() << endl;
}
