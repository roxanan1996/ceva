#include <algorithm>
#include <iostream>

/* AVL node */
template <class T>
class AVLnode {
public:
	T key;
	int balance;
	AVLnode *left, *right, *parent;

	AVLnode(T k, AVLnode *p) : key(k), balance(0), parent(p),
	left(NULL), right(NULL) {}

	~AVLnode() {
		delete left;
		delete right;
	}
	void inorder(){
		if( left != NULL ) {
			left->inorder();
	}
	std::cout<<key<<"\n";
	if(right != NULL)
		right->inorder();

	}
};

/* AVL tree */
template <class T>
class AVLtree {

private:
	AVLnode<T> *root;

	void printBalance               ( AVLnode<T> *n ){
			if (n != NULL) {
		printBalance(n->left);
		std::cout << n->balance << " ";
		printBalance(n->right);
	}
}

public:
/* AVL class definition */
	AVLnode<T>* getRoot(){
		return root;
	}
void rebalance(AVLnode<T> *n) {
	setBalance(n);

	if (n->balance == -2) {
		if (height(n->left->left) >= height(n->left->right))
		n = rotateRight(n);
		else
		n = rotateLeftThenRight(n);
	}
	else if (n->balance == 2) {
		if (height(n->right->right) >= height(n->right->left))
		n = rotateLeft(n);
		else
		n = rotateRightThenLeft(n);
	}

	if (n->parent != NULL) {
		rebalance(n->parent);
	}
	else {
		root = n;
	}
}


AVLnode<T>* rotateLeft(AVLnode<T> *a) {
	AVLnode<T> *b = a->right;
	b->parent = a->parent;
	a->right = b->left;

	if (a->right != NULL)
	a->right->parent = a;

	b->left = a;
	a->parent = b;

	if (b->parent != NULL) {
		if (b->parent->right == a) {
			b->parent->right = b;
		}
		else {
			b->parent->left = b;
		}
	}

	setBalance(a);
	setBalance(b);
	return b;
}

AVLnode<T>* rotateRight(AVLnode<T> *a) {
	AVLnode<T> *b = a->left;
	b->parent = a->parent;
	a->left = b->right;

	if (a->left != NULL)
	a->left->parent = a;

	b->right = a;
	a->parent = b;

	if (b->parent != NULL) {
		if (b->parent->right == a) {
			b->parent->right = b;
		}
		else {
			b->parent->left = b;
		}
	}

	setBalance(a);
	setBalance(b);
	return b;
}

AVLnode<T>* rotateLeftThenRight(AVLnode<T> *n) {
	n->left = rotateLeft(n->left);
	return rotateRight(n);
}


AVLnode<T>* rotateRightThenLeft(AVLnode<T> *n) {
	n->right = rotateRight(n->right);
	return rotateLeft(n);
}


int height(AVLnode<T> *n) {
	if (n == NULL)
	return -1;
	return 1 + std::max(height(n->left), height(n->right));
}


void setBalance(AVLnode<T> *n) {
	n->balance = height(n->right) - height(n->left);
}


AVLtree(void) : root(NULL) {}


~AVLtree(void) {
	delete root;
}


bool insert(T key) {
	if (root == NULL) {
		root = new AVLnode<T>(key, NULL);
	}
	else {
		AVLnode<T>
		*n = root,
		*parent;

		while (true) {
			if (n->key == key)
			return false;

			parent = n;

			bool goLeft = n->key > key;
			n = goLeft ? n->left : n->right;

			if (n == NULL) {
				if (goLeft) {
					parent->left = new AVLnode<T>(key, parent);
				}
				else {
					parent->right = new AVLnode<T>(key, parent);
				}

				rebalance(parent);
				break;
			}
		}
	}

	return true;
}


void deleteKey(const T delKey) {
	if (root == NULL)
	return;

	AVLnode<T>
	*n       = root,
	*parent  = root,
	*delNode = NULL,
	*child   = root;

	while (child != NULL) {
		parent = n;
		n = child;
		child = delKey >= n->key ? n->right : n->left;
		if (delKey == n->key)
		delNode = n;
	}

	if (delNode != NULL) {
		delNode->key = n->key;

		child = n->left != NULL ? n->left : n->right;

		if (root->key == delKey) {
			root = child;
		}
		else {
			if (parent->left == n) {
				parent->left = child;
			}
			else {
				parent->right = child;
			}

			rebalance(parent);
		}
	}
}


void printBalance() {
	printBalance(root);
	std::cout << std::endl;
}

};
