#ifndef __BINARY_SEARCH_TREE__H
#define __BINARY_SEARCH_TREE__H

#include <iostream>

template <typename T>
class BinarySearchTree
{
private:
  BinarySearchTree<T> *leftNode;
  BinarySearchTree<T> *rightNode;
  BinarySearchTree<T> *parent;
  T *pData;

public:

	/* constructor default*/
	BinarySearchTree() {    
		leftNode = rightNode = parent = NULL;
		pData = NULL;
	}

	/* destrcutor */
	~BinarySearchTree() {
		if( leftNode != NULL )
			delete leftNode;
		if( rightNode != NULL )
			delete rightNode;
		if( pData != NULL )
			delete pData;
	}	

	bool isEmpty() {
		return ( pData == NULL );
	}
	/* functia insert insereaza ori in stanga ori in drepta nodului, pornind de la faptul ca arborele are cel putin un nod */
	void insertKey( T x ) {

		if( this->isEmpty() ) {
			pData = new T;
			*(pData) = x;
		}
		else if( *(pData) > x ) {
			if( leftNode == NULL ) {
				leftNode = new BinarySearchTree<T>;
				//leftNode->pData = new T;
				//*(leftNode->pData) = x;	
			leftNode->parent = this;
			}
			leftNode->insertKey(x);
		}
		else {
			if( rightNode == NULL ) {
				rightNode = new BinarySearchTree<T>;
				//rightNode->pData = new T;
				//*(rightNode->pData) = x;	
			rightNode->parent = this;}
			rightNode->insertKey(x);			
		}
		}	

	BinarySearchTree<T>* searchKey(T x) {

		if( pData == NULL ) {
			return NULL;
		}

		if( (*pData) == x ) {
			//std::cout<<*(pData)<<"\n";
			return this;
		}

		if( x < (*pData) ) {
			if( leftNode != NULL ) {
				return leftNode->searchKey(x);
			}				
		}	
		else {
			if( rightNode != NULL ) {
				return rightNode->searchKey( x );
			}
		}		
		return NULL;
	}

	void inOrderDisplay() {
		if( leftNode != NULL ) {
			leftNode->inOrderDisplay();
		}
		printf("%d\n", *pData);
		if( rightNode != NULL ) {
			rightNode->inOrderDisplay();
		}
	}

	/* cauta frunza din dreapta */
	BinarySearchTree<T>* findLeafDreapta( ) {
		if( rightNode == NULL ) {
			return this;     
		}
		else {
			return rightNode->findLeafDreapta( );
		}
	}

	

	/* cauta cea mai apropiata valoarea pt this->pData si returneaza locatia */
	BinarySearchTree<T>* find( ) {
		return leftNode->findLeafDreapta( );
	
	}

 	 /* sterge this */
	void remove( ) {
		BinarySearchTree<T> *leaf;

		/* caz in care e frunza*/
		if( leftNode == NULL && rightNode == NULL ) {
			if( parent->leftNode == this )
				parent->leftNode = NULL;
			else
				parent->rightNode = NULL;
			delete pData;
		}	

		/* caz in care are doar un fiu: drept*/
		if( leftNode == NULL && rightNode != NULL ) {
			rightNode->parent = this->parent;	
			if( parent->leftNode == this )
				this->parent->leftNode = this->rightNode;
			else
				this->parent->rightNode = this->rightNode;	
			delete pData;
		}		

		/*caz in  care are doar un fiu: stang */
		if( leftNode != NULL && rightNode == NULL ) {
			leftNode->parent = this->parent;
			if( this->parent->leftNode == this )
				this->parent->leftNode = this->leftNode;
			else  
				this->parent->rightNode = this->leftNode;			
			delete pData;
		}

		/* caz in care are 2 copii */
		if( leftNode != NULL && rightNode != NULL ) {
			leaf = find( );
			*(this->pData) = *(leaf->pData);
			leaf->remove( );				
		}			
	}
	BinarySearchTree<T>* removeKey(T x) {
		BinarySearchTree<T> *t = searchKey(x);
		if( t != NULL ) {
			t->remove( );
		}
		return this;
	}
};

#endif // __BINARY_SEARCH_TREE_H
