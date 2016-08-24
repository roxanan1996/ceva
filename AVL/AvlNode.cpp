#include<iostream>

#include "AvlNode.h"

template <typename T>
AvlNode<T>::AvlNode( T k, AvlNode<T>* p ) : key( k ), balance( 0 ), parent( p ), left( NULL ), right( NULL ){}

template <typename T>
AvlNode<T>::~AvlNode() {
	if( left!= NULL )
		delete left;
	if( right != NULL )
		delete right;
}

template <typename T> 
void AvlNode<T>::operator=(const AvlNode<T> &node){
	this->left = node.left;
	this->right = node.right;
	this->parent = node.parent;
	this->key = node.key;
	this->balance = node.balance;	
}

template <typename T> 
void AvlNode<T>::setKey( T key ){
	this->key = key;
}

template <typename T>
void AvlNode<T>::setBalance( int balance ) {
	this->balance = balance;
}

template< typename T>
void AvlNode<T>::setLeft( AvlNode<T>* left ) {
	this->left = left;
}

template< typename T>
void AvlNode<T>::setRight( AvlNode<T>* right ){
	this->right = right;
}

template< typename T>
void AvlNode<T>::setParent( AvlNode<T>* parent ){
	this->parent = parent;
}

template< typename T>
void AvlNode<T>::inorder( ) {
	if( left != NULL )
		left->inorder();
	std::cout<<key<<"\n";
	if( right != NULL )
		right->inorder();
}

template< typename T >
T AvlNode<T>::getKey() {
	return key;
}

template<typename T>
int AvlNode<T>::getBalance( ){
	return balance;
}

template<typename T>
AvlNode<T>* AvlNode<T>::getLeft() {
	return left;
}

template<typename T>
AvlNode<T>* AvlNode<T>::getRight() {
	return right;
}

template<typename T>
AvlNode<T>* AvlNode<T>::getParent() {
	return parent;
}

template class AvlNode<int>;