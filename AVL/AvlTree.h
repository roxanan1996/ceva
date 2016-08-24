#ifndef __AvlTree_H__
#define __AvlTree_H__

#include "AvlNode.h"
template< typename T >
class AvlTree {

	private:

	/* radacina este root, evident */	
	AvlNode<T> *root;

	/* functie care face o rotatie simpla stanga de la nodul a */
	AvlNode<T>* leftRotation( AvlNode<T> *a ); 

	/* functie care intoarce o rotatie dubla: stanga si apoi dreapta */
	AvlNode<T>* leftRightRotation( AvlNode<T> *a );

	/* functie care intoarce o rotatie simpla spre dreapta */
	AvlNode<T> *rightRotation( AvlNode<T> *a );

	/* functie care intoarce o rotatie dubla: una spre dreapta alta, spre stanga*/
	AvlNode<T> *rightLeftRotation( AvlNode<T> *a );
	
	/* functia de echilibrare */
	void rebalance( AvlNode<T>* n );

	/* calculeaza inaltimea subarborelui */
	int height( AvlNode<T> *n );

	/* seteaza */
	void setBalance( AvlNode<T>* n );

	/* printeaza Balance */
	void printBalance( AvlNode<T>* n);

	/* */
	void clearNode( AvlNode<T>* n );

	public:

		/* constructor */
		AvlTree( );

		/* destructor */
		~AvlTree( );

		/* insert */
		bool insert( T key );

		/* deleteKey */
		void deleteKey( const T key );

		 int max( const int& a , const int &b );
		/* print */
		void printBalance( );
};
#endif /* __AvlTree_H__*/