#include <iostream>
using namespace std;

class Node {
public:
    int data;
    Node* left;
    Node* right;

    Node(int val) {
        data = val;
        left = right = nullptr;
    }
};

class BST {
    Node* root; 

    
    Node* insert(Node* node, int val) {
        if (!node) return new Node(val);  
        if (val < node->data)
            node->left = insert(node->left, val);  
        else
            node->right = insert(node->right, val);  
        return node;
    }

   
    void inorder(Node* node) {
        if (!node) return;
        inorder(node->left);
        cout << node->data << " ";
        inorder(node->right);
    }

    
    int height(Node* node) {
        if (!node) return 0;
        int leftH = height(node->left);
        int rightH = height(node->right);
        return 1 + max(leftH, rightH);
    }

   
    int findMin(Node* node) {
        if (!node) return -1;
        while (node->left)
            node = node->left; 
        return node->data;
    }

   
    void mirror(Node* node) {
        if (!node) return;
        mirror(node->left);
        mirror(node->right);
        swap(node->left, node->right);
    }

    
    bool search(Node* node, int val) {
        if (!node) return false;
        if (val == node->data) return true;
        if (val < node->data)
            return search(node->left, val);  
        else
            return search(node->right, val);  
    }

public:
    
    BST() {
        root = nullptr;
    }

    
    void insert(int val) {
        root = insert(root, val);
    }

    
    void displayInorder() {
        cout << "Inorder: ";
        inorder(root);
        cout << endl;
    }

    
    int getHeight() {
        return height(root);
    }

    
    int getMin() {
        return findMin(root);
    }

   
    void mirrorTree() {
        mirror(root);
    }

    
    bool find(int val) {
        return search(root, val);
    }
};


int main() {
    BST tree;
    int n, val;

    
    cout << "Enter number of values to insert: ";
    cin >> n;
    cout << "Enter values: ";
    for (int i = 0; i < n; i++) {
        cin >> val;
        tree.insert(val);
    }

    int ch;
   
    do {
        cout << "\n--- BST MENU ---\n";
        cout << "1. Insert Node\n";
        cout << "2. Inorder Display\n";
        cout << "3. Tree Height\n";
        cout << "4. Minimum Value\n";
        cout << "5. Mirror Tree\n";
        cout << "6. Search Value\n";
        cout << "7. Exit\n";
        cout << "Enter choice: ";
        cin >> ch;

        switch (ch) {
            case 1:
                cout << "Enter value to insert: ";
                cin >> val;
                tree.insert(val);
                break;
            case 2:
                tree.displayInorder();
                break;
            case 3:
                cout << "Height of tree: " << tree.getHeight() << endl;
                break;
            case 4:
                cout << "Minimum value: " << tree.getMin() << endl;
                break;
            case 5:
                tree.mirrorTree();
                cout << "Tree mirrored.\n";
                break;
            case 6:
                cout << "Enter value to search: ";
                cin >> val;
                if (tree.find(val))
                    cout << "Value found.\n";
                else
                    cout << "Value not found.\n";
                break;
            case 7:
                cout << "Exiting...\n";
                break;
            default:
                cout << "Invalid choice!\n";
        }
    } while (ch != 7);

return 0 ;
}
