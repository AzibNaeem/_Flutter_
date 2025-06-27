#pragma once
#include<iostream>
#include<string>
#include<vector>
#include"Record.h"
#include"Node.h"
#include"AVL.h"
#include"Doubly.h"
using namespace std;

class Library {
    Doubly list;
    AVL tree;
public:
    void createRecord(string ISSN, string title, vector<string> authors, int ref, int issue) {
        Record* record = list.insert(ISSN, title, authors, ref, issue);
        tree.insert(ISSN, record);
    }
    void display(string ISSN) {
        list.print(ISSN);
    }
    void updateRecord(string ISSN, string title, vector<string> authors, int ref, int issue) {
        Record* record = tree.search(ISSN);
        if (!record) {
            cout << "Record not found!" << endl;
            return;
        }
        record->title = title;
        record->authors = authors;
        record->refCopy = ref;
        record->issueCopy = issue;
    }
    void deleteRecord(string ISSN) {
    Record* rec = tree.search(ISSN);
    if (!rec) {
        cout << "Record not found!" << endl;
        return;
    }
    tree.deleteNode(ISSN);
    list.deleteNode(ISSN);
    cout << "Record with ISSN " << ISSN << " deleted successfully." << endl;
	}
};
