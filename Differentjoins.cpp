#include <iostream>
#include <list>
#include <string>
#include <fstream>
using namespace std;

struct Data { // class for HASH table
    int index;
    string text;
    Data* next;
};
struct Node { // list1 1 for merge join
    int number;
    string text;
    Node *next;
};
struct Node1 { // list 2 for merge join
    int number;
    string text;
    Node1 *next;
};
/* ------------------ FUNCTIONS ------------------------------*/
bool IsEmpty(Node *head);
bool IsEmpty1(Node1 *head);
void insertAsfirstEl(Node *&head, Node *&last, int number, string text);
void insertAsfirstEl1(Node1 *&head, Node1 *&last, int number, string text);
void insert(Node *&head, Node *&last, int number, string text);
void insert1(Node1 *&head, Node1 *&last, int number, string text);
void showList(Node *current);
void showList1(Node1 *current);
void mergeJoin(ifstream& file1, ifstream& file2, ofstream& output);
void innerLoopJoin(ifstream& file1, ifstream& file2, ofstream& output);



// -------------------A HASH KEY GENERATOR FUNCTION----------------------
int hashKey(int);
void hashTable(ifstream& file1, ofstream& output, Data[]);
void hashJoin(ifstream& file2, ofstream& output, Data[]);

void join(ifstream& file1, ifstream& file2, ofstream& output, int joinType);

int main() {
    ifstream file1, file2;
    ofstream output;

     file1.open("file directory");//("cts.dump.csv");
   file2.open("file directory");
   output.open("file directory");
    int joinType;
    cout<<"Chose join type; 1 for merge, 2 for Hash, 3 for innerLoop:";
    cin>> joinType;
    join(file1, file2, output, joinType);

    file1.close();
    file2.close();
    output.close();

    return 0;
}

//-------------------------MERGE JOIN------------------------------
bool isEmpty(Node *head) { // checks if list one is empty
    if(head == NULL)
        return 1;
    else
        return 0;
}
bool isEmpty1(Node1 *head) { // checks if list 2 is empty
    if(head == NULL)
        return 1;
    else
        return 0;
}

void insertAsfirstEl(Node *&head, Node *&last, int number, string text) { // inserts a node as first node  for list 1
    Node *temp = new Node;
    temp->number = number;
    temp->text = text;
    temp->next = NULL;
    head = temp;
    last = temp;

}
void insertAsfirstEl1(Node1 *&head, Node1 *&last, int number, string text) { // inserts a node as first node  for list 2
    Node1 *temp = new Node1;
    temp->number = number;
    temp->text = text;
    temp->next = NULL;
    head = temp;
    last = temp;

}

void insert(Node *&head, Node *&last, int number, string text) { // inserts the nodes from 1st file into 1st list
    if(isEmpty(head))
        insertAsfirstEl(head, last, number, text);
    else {
        Node *temp = new Node;
        temp->number = number;
        temp->text = text;
        temp->next = NULL;
        last->next = temp;
        last = temp;
    }
}

void insert1(Node1 *&head, Node1 *&last, int number, string text) { // inserts the nodes from 2nd file into 2nd list
    if(isEmpty1(head))
        insertAsfirstEl1(head, last, number, text);
    else {
        Node1 *temp = new Node1;
        temp->number = number;
        temp->text = text;
        temp->next = NULL;
        last->next = temp;
        last = temp;
    }
}

void showList(Node *current) { // shows the nodes in 2nd file
    if(isEmpty(current))
        cout<<"List 1 is empty. Nothing to show."<<endl;
    else {
        cout<<"---------------------------------------"<<endl;
        cout<<"List 1 contains: "<<endl;
        while(current!=NULL) {
            cout<<current->number<<" "<< current->text<<endl;
            current = current->next;
        }
        cout<<endl<<"---------------------------------------"<<endl;
    }
}
void showList1(Node1 *current) { // shows the nodes in 2nd file
    if(isEmpty1(current))
        cout<<"List 2 is empty. Nothing to show."<<endl;
    else {
        cout<<"---------------------------------------"<<endl;
        cout<<"List 2 contains: "<<endl;
        while(current!=NULL) {
            cout<<current->number<<" "<< current->text<<endl;
            current = current->next;
        }
        cout<<endl<<"---------------------------------------"<<endl;
    }
}


