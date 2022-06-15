void main() {
  final stack = Stack();
  stack.push('facebook');
  stack.push('google');
  stack.push('udemy');
  stack.push('hackerrank');
  stack.push('linkedin');
  stack.pop();
  stack.pop();

  stack.printStack();
  print(stack.peek());
}

class Stack {
  late int length;
  late List data;
  Stack() {
    data = [];
    length = 0;
  }

  void printStack() {
    for (var i = length - 1; i >= 0; i--) {
      print(data[i]);
    }
  }

  dynamic peek() {
    if (length == 0) return 'empty stack';
    return data[length - 1];
  }

  void push(value) {
    data.add(value);
    length++;
  }

  void pop() {
    if (length == 0) return;
    data.remove(data[length - 1]);
    length--;
  }
}
