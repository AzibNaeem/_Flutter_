//design a class Engine and a class Car that has an Engine (composition). 
//The Car should call engine.start() from its own start() function.

#include<iostream>
using namespace std;

class Engine{
public:
	int engineNo;
	int speed;
	bool condition;
	Engine(){
		engineNo = 0;
		speed = 0;
		condition = 0;
	}
	Engine(int engine, int speedd, bool cond){
		engineNo = engine;
		speed = speedd;
		condition = cond;
	}
	void start(){
		cout << "The car is Currently running!" << endl;
		cout << "Engine Number of the car is: " << engineNo << endl;
		cout << "Speed of the Car in total is: " << speed << endl;
		if(condition == 1)
			cout << "Condition of the car is: Excellent" << endl;
		else if(condition == 0)
			cout << "Condition of the car is: Poor" << endl;
		else
			cout << "Condition of the car is: Average" << endl;
	}
};
class Car{
public:
	Engine engine;
	Car(int en, int s, bool con) : engine(en, s, con){
	}
	void start(){
		engine.start();
	}
};

int main(){
	Car car1(1231749, 240, 1);
	car1.start();
	return 0;
}
