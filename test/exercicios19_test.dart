import 'dart:math';

/// Desenvolva um programa que simule um jogo da velha
///
/// - Deve monitorar de quem é a vez de jogar
/// - Deve marcar a jogada na posicao indicada
/// - Deve indicar se há um ganhador
/// - Deve indicar se ainda é possível continuar jogando
/// - Não é necessário elaborar um cli
///
/// Para conferir o seu funcionamento, desenvolva uma função
/// em que dois jogadores automaticamente realizam jogadas
/// em locais aleatórios

List<String> campo = <String>['-', '-', '-', '-', '-', '-', '-', '-', '-'];

void main() async {
  generateGame();
}

void generateGame() {
  int i = 0;
  bool winner = false;
  while (campo.contains('-')) {
    vezX();
    printCampo();
    i++;
    if (i != 9) {
      vexO();
    }
    printCampo();
    i++;
    if (i > 5) {
      winner = verifyWinner();
      if (i == 9 && winner == false) {
        print('Empate');
        return;
      }
      if (winner) {
        print('Fim de jogo');
        return;
      }
    }
  }
}

void vezX() {
  print('Vez do X');
  int localCampo = randonValue();
  if (campo[localCampo].contains('-')) {
    campo[localCampo] = 'X';
  } else {
    vezX();
  }
}

void vexO() {
  print('Vez do O');
  bool marcado = false;
  while (!marcado) {
    int localCampo = randonValue();
    if (campo[localCampo].contains('-')) {
      campo[localCampo] = 'O';
      marcado = true;
    }
  }
}

void printCampo() {
  print("1 - [${campo[0]} ${campo[1]} ${campo[2]}]");
  print("2 - [${campo[3]} ${campo[4]} ${campo[5]}]");
  print("3 - [${campo[6]} ${campo[7]} ${campo[8]}]");
}

int randonValue() => Random().nextInt(9);

bool verifyWinner() {
  if (campo[0] == campo[1] && campo[1] == campo[2] && campo[0] != '-') {
    print('Vencedor: ${campo[0]}');
    return true;
  }
  if (campo[3] == campo[4] && campo[4] == campo[5] && campo[3] != '-') {
    print('Vencedor: ${campo[3]}');
    return true;
  }
  if (campo[6] == campo[7] && campo[7] == campo[8] && campo[6] != '-') {
    print('Vencedor: ${campo[6]}');
    return true;
  }
  if (campo[0] == campo[3] && campo[3] == campo[6] && campo[0] != '-') {
    print('Vencedor: ${campo[0]}');
    return true;
  }
  if (campo[1] == campo[4] && campo[4] == campo[7] && campo[1] != '-') {
    print('Vencedor: ${campo[1]}');
    return true;
  }
  if (campo[2] == campo[5] && campo[5] == campo[8] && campo[2] != '-') {
    print('Vencedor: ${campo[2]}');
    return true;
  }
  if (campo[0] == campo[4] && campo[4] == campo[8] && campo[0] != '-') {
    print('Vencedor: ${campo[0]}');
    return true;
  }
  if (campo[2] == campo[4] && campo[4] == campo[6] && campo[2] != '-') {
    print('Vencedor: ${campo[2]}');
    return true;
  }
  return false;
}
