// Dado uma List<int>, criar uma função que construa uma árvore binária
// com o primeiro valor sendo a raiz e
// com os nós da subtree da esquerda sendo valores menores que o da raiz
// e os maiores ficam na subtree da direita
//
// Criar funções que retornem a lista de nós em ordem, pré-ordem e pós-ordem
// Por exemplo, para a seguinte List<int> de entrada

List<int> input = <int>[30, 20, 40, 15, 25, 35, 50, 5, 18, 45, 60];
// A sequencia será
// Em ordem: [5, 15, 18, 20, 25, 30, 35, 40, 45, 50, 60]
// Pré-ordem: [30, 20, 15, 5, 18, 25, 40, 35, 50, 45, 60]
// Pós-ordem: [5, 18, 15, 25, 20, 35, 45, 60, 50, 40, 30]

//https://iq.opengenus.org/binary-tree-traversals-inorder-preorder-postorder/

//TODO função para gerar arvore
class Node {
  int? valor;
  Node? esquerda;
  Node? direita;

  Node([this.valor]);
}

List<int> inOrder(Node? node) {
  List<int> output = <int>[];
  if (node == null) {
    return output;
  }
  output = output + inOrder(node.esquerda);
  output.add(node.valor!);
  output = output + inOrder(node.direita);
  return output;
}

List<int> preOrder(Node? node) {
  List<int> output = <int>[];
  if (node == null) {
    return output;
  }
  output.add(node.valor!);
  output = output + preOrder(node.esquerda);
  output = output + preOrder(node.direita);
  return output;
}

List<int> postOrder(Node? node) {
  List<int> output = <int>[];
  if (node == null) {
    return output;
  }
  output = output + postOrder(node.esquerda);
  output = output + postOrder(node.direita);
  output.add(node.valor!);
  return output;
}

void main() {
  List<int> inOrderList;
  List<int> preOrderList;
  List<int> postOrderList;

  Node root = Node();

  root = Node(30);
  root.esquerda = Node(20);
  root.esquerda!.esquerda = Node(15);
  root.esquerda!.esquerda!.esquerda = Node(5);
  root.esquerda!.esquerda!.direita = Node(18);
  root.esquerda!.direita = Node(25);
  root.direita = Node(40);
  root.direita!.esquerda = Node(35);
  root.direita!.direita = Node(50);
  root.direita!.direita!.esquerda = Node(45);
  root.direita!.direita!.direita = Node(60);

  print('INORDER');
  inOrderList = inOrder(root);
  print(inOrderList);

  print('PREORDER');
  preOrderList = preOrder(root);
  print(preOrderList);

  print('POSTORDER');
  postOrderList = postOrder(root);
  print(postOrderList);
}
