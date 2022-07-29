@Tags(<String>['ex15'])

import 'dart:math';

import 'package:test/scaffolding.dart';

/// Problema do aniversário
///
/// Escreva uma função que calcule a probabilidade de que em um conjunto de n pessoas,
/// duas ou mais compartilhem o mesmo dia/mês de aniversário, pelo modelo:
/// p(n) = 365! / ((365^n)*(365-n)!)
/// Para p(23) = 0.507
///
/// Escreva uma função que simule o problema, que crie x conjuntos de n pessoas com
/// datas aleatórias de aniversário e que faça a análise em todos os x conjuntos,
/// retornando a porcentagem de eventos simulados que possuem elementos repetidos.
///
/// Compare o resultado da primeira função com a segunda
///

num bDayProb(int n) => factorial(365) / ((pow(365, n)) * factorial(365 - n));

int factorial(int n) {
  if (n == 0) {
    return 1;
  }
  return n * factorial(n - 1);
}

void main() {
  test('deve calcular corretamente a probabilidade', () {
    int p = 3;
    num result = bDayProb(p);

    print(result.toStringAsFixed(5));
  });
}
