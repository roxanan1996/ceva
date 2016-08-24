#include<stdio.h>
#include<stdlib.h>
#include<iostream>
using namespace std;

template<typename T> 
struct listElem {
	T info;
	struct listElem<T> * next, *prev;
};

template<typename T>
class LinkedList{
public:
	 struct listElem<T> *pFirst, *pLast;

	 LinkedList() {
	 	pFirst = pLast = NULL;
	 }

	 bool isEmpty() {
	 	return pFirst == NULL;
	 }

	 void addFirst( T x ){
	 	struct listElem<T> *paux;
	 	paux = new struct  listElem<T>;
	 	paux->info = x;
	 	paux->prev = pLast;
	 	paux->next = pFirst;
	 	if( pFirst != NULL )
	 		pFirst->prev = paux;
	 	if( pLast == NULL )
	 		pLast = pFirst;
	 	else{
	 		pLast->next = paux;
	 	}
	 	
	 	pFirst = paux;
	 }	
	 void printlist(){
	 	struct listElem<T>* paux = pFirst;
	 	while(paux!=NULL){
	 		cout<<paux->info<<"\n";
	 		paux=paux->next;
	 	}
	 }
	}; 