#include<iostream>
#include "link.h"

using namespace std;

int main () {
	LinkedList<int> l;
	l.addFirst(15);
	l.addFirst(10);
	l.printlist();
	//l.removeFirst();
//	l.removeLast();
//	l.printList();
	return 0;	
}