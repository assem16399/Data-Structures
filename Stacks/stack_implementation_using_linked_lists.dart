void main() {
  final stack = Stack();
  stack.push('facebook');
  stack.push('google');
  stack.push('udemy');
  stack.push('hackerrank');
  stack.push('linkedin');
  stack.printStack();
}

class Node {
  dynamic value;
  Node? next;
  Node(value) {
    this.value = value;
    next = null;
  }
}

class Stack {
  Node? top;
  Node? bottom;
  late int length;

  Stack() {
    top = null;
    bottom = null;
    length = 0;
  }

  void printStack() {
    Node? currentValue=top;
    while(currentValue!=null){
      print(currentValue.value);
      currentValue=currentValue.next;
    }
  }

  dynamic peek() {
    if(length==0) return 'empty stack';
    return top!.value;
  }

  void push(value) {
    final newNode = Node(value);
    if (length == 0) {
      top = newNode;
      bottom = newNode;
      length++;
      return;
    }
    newNode.next = top;
    top = newNode;
    length++;
  }

  void pop() {
    if (length == 0) return;
    top = top!.next;
    if(length==1){
      bottom==null;
    }
    length--;
    
  }
}
