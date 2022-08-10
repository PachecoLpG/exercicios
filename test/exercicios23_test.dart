import 'dart:math';

/// Simule um combate entre dois territorios do Risk
///
/// Cada [Territorio] deverá ter uma [Cor] e um número de exércitos.
///
/// Ao realizar combate
///   - Deverá ser utilizado um dado de 6 lados
///   - O defensor poderá defender com no máximo 2 exércitos
///   - O atacante poderá atacar com no máximo 3 exércitos e
/// deverá manter um exercício no seu território ao atacar
///   - É obtido o resultado dos dados de acordo com cada exército
///   - Deverá ser comparado os dados um por um em ordem do maior ao menor
///   - Em caso de empate, considera-se vitória do defensor
///   - Caso o defensor fique sem tropa, move-se uma tropa do território
/// do atacante para o defensor e muda-se a cor do território
///

enum Color {
  red,
  green,
  blue,
  yellow,
  purple;

  String get nome {
    switch (this) {
      case Color.blue:
        return 'azul';
      case Color.red:
        return 'vermelho';
      case Color.green:
        return 'amarelo';
      case Color.yellow:
        return 'yellow';
      case Color.purple:
        return 'roxo';
    }
  }
}

class Territorio {
  int exercicitos;
  Color cor = Color.yellow;

  Territorio({required this.exercicitos, required this.cor});
}

int throwDice() {
  return (Random().nextInt(5)) + 1;
}

void war({required Territorio team01, required Territorio team02}) {}

void main() {
  Territorio team01 = Territorio(exercicitos: 5, cor: Color.red);

  Territorio team02 = Territorio(exercicitos: 3, cor: Color.blue);

  war(team01: team01, team02: team02);
}
