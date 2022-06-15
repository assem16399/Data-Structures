void main() {

}

int? firstRec(List myList){
  
  Map<int,bool> myMap={};
  for(var i = 0;i<myList.length;i++){
    if(myMap.containsKey(myList[i])){
      myMap[myList[i]]=true;
      return myList[i];
    }
    else{
      myMap[myList[i]]=false;  
    }
  } 
  return null;
}
