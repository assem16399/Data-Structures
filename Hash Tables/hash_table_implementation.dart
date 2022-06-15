void main() {

  final map=HashTable(size:4);
  
  map.setData('name','Aasem');
  map.setData('age','21');
  map.setData('job','Software Engineer');
  map.setData('address','Egypt');
  

  print(map.keys());
  print(map.data);
}


class HashTable{
  List? data;
  
  
  HashTable({required int size}){
  
   data=List<dynamic>.generate(size,(_){return null;},growable: false);

    //                                       bucket        bucket        bucket
    // so our data will look like this: [['key':value],['key':value],['key':value],]

  }
  
  int _hashFunctuion(String key){
    var hash=0;
    for(var i = 0;i<key.length;i++){
     hash=(hash + key.codeUnitAt(i) * i) % data!.length;
    }
    
    return hash;
  }
  
  void setData(String key,dynamic value){
   final address = _hashFunctuion(key);
   if(data![address]==null)
    {
      data![address]=[];
    }
    data![address].add([key,value]);
  }
  
  dynamic getData(String key){
    final address = _hashFunctuion(key);
    final currentBucket=data![address];
    if(currentBucket==null) return null;
    if(currentBucket.length==1) return currentBucket[0][1];
    else
    {
         
         for(var i = 0;i<currentBucket.length;i++){
             if(currentBucket[i][0]==key)
             {
              return currentBucket[i][1];
             }
         }
    }
  
  }

  List<dynamic> keys(){
  final keysList=[];
  if(data!.length==0) return keysList;
  for(var i = 0;i<data!.length;i++)
  {
     if(data![i]!=null){
        if (data![i].length > 1) {
            for (var j = 0; j < data![i].length; j++) {
              keysList.add(data![i][j][0]);
            }
          }
          else
       keysList.add(data![i][0][0]);
     }
  }
  return keysList;
  }
}
