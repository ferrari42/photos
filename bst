#include <iostream>
using namespace std;

struct Node {
    int data;
    Node* left;
    Node* right;

    Node(int value) {
        data = value;
        left = right = NULL;
    }
};

Node* insert(Node* root, int value) {
    if (root == NULL)
        return new Node(value);
    if (value < root->data)
        root->left = insert(root->left, value);
    else
        root->right = insert(root->right, value);
    return root;
}

int longestPath(Node* root) {
    if (root == NULL)
        return 0;
    int leftHeight = longestPath(root->left);
    int rightHeight = longestPath(root->right);
    return 1 + max(leftHeight, rightHeight);
}

int findMin(Node* root) {
    if (root == NULL) {
        cout << "Tree is empty.";
        return -1;
    }
    while (root->left != NULL)
        root = root->left;
    return root->data;
}

void mirror(Node* root) {
    if (root != NULL) {
        mirror(root->left);
        mirror(root->right);
        swap(root->left, root->right);
    }
}

bool search(Node* root, int key) {
    if (root == NULL)
        return false;
    if (root->data == key)
        return true;
    else if (key < root->data)
        return search(root->left, key);
    else
        return search(root->right, key);
}

int main() {
    Node* root = NULL;
    int choice, value;

    do {
        cout << "\n\n----- BST OPERATIONS -----";
        cout << "\n1. Insert new node";
        cout << "\n2. Find number of nodes in longest path from root";
        cout << "\n3. Find minimum data value in the tree";
        cout << "\n4. Mirror the tree";
        cout << "\n5. Search a value";
        cout << "\n6. Exit";
        cout << "\nEnter your choice: ";
        cin >> choice;

        switch (choice) {
        case 1:
            cout << "Enter value to insert: ";
            cin >> value;
            root = insert(root, value);
            break;
        case 2:
            cout << "Longest path from root (Height): " << longestPath(root);
            break;
        case 3:
            cout << "Minimum value in the tree: " << findMin(root);
            break;
        case 4:
            mirror(root);
            cout << "Tree has been mirrored.";
            break;
        case 5:
            cout << "Enter value to search: ";
            cin >> value;
            if (search(root, value))
                cout << "Value found!";
            else
                cout << "Value not found.";
            break;
        case 6:
            cout << "Exiting...";
            break;
        default:
            cout << "Invalid choice!";
        }

    } while (choice != 6);

 return 0;
}
