void main() {
  var name='My Name Is Aasem';
  
  print(mergeSortedLists([],[]));
}


List mergeSortedLists(List firstList, List secondList) {
    if (firstList.isEmpty) {
        return secondList;
    }
    if (secondList.isEmpty) {
        return firstList;
    }
    var firstListPointer = 0;
    var secondListPointer = 0;
    List mergedList =[];
    while (mergedList.length < (firstList.length + secondList.length)) {
        if (firstListPointer >= firstList.length) {
            mergedList.add(secondList[secondListPointer]);
            secondListPointer++;
        }
        else if (secondListPointer >= secondList.length) {
            mergedList.add(firstList[firstListPointer]);
            firstListPointer++;
        }
        else 
        {
            if (firstList[firstListPointer] < secondList[secondListPointer]) {
                mergedList.add(firstList[firstListPointer]);
                firstListPointer++;
            } else {
                mergedList.add(secondList[secondListPointer]);
                secondListPointer++;
            }
        }
    }
    return mergedList;
}
