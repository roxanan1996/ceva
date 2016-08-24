#ifndef __AVLNOD_H_
#define __AVLNOD_H_

template< typename T >
class AvlNode {
	private:
		T key;
		int balance;
		AvlNode<T> *left, *right, *parent;

	public:

		/* constructor, ii dau parintele  */
		AvlNode( T k, AvlNode<T>* p);

		/* copy-assigment */
		void operator=( const AvlNode<T> &node );

		/* destructor */
		~AvlNode( );

		/* setter pt key */

		void setKey( T key );

		/* setter pt balance */
		void setBalance( int balance );

		/* setter pt left */
		void setLeft( AvlNode<T>* left );

		/* setter pt right */
		void setRight( AvlNode<T>* right );

		/* setter pt parinte */
		void setParent( AvlNode<T>* parent );

		/* inordine */
		void inorder( );

		/* ia keia */
		T getKey( );
		
		/* ia balance */
		int getBalance( );

		/*  ia left */
		AvlNode<T>* getLeft();

		/*  ia right */
		AvlNode<T>* getRight();

		/* ia parinte */
		AvlNode<T>* getParent();
};
#endif /* __AVLNOD_h__ */
