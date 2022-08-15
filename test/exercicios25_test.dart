import 'dart:math';

/// Desenvolva um programa que simule um sorteio da Mega-Sena e compare com um
/// jogo de n números, retornando o número de acertos.
///
/// Reproduza a simulação para i iterações de forma que retorne a soma da
/// quantia de jogos que obteve determinado número de acertos. De forma que seja
/// possível calcular a porcentagem de acertos e compare com os valores
/// tabelados
///

int randomValue() => Random().nextInt(59) + 1;

List<int> gerarJogo(int quantidade) {
  List<int> jogo = <int>[];

  for (int i = 0; i < quantidade; i++) {
    jogo.add(randomValue());
  }

  for (int i in jogo) {
    if (jogo.every((int element) => element == i)) {
      jogo.clear();
      gerarJogo(quantidade);
    }
  }

  return jogo;
}

int verificarJogo(List<int> jogo, List<int> sorteio) {
  int acertos = 0;

  for (int i in jogo) {
    for (int j in sorteio) {
      if (i == j) {
        acertos++;
      }
    }
  }
  return acertos;
}

void simulacao(int interacoes) {
  List<int> jogo = <int>[];
  List<int> sorteio = <int>[];
  int qtt0 = 0, qtt1 = 0, qtt2 = 0, qtt3 = 0, qtt4 = 0, qtt5 = 0, qtt6 = 0;
  int acertos = 0;
  for (int i = 0; i < interacoes; i++) {
    jogo = gerarJogo(6);
    sorteio = gerarJogo(6);

    acertos = verificarJogo(jogo, sorteio);

    switch (acertos) {
      case 0:
        qtt0++;
        break;
      case 1:
        qtt1++;
        break;
      case 2:
        qtt2++;
        break;
      case 3:
        qtt3++;
        break;
      case 4:
        qtt4++;
        break;
      case 5:
        qtt5++;
        break;
      case 6:
        qtt6++;
    }
  }

  print("Simulação com $interacoes jogos: ");
  print('[0 Acertos] - [$qtt0]');
  print('[1 Acertos] - [$qtt1]');
  print('[2 Acertos] - [$qtt2]');
  print('[3 Acertos] - [$qtt3]');
  print('[4 Acertos] - [$qtt4]');
  print('[5 Acertos] - [$qtt5]');
  print('[6 Acertos] - [$qtt6]');
}

void main() {
  simulacao(100000);
}
