#include <iostream>
using namespace std;

class Car{
public:
    int speed;
};

class ElectricCar{
public:
	Car engine1;
    int speed;
};

class PetrolCar{
public:
    Car engine;
};
int main() {
    Car car1;
    car1.speed = 10;
    int a = car1.speed;
    
    // Speed of engine inside the electric car
    ElectricCar car2;
    car2.engine1.speed = 20;
    int b = car2.engine1.speed;
    
    
    // Electric car ki speed
    car2.speed = 30;
    int e = car2.speed;
    
    PetrolCar car3;
    car3.engine.speed = 30;
    int c = car3.engine.speed;
    
    cout << "Car1 speed: " << a << endl;
    cout << "ElectricCar speed: " << b << endl;
    cout << "PetrolCar engine speed: " << c << endl;
    return 0;
}

