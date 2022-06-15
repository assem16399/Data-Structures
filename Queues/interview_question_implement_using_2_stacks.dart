void main() {
  final crazyQueue = CrazyQueue(); 
  crazyQueue.enqueue('1');
  crazyQueue.enqueue('2');
  crazyQueue.enqueue('3');
  crazyQueue.dequeue();
  crazyQueue.dequeue();
  print(crazyQueue.peek());
  print(crazyQueue.length);
}

class CrazyQueue {
  late int length;
  late List dataBucket1;
  late List dataBucket2;

  CrazyQueue() {
    dataBucket1 = [];
    dataBucket2 = [];
    length = 0;
  }

  dynamic peek() {
    if(length==0) return 'empty Queue';
    final d1Len=dataBucket1.length;
    for(var i = d1Len-1; i>=0; i--){
      dataBucket2.add(dataBucket1[i]);
      dataBucket1.removeLast();
    }
    return dataBucket2.last;
  }

  void enqueue(value) {
    final d2Len=dataBucket2.length;
    for(var i = d2Len-1; i>=0; i--){
      dataBucket1.add(dataBucket2[i]);
      dataBucket2.removeLast();
    }
    dataBucket1.add(value);
    length++;
  }

  void dequeue() {
    if (length == 0) return;
    final d1Len=dataBucket1.length;
    for(var i = d1Len-1; i>=0; i--){
      dataBucket2.add(dataBucket1[i]);
      dataBucket1.removeLast();
    }
    dataBucket2.removeLast();
    length--;
  }
  
}
