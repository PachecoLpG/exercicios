@Tags(<String>['ex15'])

import 'dart:math';

import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

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

num bDayProb(int n) {
  num p = pow((1 / 365), n);

  for (int i = (366 - n); i < 366; i++) {
    p *= i;
  }

  return 1 - p;
}

// int factorial(int n) {
//   if (n == 0) {
//     return 1;
//   }
//   return n * factorial(n - 1);
// }

void main() {
  int p1 = 23; //Grupo com 23 pessoas
  int p2 = 50; //Grupo com 50 pessoas
  int p3 = 100; //Grupo com 100 pessoas

  num result1 = bDayProb(p1);
  num result2 = bDayProb(p2);
  num result3 = bDayProb(p3);

  result1 = result1 * 100;
  result2 = result2 * 100;
  result3 = result3 * 100;

  print(
    'Chance de duas pessoas possuirem a mesma data de aniversario em um determinado grupo',
  );
  print('Grupo de 23 pessoas a chance é de: ${result1.toStringAsFixed(2)}%');
  print('Grupo de 50 pessoas a chance é de: ${result2.toStringAsFixed(2)}%');
  print('Grupo de 100 pessoas a chance é de: ${result3.toStringAsFixed(5)}%');
}
