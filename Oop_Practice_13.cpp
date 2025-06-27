#include <iostream>
using namespace std;

class Car {
public:
    int speed;
};

class ElectricCar : public Car {
public:
    int speed;
};

class PetrolCar {
public:
    Car engine;
};
int main() {
    Car car1;
    car1.speed = 10;
    
    ElectricCar car2;
    car2.speed = 20;
    
    PetrolCar car3;
    car3.engine.speed = 30;
    
    cout << "Normal Car speed: " << car1.speed << endl;
    cout << "ElectricCar speed: " << car2.speed << endl;
    cout << "PetrolCar engine speed: " << car3.engine.speed << endl;
    return 0;
}
