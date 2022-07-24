// Dado as funções f(x) e g(x) descrita por
// f(x) = sin(x)*cos(x)*x+x-3;
// g(x) = -2*x^3 - 5*x^2 + 6*x - 5
// Encontrar a raiz das funções utilizando o método das secantes,
//  da posição falsa e da bissecção
// utilizando -5 e 5 de valores iniciais para g(x) e -100, 10 para f(x)

//https://pt.wikipedia.org/wiki/M%C3%A9todo_das_secantes

import 'dart:math';

int a1 = -5;
int a2 = 5;
double soma1 = 0;

int b1 = -100;
int b2 = 10;
double soma2 = 0;

double fdex(int x) => (sin(x)) * (cos(x)) * (x + x) - 3;

double gdex(int x) => -2 * pow(x, 3) - 5 * pow(x, 2) + (6 * x) - 5;

void secante() {
  double f;
  double g;

  for (int i = a1; i <= a2; i++) {
    f = ((i - 1) * fdex(i)) - ((i) * fdex(i - 1)) / (fdex(i)) - fdex(i - 1);
    print("F($i) = $f");
    soma1 += f;
  }
  print("Soma 1: $soma1");
  print("-------------------------------");
  for (int i = b1; i <= b2; i++) {
    g = ((i - 1) * gdex(i)) - ((i) * gdex(i - 1)) / (gdex(i)) - gdex(i - 1);
    print("G($i) = $g");
    soma2 += g;
  }

  print("Soma 2: $soma2");
}

void main() {
  secante();
}
