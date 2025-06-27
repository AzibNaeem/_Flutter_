import 'dart:io';

void main() {
  /*stdout.write("Enter you name: ");
  var name = stdin.readLineSync();
  print("Your name is: $name");

  for (int i = 0; i < 5; i++) {
    print("Value of i is: $i");
  }

  // Use ? to mark that the var can be nullable
  int? a;
  print(a);
  var JJ = new Human();

  //Long int in C++, used to store very long int in string format
  BigInt b;
  b = BigInt.parse('131231313123123123131231231231');
  print(b);

  // 1/0
  bool isHuman;
  isHuman = true;

  //used for float/decimal
  double number = 99.5;
  print(number);

  //Used for both int/decimal
  num c = 9922.4;
  print(c);

  var hum = "Hello Guys";
  print(hum);

  // hum = 5; This is wrong as var tells the compiler
  // that the first time value is the type of this variable

  String j = "Name";
  print(j);

  //Dynamic variables Very Powerful
  var university;
  university = "FAST NUCES";
  print("$university");
  university = 99;
  print("$university");
  university = true;
  print("$university");

  var sum = new Human();
  var res = sum.Calculation(5, 10);
  print("The addition of the two numbers is: $res");
  sum.printName("Azib");

  var ListNumbers = [10, 20, 30, 40];
  ListNumbers.add(69);
  print(ListNumbers);

  var newNumbers= [];
  newNumbers.addAll(ListNumbers);
  newNumbers.add(190);
  print(newNumbers);

  newNumbers.insert(3, "Hello");
  print(newNumbers);

  var newList = [0,10,2,3,4,5,6];
  newList.insertAll(2, ListNumbers);
  print(newList);
  newList[0] = 102;
  print(newList);

  newList.replaceRange(0, 4, [69,69,69,69]);
  print(newList);

  newList.removeRange(0, 4);
  print(newList);
  newList.removeAt(2);
  print(newList);

  print("Length of the list is: ${newList.length}");
  print("reversed List is: ${newList.reversed}");

  var something = {
    1 : "key1",
    2 : "key2",
    3 : 70
  };
  print(something);

  print("The value at key 1 is: ${something[1]}");
  something[4] = 69;
  print(something);

  something[1] = "meow";
  print(something);
  print(something.length);
  print(something.keys);
  if(something.containsKey(4))
    print("Exists");
  print(something.values);
  print(something.containsValue("meow"));



  //Cannot reassign a value/string/bool again.
  final int val;
  val = 201;

  // Can only initialize the variable right after declaration.
  const int val2 = 30;
  const int val1 = val2;

   */

  for (int i = 1; i <= 10; i++){
    if(i % 2 == 0)
      print("${i} is Even");
    else
      print("${i} is Odd");
  }
  int choice = 1;
  while(choice < 11){
    if(choice % 2 == 0)
      print("${choice} is even");

    else
      print("${choice} is odd");
    choice++;

  }
}

class Human {
  // Default Constructor
  Human() {
    print("Entered the class");
  }

  void printName(String name) {
    print("Your name is: $name");
  }

  int Calculation(int num1, int num2) {
    int result;
    print("enter your choice: ");
    int choice = int.parse(stdin.readLineSync()!);
    if (choice == 1) {
      result = num1 + num2;
      return result;
    } else
      return 0;
  }
}
