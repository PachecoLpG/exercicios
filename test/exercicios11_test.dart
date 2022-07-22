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

int b1 = -100;
int b2 = 10;

double f(int x) => (sin(x)) * (cos(x)) * (x + x) - 3;

double g(int x) => -2 * pow(x, 3) - 5 * pow(x, 2) + (6 * x) - 5;

void secante() {
  List<double> x;
}
