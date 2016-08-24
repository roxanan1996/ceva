#include<iostream>

#include "AvlTree.h"

template<typename T>
AvlNode<T>* AvlTree<T>::leftRotation( AvlNode<T> * a ) {
	AvlNode<T> *node = a->getRight();
	node->setParent( a->getParent() );
	a->setRight( node->getLeft() );
	
	if( a->getRight() != NULL )
		a->getRight()->setParent( a );
	
	node->setLeft( a );
	a->setParent( node );

	if( node->getParent() != NULL ) {
		if( node->getParent()->getRight() == a )
			node->getParent()->setRight( node );
		else
			node->getParent()->setLeft( node );
	}

	setBalance( a );
	setBalance( node );
	return node;
}

template <class T>
AvlNode<T>* AvlTree<T>::rightRotation( AvlNode<T> *a ) {
	AvlNode<T>* node = a->getLeft();
	node->setParent( a->getParent() );
	a->setLeft( node->getRight() );

	if( a->getLeft() != NULL )
		a->getLeft()->setParent( a );

	node->setRight( a );
	a->setParent( node );

	if( node->getParent() != NULL ) {
		if( node->getParent()->getRight() == a )
			node->getParent()->setRight( node );
		else 
			node->getParent()->setLeft( node );				  
	}

	setBalance( a );
	setBalance( node );
	return node;
}

template <class T>
AvlNode<T>* AvlTree<T>::leftRightRotation( AvlNode<T> *n ) {	
	n->setLeft( leftRotation( n->getLeft() ) );
	return rightRotation( n );
}

template <class T>
AvlNode<T>* AvlTree<T>::rightLeftRotation( AvlNode<T> *n ) {
	n->setRight( rightRotation( n->getRight() ) );
	return leftRotation( n );
}

template <class T>
void AvlTree<T>::rebalance( AvlNode<T> *n ) {	
	setBalance( n );

	if( n->getBalance() == -2 ){
		if( height( n->getLeft()->getLeft() )  >= height( n->getLeft()->getRight()))
			n = rightRotation( n );
		else 
			n = leftRightRotation( n );
	}
	else if( n->getBalance() == 2 ){
			if( height( n->getRight()->getRight() ) >= height( n->getRight()->getLeft()))
				n = leftRotation( n );
			else
				n = rightLeftRotation(n);
	}

	if( n->getParent() != NULL )
		rebalance( n->getParent());
	else 
		root = n;	
}

template< class T >
int AvlTree<T>::max( const int& a , const int &b ){
   	return ( a < b ) ? b : a;
   }

template <class T>
int AvlTree<T>::height( AvlNode<T> *n ) {
	if( n == NULL )
		return 0;
	else 
		return 1 + max( height(n->getLeft()), height(n->getRight() ) );
}

template <class T>
void AvlTree<T>::setBalance( AvlNode<T> *n ) {
	n->setBalance(height(n->getRight()) - height(n->getLeft()));
}

template <class T>
void AvlTree<T>::printBalance( AvlNode<T> *n ) {
	if( n != NULL ){
		printBalance( n->getLeft() );
		std::cout<<n->getBalance()<<" ";
		printBalance( n->getRight() );
	}
}		

template <class T>
AvlTree<T>::AvlTree( ) : root( NULL ) {}

template <class T>
AvlTree<T>::~AvlTree( ) {
	delete root;
}

template <class T>
bool AvlTree<T>::insert( T key ) {
	AvlNode<T>* ceva;
	if( root == NULL ) {
		root = new AvlNode<T>(key, NULL );	
	}
	else {
		AvlNode<T> *n = root;
		while( true ){
			if( (n->getKey()) == key )
				return false;

			root->setParent(n->getParent());

			bool goLeft;
			if( n->getKey() > key )
				goLeft = true;
			else
				goLeft = false;
			AvlNode<T>* parentN = n;
			n = goLeft?n->getLeft():n->getRight();

			if( n == NULL ) {
				ceva = new AvlNode<T>( key, parentN);
				if( goLeft ){
					parentN->setLeft( ceva );
				}
				else {

					parentN->setRight( ceva );
				}
				rebalance(parentN);
				break;	
			}
		}
	}
	return true;
}	

template <class T>
void AvlTree<T>::printBalance() {
	printBalance( root );
	std::cout << std::endl;
}

template class AvlTree<int>;



