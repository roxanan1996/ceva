#include<stdio.h>
#include<stdlib.h>
#include<iostream>
using namespace std;

template<typename T> 
struct listElem {
	T info;
	struct listElem<T> * next;
};

template<typename T>
class LinkedList<T>{
public:
	 struct listEle<T> *pFirst, *pLast;

	 LinkedListed() {
	 	pFirst = NULL;
	 	pLast = NULL;
	 }

	 bool isEmpty() {
	 	return pFirst == NULL;
	 }

	 void addFirst( T x ){
	 	struct listElem<T> *paux;
	 	paux = new struct  listElem<T>;
	 	paux->info = x;
	 	paux->next = pFirst;
	 	if( pLast == NULL )
	 		pLast = pFirst
	 	else {
	 		pLast->next = paux;
	 	}
	 	pFirst = paux;
	 }
	}; 