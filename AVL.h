#pragma once
#include<iostream>
#include<string>
#include<vector>
#include"Node.h"
#include"Record.h"
using namespace std;

class AVL{
public:
	Node* root;
	AVL(){
		root = nullptr;
	}
	int getHeight(Node* current){
		if(current)
			return current->height;
		return -1;
	}
	int getBalance(Node* current){
		if(current)
			return getHeight(current->left) - getHeight(current->right);
	}
	void updateHeight(Node* node) {
        if (node != nullptr) {
            node->height = 1 + max(getHeight(node->left), getHeight(node->right));
        }
    }
	Node* rotateRight(Node* A){
		Node* B = A->left;
		Node* R2 = B->right;
		
		B->right = A;
		B->left = R2;
		
		updateHeight(A);
		updateHeight(B);
		return B;
	}
	Node* rotateLeft(Node* A){
		Node* B = A->right;
		Node* R2 = B->left;
		
		B->left = A;
		B->right = R2;
		
		updateHeight(A);
		updateHeight(B);
		return B;
	}
	Node* insertHelper(Node* current, string issn, Record* rec){
		if(current == nullptr)
			return new Node(issn, rec);
		if(issn < current->ISSN){
			current->left = insertHelper(current->left, issn, rec);
		}
		else if(issn > current->ISSN){
			current->right = insertHelper(current->right, issn, rec);
		}
		else
			return current;
		
		if(!current){
			return current;
		}
		int bal = getBalance(current);
		if(bal > 1 && issn < current->left->ISSN){
			return rotateRight(current);
		}
		else if(bal > 1 && issn > current->left->ISSN){
			current->left = rotateLeft(current->left);
			return rotateRight(current);
		}
		else if(bal < -1 && issn > current->right->ISSN){
			return rotateLeft(current);
		}
		else if(bal < -1 && issn < current->right->ISSN){
			current->right = rotateRight(current->right);
			return rotateLeft(current);
		}
		return current;
	}
	void insert(string issn, Record* rec){
		root = insertHelper(root, issn, rec);
		return;
	}
	Node* minVal(Node* current){
		Node* temp = current;
		while(temp && temp->left){
			temp = temp->left;
		}
		return temp;
	}
	Node* deleteHelper(Node* current, string issn){
		if(current == nullptr){
			return current;
		}
		if(issn > current->ISSN){
			current->right = deleteHelper(current->right, issn);
		}
		else if(issn < current->ISSN){
			current->left = deleteHelper(current->left, issn);
		}
		else{
			if(current->left == nullptr || current->right == nullptr){
				Node* temp;
				if(current->left)
					temp = current->left;
				else
					temp = current->right;
				if(temp == nullptr){
					temp = current;
					current = nullptr;
				}
				else{
					*current = *temp;
				}
				delete temp;
			}
			else{
				Node* temp = minVal(current->right);
				current->ISSN = temp->ISSN;
				current->record = temp->record;
				current->right = deleteHelper(current->right, temp->ISSN);
			}	
		}
		if(!current){
			return current;
		}
		int bal = getBalance(current);
		if(bal > 1 && issn < current->left->ISSN){
			return rotateRight(current);
		}
		else if(bal > 1 && issn > current->left->ISSN){
			current->left = rotateLeft(current->left);
			return rotateRight(current);
		}
		else if(bal < -1 && issn > current->right->ISSN){
			return rotateLeft(current);
		}
		else if(bal < -1 && issn < current->right->ISSN){
			current->right = rotateRight(current->right);
			return rotateLeft(current);
		}
		return current;	
	}
	void deleteNode(string issn){
		root = deleteHelper(root, issn);
	}
	Node* searchHelper(Node* current, string issn){
		if(!current || current->ISSN == issn){
			return current;
		}
		if(issn > current->ISSN){
			return searchHelper(current->right, issn);
		}
		if(issn < current->ISSN){
			return searchHelper(current->left, issn);
		}
	}
	Record* search(string issn){
		Node* current = searchHelper(root, issn);
		return current ? current->record : nullptr;
	}
};
