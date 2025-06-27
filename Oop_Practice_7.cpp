// Create a Shape base class and derive Circle, Rectangle, and Triangle.
// Add a virtual getArea() function and override it in each child class.
 
 #include<iostream>
 using namespace std;
 #define Pi 3.141562
 class Shape{
public:
	int length;
	int width;
	Shape(){
		length = width = 0;
	}
	Shape(int l, int w){
		this->length = l;
		this->width = w;
	}
	virtual void show(){
		cout << "Length of the shape is: " << length << endl;
		cout << "Width of the shape is: " << width << endl;
	}
	virtual double getArea(){
		return (length  +  width);
	}
 };
 
class Circle : public Shape{
public:
	int radius;
	Circle(){
		radius = 0;
	}
	Circle(int r){
		this->radius = r;	
	}
	void show() override{
		cout << "radius of the Circle is: "<< this->radius << endl;
	}
	double getArea() override{
		return Pi * (radius * radius);
	}
};
class Rectangle : public Shape{
public:
	void show() override{
		cout << "Length of the Rectangle is: "<< this->length << endl;
		cout << "Width of the Rectangle is: "<< this->width << endl;
	}
	double getArea()override{
		return (length * width);
	}
};

class Triangle : public Shape{
public:
	Triangle(int l, int w): Shape(l, w){
	}
	void show()override{
		cout << "Base of the triangle is: " << length << endl;
		cout << "Height of the triangle is: " << width << endl;
	}
	double getArea()override{
		return (length * width)/2;
	}
};

 
 int main(){
 	Shape s(4, 5);
 	s.show();
 	cout << "Area of the Shape is: " << s.getArea() << endl << endl;
 	
 	Triangle s1(5,5);
 	s1.show();
 	cout << "Area of the Shape is: " << s1.getArea() << endl << endl;
 	
 	// Same goes for rectangle and circle
 	return 0;
 }
