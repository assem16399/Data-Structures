
void main() {
 final graph=Graph();
  graph.addNode(0);
  graph.addNode(1);
  graph.addNode(2);
  graph.addNode(3);
  graph.addNode(4);
  graph.addNode(5);
  graph.addNode(6);
  
  graph.addConnections(3,1);
  graph.addConnections(3,4);
  graph.addConnections(4,2);
  graph.addConnections(4,5);
  graph.addConnections(1,2);
  graph.addConnections(1,0);
  graph.addConnections(0,2);
  graph.addConnections(6,5);
  
    print(graph.adjecentList); 

  
}

class Graph{
  late Map<dynamic,List<dynamic>> adjecentList;
  late int nodesLen;
  Graph(){
    adjecentList={};
    nodesLen=0;
  }
  
  addNode(int node){
    if(adjecentList.containsKey(node)) return;
    adjecentList[node]=[];
    nodesLen++;
  }
  addConnections(int node1,int node2){
    if(!adjecentList.containsKey(node1)||!adjecentList.containsKey(node1)){
      return;
    }
    adjecentList[node1]!.add(node2);
    adjecentList[node2]!.add(node1);
  }
}
