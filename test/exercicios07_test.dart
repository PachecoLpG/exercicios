@Tags(<String>['ex07'])
import 'dart:math';

import 'package:test/test.dart';

// Criar uma função que dado um valor inteiro n, retorne o resultado de uma
//série Gregory-Leibniz utilizando como índice final o valor informado

double leibniz(int n) {
  double output = 0;
  double term = 0;

  for (int i = 0; i <= n; i++) {
    term = pow(-1, i) / (2 * i + 1);
    output += term;
  }

  return output = 4 * output;
}

void main() {
  test('deve calcular a série Gregory-Leibniz', () {
    int input = 1000000000;
    double output;

    output = leibniz(input);

    print(output);

    expect(output, equals(3.1415926545880506));
  });
}
