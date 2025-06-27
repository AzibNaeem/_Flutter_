import'dart:io';

class Student{
  String name = '';
  int marks = 0;
  Map<String, int> map = {};

  double CalculateAverage(){
    double res = 0;
    var List1 = [];
    if(map.entries.isEmpty){
      return 0;
    }
    List1 = map.entries.toList();
    for(int i = 0; i < map.length; i ++){
      res += List1[i].value;
    }
    res = res / map.length;
    return res;
  }
}
class StudentManager extends Student {
  var list2 = [];

  void addStudent1(String naam, int markss) {
    this.name = naam;
    this.marks = markss;
    Map<String, int> temp = {};
    temp[naam] = markss;
    map.addAll(temp);
  }

  void Display() {
    if(list2.isEmpty){
      print("Please enter data first!");
    }
    list2 = map.entries.toList();
    for (int i = 0; i < map.length; i++) {
      print("Name of the student is: ${list2[i].key}");
      print("Marks of the student are: ${list2[i].value}\n");
    }
  }

  void DisplayAverage(double a) {
    print("Average of all the students is: ${a}");
  }

  String findTopper() {
    if (map.isEmpty)
      return "No students found";
    list2 = map.entries.toList();
    int maxMarks = list2[0].value;
    String topper = list2[0].key;
    for (int i = 0; i < list2.length; i++) {
      for (int j = i + 1; j < list2.length; j++) {
        if (list2[j].value > maxMarks) {
          maxMarks = list2[j].value;
          topper = list2[j].key;
        }
      }
    }
    return topper;
  }
  void MenuDisplay(){
    print("Enter 1 for Adding a Student!\n");
    print("Enter 2 for Displaying the Student/s!\n");
    print("Enter 3 for Finding the Average Marks!\n");
    print("Enter 4 for the Topper!\n");
    print("Enter 0 to exit!\n");
  }
}
  void main(){
  var s1;
  var m1;
  bool Choice2 = true;

  StudentManager St = new StudentManager();

  while(Choice2) {
    St.MenuDisplay();
    print("\nEnter your Choice: ");
    var Choice = int.parse(stdin.readLineSync()!);
    if (Choice == 1) {
      print("Enter Name of the student: ");
      s1 = stdin.readLineSync();
      print("Enter marks of the student: ");
      m1 = int.parse(stdin.readLineSync()!);
      St.addStudent1(s1, m1);
      print("Student Successfully added!\n");
      print("Press y to display the menu or n to exit!\n");
      var again = stdin.readLineSync();
      if(again == 'n' || again == 'N'){
        Choice2 = false;
      }
    }
    if (Choice == 2) {
      St.Display();
      print("Press y to display the menu or n to exit!\n");
      var again = stdin.readLineSync();
      if(again == 'n' || again == 'N'){
        Choice2 = false;
      }
    }
    if (Choice == 3) {
      var a = St.CalculateAverage();
      St.DisplayAverage(a);
      print("\nPress y to display the menu or n to exit!\n");
      var again = stdin.readLineSync();
      if(again == 'n' || again == 'N'){
        Choice2 = false;
      }
    }
    if (Choice == 4) {
      var topper = St.findTopper();
      print("Topper is: $topper\n");
      print("Press y to display the menu or n to exit!\n");
      var again = stdin.readLineSync();
      if(again == 'n' || again == 'N'){
        Choice2 = false;
      }
    }
    if (Choice == 0) {
      Choice2 = false;
    }
  }
}