#include<iostream>
#include<string>
#include<vector>
#include"Record.h"
#include"Node.h"
#include"AVL.h"
#include"Doubly.h"
#include"Library.h"
using namespace std;

int main(){
	Library myLibrary;
    myLibrary.createRecord("420", "Data Structures And Algo", {"Faisal Aslam"}, 5, 10);
    myLibrary.createRecord("6940", "Discrete Structures", {"Laila Yawar","Sarah Ahmad"}, 2, 7);
    cout << "Show Record 420:" << endl;
    myLibrary.display("420");
    cout << endl;
    cout << "Updating Record 420..." << endl;
    myLibrary.updateRecord("420", "Data Structures And Algo Updated", {"Faisal Aslam", "Azib Naeem"}, 7, 12);
    cout << "Show Updated Record 420:" << endl;
    myLibrary.display("420");
    cout << "\nDeleting Record 420..." << endl;
    myLibrary.deleteRecord("420");
    cout << "Show Deleted Record 420:" << endl;
    myLibrary.display("420");
    cout << "Tried Showing the Record 420." << endl;
    cout << endl;
    myLibrary.deleteRecord("69420");
    cout << "Tried Deleting random ISSN." << endl;
    cout << endl;
    cout << "Show Record 6940:" << endl;
    myLibrary.display("6940");
	return 0;
}
