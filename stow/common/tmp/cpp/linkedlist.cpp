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

void create_sample_linked_list(Node** head) {
  // in reversed order because inserting at head
  double list_vals[] = {1.1, 2.2, 3.3, 4.4};
  for (double val : list_vals) {
    insert_at_head(head, val);
  }
}

void print_linked_list(Node* head) {
  if (head == NULL) {
    std::cout << "Empty List" << std::endl;
    return;
  }
  while(head != NULL) {
    std::cout << head->val << " -> ";
    head = head->next;
  }
  std::cout << "end" << std::endl;
}

int main() {
    Node* head = new Node;
    create_sample_linked_list(&head);
    print_linked_list(head);
    insert_at_head(&head, 44.0);
    print_linked_list(head);
}

