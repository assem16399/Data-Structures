void main() {
  Map<String,dynamic> user={
            'name':'Aasem',
            'age':21,
            'isHappy':true,
            'what':(){
              print('what!!');
            }
  };
  
  
  print(user['name']); //O(1)
  
  user['address']='Egypt'; //O(1)
  
  user['what'](); //O(1)
}
