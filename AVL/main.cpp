#include<stdlib.h>
#include<iostream>
#include "AvlTree.h"

int main(void)
{
	AvlTree<int> t;

	std::cout << "Inserting integer values 1 to 10" << std::endl;
	for (int i = 1; i <= 10; ++i)
	t.insert(i);

	std::cout << "Printing balance: ";
	t.printBalance();
	return 0;
}