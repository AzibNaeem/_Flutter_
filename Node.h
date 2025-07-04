#pragma once
#include<iostream>
#include<string>
#include<vector>
#include"Record.h"
using namespace std;

class Node{
public:
	Node* left;
	Node* right;
	Record* record;
	string ISSN;
	int height;
	Node(){
		left = right = nullptr;
		height = 0;
		ISSN = '\0';
	}
	Node(string issn){
		left = right = nullptr;
		ISSN = issn;
		height = 0;
	}
	Node(string issn, Record* rec){
		ISSN = issn;
		record = rec;
		left = right = nullptr;
	}
};

