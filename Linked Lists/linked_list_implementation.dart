void main() {
	
  /*final myLinkedList = {
  //The Head Node of the Linked List which is a map
  'head': {
   
    //The value of the node
    'value': 10,
   
    //The pointer of the node that points to next node
    'next': {
   
      // The Value of the next node
      'value': 5,

      // The pointer of it which points to the last node (tail)
      'next': {'value': 16, 'next': null }, 
    },
  },
};*/

  MyLinkedList list = MyLinkedList(10);
  list.append(5);
  list.append(16);
  list.append(12);
  list.append(20);
  list.preppend(1);
  list.preppend(0);
  print(list.head);
}
class MyLinkedList {
  // The starting value of the list (head node value)
  dynamic value;
  // The head node itself
  dynamic head;
  // The tail node
  dynamic tail;
  // (optional) the length of the linked list
  late int length;

  // Constructor
  MyLinkedList(this.value) {
    head = Node(value);
    tail = head;
    length = 1;
  }

  append(Object? value){
        Node newNode=Node(value);
        tail.next=newNode;
        tail=newNode;
        length++;
  }
  
  preppend(value){ 
    Node newNode=Node(value);
    newNode.next=head;
    head=newNode;
    length++;
    
  }
  void insert(int index,value){
    if(index>=length) return;
    if(index==0) {
      preppend(value);
      return;
    }
    if(index==length-1) {
      append(value);
      return;
    }
    var currentNode = head;
    var currentIndex = 0;
    while(currentNode!=null){
      if(index-currentIndex==1){
        final newNode=Node(value);
        newNode.next=currentNode.next;
        currentNode.next=newNode;
        break;
      }
      currentNode=currentNode.next;
      currentIndex++;
    }
    length++;
  }
  void delete(int index){
     if(index>=length) return;
    
    if(index==0){
      head=head.next;
      length--;
    }
     var currentNode = head;
     var currentIndex = 0;
     while(currentNode!=null){
       if(index-currentIndex==1){ 
         currentNode.next=currentNode.next.next;
         break;
      }
      currentNode=currentNode.next;
      currentIndex++;
    }
    length--;
  }
}

class Node{
  dynamic value;
  dynamic next;
  Node(myValue){
    value = myValue;
    next=null;
  }
  
  @override
  String toString(){
    return 'value: $value next: ==>($next)';
  }
}
