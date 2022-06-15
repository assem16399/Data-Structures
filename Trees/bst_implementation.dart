void main() {
  final bst = BST();
  bst.insert(10);
  bst.insert(20);
  bst.insert(5);
  bst.insert(25);
  bst.insert(1);
  bst.insert(7);
  bst.insert(15);
  bst.insert(11);  
  bst.insert(16);
  bst.remove(10);

  print(bst.lookup(10));// print null
 
}

class Node {
  dynamic value;
  Node? left;
  Node? right;

  Node(value) {
    this.value = value;
    left = null;
    right = null;
  }
}

class BST {
  Node? root;

  BST() {
    root = null;
  }

  void insert(value) {
    // Create a new node
    final newNode = Node(value);

    // Check if the tree is empty
    root ??= newNode;
    if (root!.value == value) {
      return; 
    }
    
    ///////////////// Start traversing to insert///////////////////
  
    // Make the parent/current node is the root node
    Node? parentNode = root;
    
    // Create a loop that will traverse until it finds a place to inset
    while (true) {
      // Check for dublicated
      if(value == parentNode!.value){
        print('dublicates are not allowed');
        return; 
      }
      // Check if the inserted value is bigger than the Current Node
      if(value>parentNode.value){
        
        // Check if the right edge is empty or not
        if(parentNode.right!=null){
          // Move the Current/Parent Node to the right 
          parentNode=parentNode.right;
        }
        else{
          // if the Edge is empty insert the new node and break
          parentNode.right=newNode;
        
          return;
        }
      }
      // Check if the inserted value is smaller than the Current Node
      else{
        
        // Check if the left edge is empty or not
        if(parentNode.left!=null){
          
          // Move the Current/Parent Node to the left 
          parentNode=parentNode.left;
        }
        else{
          
          // if the Edge is empty insert the new node and break
          parentNode.left=newNode;
        
          return;
        }
      }
    }
    
  }

  Node? lookup(value) {
    //Check if the Tree is empty
   if(root==null) return null;
   
    // create the current and make it equal to the root 
    Node? currentNode=root;
    
    // Create a loop to traverse over the tree until the current is empty
    while(currentNode!=null){
      
      // Check if the current Node value is equal to my wanted value 
      if(value==currentNode.value){
        return currentNode;
      }
      
      // Check if the inserted value is bigger than the Current Node
      if(value>currentNode.value){
         // Advance the current Node to the right
          currentNode=currentNode.right;
      }
      // if the value smaller than the current Node value then do
      else{
        // Advance the Current Node to the left
          currentNode=currentNode.left;
      }
    }
    return null;
  }

  void _removeRoot(){
    
    if(root!.right==null){
      root=root!.left;
     
    }
    else if(root!.right!.left==null){
      //unwantedNode.right!.left=unwantedNode.left
      root!.right!.left=root!.left;
      root=root!.right;
    }
    else{
      //get the  left Most and its parent
        Node? leftMost=root!.right!.left;
        Node? leftMostParent=root!.right;
        while(leftMost!.left!=null){
          leftMostParent=leftMost;
          leftMost=leftMost.left;
        }
     
        leftMostParent!.left=leftMost.right;
        leftMost.left=root!.left;
        leftMost.right=root!.right;
      
        root=leftMost;
    }
  }
  void remove(value) {
    if(value==root!.value){
      
      _removeRoot();
      return;
    }
    final unwantedNode = lookup(value);
    if (unwantedNode == null) return;
    
    
    Node? parentNode = root;
    late bool _isLeftOfParent;
    
    // get the parent node of our unwanted node
    while (true) {
      if (value == parentNode!.left!.value) {
        _isLeftOfParent = true;
        break;
      } else if (value == parentNode.right!.value) {
        _isLeftOfParent = false;
        break;
      } else {
        if (value > parentNode.value) {
          if (parentNode.right != null) {
            parentNode = parentNode.right;
          } else {
            break;
          }
        } else {
          if (parentNode.left != null) {
            parentNode = parentNode.left;
          } else {
            break;
          }
        }
      }
    }
    // Check if the unwanted left or right node of its parent
    if(_isLeftOfParent){
      
      // Case #1 the unwated node is a leaf node
      if(unwantedNode.left==null&&unwantedNode.right==null){
        parentNode.left=null;
      }
      // Case #2 the unwated node's right doesn't have a left
      if(unwantedNode.right!.left==null){
        parentNode.left=unwantedNode.right;
        unwantedNode.right!.left=unwantedNode.left;
      }
      // Case #3 the unwated node's right does have a left :(
      else{
        
        //get the  left Most and its parent
        Node? leftMost=unwantedNode.right!.left;
        Node? leftMostParent=unwantedNode.right;
        
        while(leftMost!.left!=null){
          leftMostParent=leftMost;
          leftMost=leftMost.left;
        }
        leftMostParent!.left=leftMost.right;
        leftMost.left=unwantedNode.left;
        leftMost.right=unwantedNode.right;
        
        parentNode.left=leftMost;
      }
    }
    //right side of the parent
    else{
      
       // Case #1 the unwated node is a leaf node
       if(unwantedNode.left==null&&unwantedNode.right==null){
        parentNode.right=null;
      }
      // Case #2 the unwated node's right doesn't have a left
      if(unwantedNode.right!.left==null){
        parentNode.right=unwantedNode.right;
        unwantedNode.right!.left=unwantedNode.left;
      }
      // Case #3 the unwated node's right does have a left :(
      else{
        
        //get the  left Most and its parent
        Node? leftMost=unwantedNode.right!.left;
        Node? leftMostParent=unwantedNode.right;
        
        while(leftMost!.left!=null){
          leftMostParent=leftMost;
          leftMost=leftMost.left;
        }
        leftMostParent!.left=leftMost.right;
        leftMost.left=unwantedNode.left;
        leftMost.right=unwantedNode.right;
        parentNode.right=leftMost;
      }
    }
  }

 List breadthFirstSearch(){
  List treeValues=[];
  List childrenRefQueue=[];
  Node? currentNode=root;
   childrenRefQueue.add(currentNode);
   
    while (childrenRefQueue.isNotEmpty){
      currentNode = childrenRefQueue[0];
      childrenRefQueue.removeAt(0);
      if(currentNode!.left!=null){
       childrenRefQueue.add(currentNode.left);
      }
      if(currentNode.right!=null){
       childrenRefQueue.add(currentNode.right);
      }
      treeValues.add(currentNode.value);
    }
  return treeValues;
  }
}

