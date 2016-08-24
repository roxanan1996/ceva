#include <stdio.h>
#include <stdlib.h>


template <typename T> 
class BinaryTreeNode {
	public:
		T *pinfo;
		BinaryTreeNode<T> *left_son, *right_son, *parent, *root;

		/* constrcutor default */
		BinaryTreeNode( ) {
			pinfo = NULL;
			left_son = right_son = parent = NULL;
			root = this;
		}

		/* constructor: ii dau o valoare lui pinfo */
		void setInfo( T info ) {
			pinfo = new T;
			*pinfo = info;
		}

		void setRoot( BinaryTreeNode<T> *r) {
			root = r;
		}

		void insert( T x ) {
			if( pinfo == NULL ) {
				setInfo( x );
			else {
				insert_rec( x );
			}
		}
		}
		void insert_rec( T x ){
			int next_son = rand() %  2;

			if( next_son == 0 ) { /* left son */
				if( left_son == NULL ) {
					left_son = new BinaryTreeNode<T>;
					left_son->pinfo = new T;
					*(left_son->pinfo) = x;
					left_son->left_son = left_son->right_son = NULL;
					left_son->parent = this;
					left_son->root = root;
				}

			}

		}	
			