void join(ifstream& file1, ifstream& file2, ofstream& output, int joinType){
    Data myArray[100];
    Data* head = NULL;
    if(joinType == 1){
    mergeJoin(file1, file2, output);
    }
    if(joinType == 2){
        hashTable(file1, output, myArray);
        hashJoin(file2, output, myArray);// creates hash table from 2 files
    }
    if(joinType == 3){
        innerLoopJoin(file1, file2, output);
    }
}

    //isThere = search(index,text,myArray); // looks for an entry in the hash table with wanted index and text data


void mergeJoin(ifstream& file1, ifstream& file2, ofstream& output){
    Node *head = NULL;
    Node *temp = NULL;
    Node1 *head1 = NULL;
    Node1 *temp1 = NULL;
   int index1, index2;
   string text1, text2;

   while(!file1.eof()){
    file1>>index1;
    getline(file1, text1); // unique indexes
    insert(head,temp,index1, text1);
   }

    while(!file2.eof()){
    file2>>index2;
    getline(file2, text2); // may have duplicates
    insert1(head1,temp1,index2, text2);
   }

  while(head->next!=NULL){
        while(head->number <= head1->number){
                if(head->number == head1->number){
                    output<<head->number<<" "<<head->text<<" "<<head1->text<<endl;
                    head1 = head1->next;
                }

        if(head1->number <= head->number){
            if(head->number == head1->number){
                    continue;
            }
            else
              head = head->next;
        }
        else{
            head = head->next;
        }
    }
  }

}


    //----------------------------------HASH key (2)-----------------------------------------
int hashKey(int num) {
    return num%100;
}

void hashTable(ifstream& file1, ofstream& output, Data myArray[]) {

    int index,key;
    string text;
    Data* head = NULL;
    do {
        file1>>index;
        getline(file1,text);
        Data* obj = new Data();
        obj->index = index;
        key = hashKey(obj->index);
        head = &myArray[key];
        Data* node = new Data();
        head->next = node;
        node->index = index;
        node->text = text;
        node->next = NULL;
    } while(!file1.eof());
}


void hashJoin(ifstream& file2, ofstream& output, Data myArray[]){
     Data* head = NULL;
     int index, key;
     string text;
     while(!file2.eof()){
     file2>>index;
     getline(file2, text);
     key = hashKey(index);
     head = &myArray[key];
     if(head->next->index == index){
          output<<index<<" "<<head->next->text<<" "<<text<<endl;
        head = head->next;
     }
     else{
            head = head->next->next;
        }
     }

}
//-----------------------------Inner-Loop-Join (3)-----------------------

void innerLoopJoin(ifstream& file1, ifstream& file2, ofstream& output){
     Node *head = NULL;
    Node *temp = NULL;
    Node1 *head1 = NULL;
    Node1 *temp1 = NULL;
   int index1, index2;
   string text1, text2;

   while(!file1.eof()){
    file1>>index1;
    getline(file1, text1); // unique indexes
    insert(head,temp,index1, text1);
   }

    while(!file2.eof()){
    file2>>index2;
    getline(file2, text2); // may have duplicates
    insert1(head1,temp1,index2, text2);
   }

   temp = head;
   temp1 = head1;
   while(temp->next != NULL){
        while(temp1->next != NULL){
            if(temp->number == temp1->number){
                cout<<"head->number: "<<head->number<<endl;
                cout<<"head1->number: "<<head1->number<<endl;
                output<<temp->number<<" "<<temp->text<<" "<<head1->text<<endl;
                temp1=temp1->next;
            }
            else{
                cout<<"head->number: "<<head->number<<endl;
                cout<<"head1->number: "<<head1->number<<endl;
                temp1 = temp1->next;
            }
        }
        temp1 = head1 ;
        temp = temp->next;
        cout<<"outer loop head value: "<<head->number<<endl;
   }
}
