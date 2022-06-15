void main() {
  final arr1 = MyArray();

  arr1.pushItem(item: 'Aasem');

  arr1.pushItem(item: 'Ahmed');

 
  arr1.pushItem(item: 'Yasser');
  arr1.deleteItem(2);
  arr1.pushItem(item: 'Ahmed');


  print(arr1.data);
  print(arr1.length);
}

class MyArray {
  int length = 0;
  Map<int, dynamic> data = {};

  dynamic getItemOfIndex({required int index}) {
    return data[index];
  }

  void pushItem({required dynamic item}) {
    data[length] = item;
    length++;
  }

  void popItem() {
    if (length == 0) return;
    data[length - 1] = null;
    length--;
  }

  void deleteItem(int index) {
    if (index >= length) return;
    shiftItems(index);
    data[length - 1] = null;
    length--;
  }

  void shiftItems(int index) {
    for (var i = index; i < length - 1; i++) {
      data[i] = data[i + 1];
    }
  }
}
