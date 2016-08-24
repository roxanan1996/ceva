#include<stdio.h>
#include<stdlib.h>
#include<iostream>
using namespace std;
template<typename T>
struct listElem {
	T info;
	struct listElem<T> *next, *prev;
};

template< typename T> 
class LinkedList {
public:
	struct listElem<T> *pFirst, *pLast;

	/* constructor default */
	LinkedList() {
		pFirst = NULL;
		pLast = NULL;
	}

	/* copy-constructor */ 
/*	LinkedList( const LinkedList<T> &l ){
		pFirst = l.pFirst;
		pLast = l.pLast;
	}

	/* copy-assigment */
/*	void operator=(const LinkedList<T> &l ){
		pFirst = l.pFirst;
		pLast = l.pLast;
	}
	/* destrcutor */
/*	~LinkedList(){
		struct listElem<T> *aux = pFirst;
		while( aux != NULL ){
			struct listElem<T> * next = aux->next;
			delete aux;
			aux = next;
		}
	}
*/
	bool isEmpty() {
		return pFirst == NULL;
	}
	/* adauga la inceputul listei elementul x; */
	void addFirst( T x ) {
		struct listElem<T> *paux;
		paux = new struct listElem<T>;
		paux->info = x;
		paux->prev = NULL;
		paux->next = pFirst;
		
		if( pFirst != NULL ) {
			pFirst ->prev = paux;
		}	
		if( pLast == NULL ) {
			pLast = pFirst;	
		}
		pFirst = paux;	
	}	

	void addSorted( T x ) {
		struct listElem<T> *paux, *pnew;
		paux = pFirst;
		while( paux != NULL && paux->info <= x )
			paux = paux->next;
		pnew = new struct listElem<T>;
		pnew ->info = x;
		if( paux != NULL ) {
			if( paux->prev == NULL ) //first elem
				pFirst = pnew;
			else {
				paux->prev->next = pnew;
			}
		paux->prev = pnew;
		pnew->prev = paux->prev;
		pnew->next = paux;	
		}
		else { //last elem
			if( pLast == NULL ) { //only elem
				pFirst = pLast = pnew;
				pnew->next = NULL;
				pnew->next = NULL;
			}
			else { //adaugam la sfarsit	
				pLast->next = pnew;
				pnew->prev = pLast;
				pnew->next = NULL;
				pLast = pnew;
			}
		}
	}

	void addLast( T x ){
		struct listElem<T> *paux;
		paux = new struct listElem<T>;
		paux->info = x;
		paux->next = NULL;
		paux->prev = pLast;
		if( isEmpty( ) ) {
			pLast = paux;
			pFirst = paux;		
		}
		if( pLast != NULL ){
			pLast ->next = paux;
		}
		if( pFirst == NULL ){
			pFirst = pLast;
		}
		pLast = paux;
	}
	void removeFirst( ){
		struct listElem<T>* paux;
		if( pFirst != NULL ){
			paux  = pFirst->next;
			if( pFirst == pLast )	// one elem
				pLast = NULL;
			delete pFirst;
			pFirst = paux;
			if( pFirst != NULL ) pFirst->prev = NULL;
		}
		else {
			fprintf(stderr,"Error 101- The list is empty\n");
		}
	}

	void removeLast() {
		struct listElem<T>*paux;
		if( pLast != NULL ){
			paux = pLast->prev;
			if( pFirst == pLast ) //one elem
				pFirst = NULL;
			delete pLast;
			pLast = paux;
			if( pLast != NULL )
				pLast->next = NULL; 
		}
		else {
			fprintf(stderr,"Error\n");
		}
	}

	LinkedList<T>* findFirstOccurrence( T x ){
		struct listElem<T> *paux = pFirst;
		while( paux != NULL ){
			if( paux->info == x )
				return paux;
		}
		return NULL;
	}
	void printList() {
		struct listElem<int> *paux = pFirst;
		while( paux != NULL ){
			cout<<paux->info<<"\n";
			paux = paux->next;
		}
	}
	LinkedList<T>* removeFirstOccurrence( T x ){
		struct listElem<T> *paux = findFirstOccurrence(x);
		if( paux != NULL)
			if( paux->prev != NULL ) //nu e primul
				paux->prev->next = paux->next; //fac leg next
			if( paux->next != NULL )
				paux->next->prev = paux->prev;
			if( paux->prev == NULL )
				pFirst = paux->next;
			if( paux->next == NULL )
				pLast = paux->prev;
			delete paux;
	}
	LinkedList<T> *removeDuplicates() {
		struct listElem<T>* paux = pFirst;
		while( paux->next != NULL ){
		//	struct listElem<T>* aux = paux->next;
			listElem<T>* aux = paux->next;
			if( paux->info == aux->info ) {//is la fel
			//stergem paux->next
				if( paux->prev == NULL ) {
					pFirst = aux;
				}
				else
				paux->prev->next = aux; 
				aux->pr
				ev = paux->prev;
			delete paux;
			}
			paux = aux;
		}
	}	
 
};


