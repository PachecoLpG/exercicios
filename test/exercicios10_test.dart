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

//TODO arvore;

class Node {
  int valor;
  late Node esquerda = Node(valor: valor);
  late Node direita = Node(valor: valor);

  Node({required this.valor});
}

void ordened(List<int> input) {
  input.sort();
  print(input);
}

void preOrdened(List<int> input, Node root, int start) {}

void main() {}
