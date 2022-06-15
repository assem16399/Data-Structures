void main() {
  var name='My Name Is Aasem';
  
  print(reverseString3(name)??'null');
}

String? reverseString(String s){
  if(s.length<2) return s;
  
  List myList=[];
  for(var j =s.length-1;j>=0;j--){
    myList.add(s[j]);
  }
  return myList.join('');
}


String? reverseString2(String s){
  if(s.length<2) return s;
  
  return s.split('').reversed.join('');
   
}

String? reverseString3(String s)=>s.split('').reversed.join('');
