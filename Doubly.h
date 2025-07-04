#pragma once
#include<iostream>
#include<string>
#include<vector>
#include"Record.h"
#include"Node.h"
#include"AVL.h"
using namespace std;

class Doubly {
    Record* head;
public:
    Doubly(){
    	head = nullptr;
    }
    Record* insert(string ISSN, string title, vector<string> authors, int ref, int issue) {
        Record* newRecord = new Record(ISSN, title, authors, ref, issue);
        if (!head || head->ISSN > ISSN) {
            newRecord->next = head;
            if (head) 
				head->prev = newRecord;
            head = newRecord;
        } 
		else {
            Record* current = head;
            while (current->next && current->next->ISSN < ISSN)
                current = current->next;
            newRecord->next = current->next;
            if (current->next) 
				current->next->prev = newRecord;
            current->next = newRecord;
            newRecord->prev = current;
        }
        return newRecord;
    }
    void deleteNode(string ISSN) {
        Record* current = head;
        while (current && current->ISSN != ISSN)
            current = current->next;
        if (!current) 
			return;
		if (current == head) 
			head = current->next;
        if (current->prev) 
			current->prev->next = current->next;
        if (current->next) 
			current->next->prev = current->prev;
		current->next = current->prev = nullptr;
    }
    void print(string ISSN) {
        Record* current = head;
        while (current && current->ISSN != ISSN)
            current = current->next;
        if (!current) {
            cout << "Record not found!" << endl;
            return;
        }
        cout << "ISSN: " << current->ISSN << endl;
        cout << "Title: " << current->title << endl;
        cout << "Authors: ";
        //for (const auto& author : current->authors)
        //   cout << author << " ";
        //cout << endl;
        for (int i = 0; i < current->authors.size(); i++) {
    		cout << current->authors[i];
    		if (i != current->authors.size() - 1) {
        		cout << " & ";
    		}
		}
		cout << endl;
        cout << "Reference Copies: " << current->refCopy << endl;
        cout << "Issuable Copies: " << current->issueCopy<< endl;

    }
};

