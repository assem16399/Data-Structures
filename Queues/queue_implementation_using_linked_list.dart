void main() {
	final queue = Queue();
  queue.enqueue('facebook');
  queue.enqueue('google');
  queue.enqueue('udemy');
  queue.enqueue('hackerrank');
  queue.enqueue('linkedin');
  queue.dequeue();
  queue.dequeue();
  queue.dequeue();
  queue.dequeue();
  queue.dequeue();
  print(queue.peek());
}
class Node {
  dynamic value;
  Node? next;
  Node(value) {
    this.value = value;
    next = null;
  }
}

class Queue {
  Node? first;
  Node? last;
  late int length;

  Queue() {
    first = null;
    last = null;
    length = 0;
  }

  

  dynamic peek() {
    if (length == 0) return 'empty queue';
    return first!.value;
  }

  void enqueue(value) {
    final newNode=Node(value);
    if(length==0)
    {
      first=newNode;
      last=newNode;
    }
    else{
      last!.next=newNode;
      last=newNode;
    }
    length++;
  }

  void dequeue() {
    if(length==0) return;
    if(length==1){last=null;} 
    first = first!.next;
    length--;
  }
}
