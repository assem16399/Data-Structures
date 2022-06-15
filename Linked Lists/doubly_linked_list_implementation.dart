void main() {
	print('Hello World!');
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
        newNode.prev=tail;
        tail=newNode;
        length++;
  }
  
  preppend(value){ 
    Node newNode=Node(value);
    newNode.next=head;
    head.prev=newNode;
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
    
    final newNode=Node(value);
    var leaderNode=traverseToThisNode(index-1);
    
    final holder=leaderNode.next;
    leaderNode.next=newNode;
    newNode.next=holder;
    holder.prev=newNode;
    newNode.prev=leaderNode;
    
    length++;
  }
  
  Node traverseToThisNode(int index){
    Node currentNode=head;
    var currentIndex=0;
    while(currentIndex<index){
      currentIndex++;
      currentNode=currentNode.next;
    }
    return currentNode;
  }
  
  
  void delete(int index){
     if(index>=length) return;
    
    if(index==0){
      head=head.next;
      head.prev=null;
      length--;
      return;
    }
    if(index==length-1){
      final leaderNode=tail.prev;
      leaderNode.next=tail.next;
      tail=leaderNode;
      length--;
      return;
    }
    
    var leaderNode=traverseToThisNode(index-1);
    
    final unWantedNode=leaderNode.next;
    final holder=unWantedNode.next;
    holder.prev=leaderNode;
    leaderNode.next=holder;
    length--;
  }

  MyLinkedList reverse(){
  final reversedList = MyLinkedList(head.value);
  var currentNode=head.next;
    while(currentNode != null){
      
      reversedList.preppend(currentNode.value);
      currentNode=currentNode.next;
    }
    return reversedList;
  }


  MyLinkedList reverse2(){
  var prev=null;
  var currentNode=head;
  var next=null;
    while(currentNode != null){
      next=currentNode.next;
      currentNode.next=prev;
      prev=currentNode;
      currentNode=next;
    }
    return prev;
  }
}

class Node{
  dynamic value;
  dynamic next;
  dynamic prev;
  Node(myValue){
    value = myValue;
    next=null;
    prev=null;
  }
  
  @override
  String toString(){
   return ' ($value)==>$next)';
    // return ' $prev<== ($value))';
  }
}
