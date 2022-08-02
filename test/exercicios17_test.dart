/// Desenvolva uma função que obtenha o maior valor para n
/// em que n! seja possível calcular corretamente mas não (n+1)!,
/// para os seguintes casos.
///
/// - Calculando o resultado com um int
/// - Calculando o resultado com um double

dynamic factorial(dynamic i) {
  if (i == 0) {
    return 1;
  }
  return (i) * (factorial(i - 1));
}

void calculateMaxValues() {
  dynamic result = 0;

  for (int i = 0; i < 200; i++) {
    result = factorial(i);
    if (result == 0) {
      print('Valor maximo para fatorial inteiro: [${i - 1}]');
      break;
    }
  }

  for (double i = 0; i < 200; i++) {
    result = factorial(i);

    if (result == double.infinity) {
      print('Valor maixo para fatorial double: [${i - 1}]');
      break;
    }
  }
}

void main() {
  calculateMaxValues();
}
