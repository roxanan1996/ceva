#ifndef __AVLTREE_H__
#define __AVLTREE_H__
/* AVL tree */
#include "AvlNode.h"

template <class T>
class AvlTree{
private:
	AvlNode<T> *root;

	AvlNode<T>* rotateLeft( AvlNode<T> *a );
	AvlNode<T>* rotateRight( AvlNode<T> *a );
	AvlNode<T>* rotateLeftThenRight( AvlNode<T> *n );
	AvlNode<T>* rotateRightThenLeft( AvlNode<T> *n );
	void rebalance( AvlNode<T> *n );
	int height( AvlNode<T> *n );
	void setBalance( AvlNode<T> *n );
	void printBalance( AvlNode<T> *n );
	void clearNode( AvlNode<T> *n );

public:
	AvlTree(void);
	~AvlTree(void);
	bool insert(T key);
	void deleteKey(const T key);
	void printBalance();
	AvlNode<T>* getRoot();

};

#endif /* __AVLTREE_H__*/