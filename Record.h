#pragma once
#include<iostream>
#include<string>
#include<vector>
using namespace std;

class Record{
public: 
	string title;
	string ISSN;
	vector<string> authors;
	int refCopy;
	int issueCopy;
	Record* prev;
	Record* next;
	Record(string issn, string t, vector<string> a, int ref, int issue){
		ISSN = issn;
		title = t;
		authors = a;
		refCopy = ref;
		issueCopy = issue;
		next = prev = nullptr;
	}
};

