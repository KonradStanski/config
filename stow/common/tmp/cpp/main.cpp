#include <iostream>

struct Node {
  double val;
  Node* next;
};

void insert_at_head(Node** head, double val) {
  Node* new_node = new Node;
  new_node->val = val;
  new_node->next = *head;
  *head = new_node;
}

int main() {
    std::cout << "Hello, World!" << std::endl;
    Node* head = new Node;
    head->val = 2.0;
    insert_at_head(&head, 3.0);
    std::cout << head->val << std::endl;
}

