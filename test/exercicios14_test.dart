@Tags(<String>['ex14'])
import 'dart:math';

import 'package:test/test.dart';

/// O CPF é composto por 9 números mais dois digitos verificadores
///
/// Para o primeiro dígito verificador, é multiplicado cada um dos 9 números
/// pelos valores de 10 a 2 (o primeiro por 10, o segundo por 9, ..., o nono por 2)
///
/// O primeiro dígito é acrescentado ao final da lista e a operação é repetida, mas
/// pelos valores de 11 a 2 (o primeiro por 11, o segundo por 9, ..., o décimo por 2)
///
/// Com essas informações:
/// - Criar uma função que converta o cpf como String no formato `r'\d{3}\.\d{3}\.\d{3}-\d{2}'`
/// - Criar uma função que converta um List<int> de tamanho 11 em no cpf como String
/// - Criar uma função que com os 9 números do cpf em List<int>, obtenha o cpf completo
/// - Criar uma função que com um cpf completo, confira se ele é válido ou não
/// - Criar uma função que retorne um cpf completo aleatório
///
/// Observação: Todas as funções deverão retornar erro caso o parâmetro de entrada não esteja correto
/// Por exemplo, List<int> com tamanho 5 para obter um cpf
/// ou uma palavra qualquer como entrada para converter para cpf

final RegExp regEx = RegExp(r'\d{3}\.\d{3}\.\d{3}-\d{2}');

//TODO refazer
String convertToString(String input) {
  if (input.length < 11) {
    throw Error();
  }

  if (regEx.hasMatch(input)) {
    return input;
  }

  List<String> output = input.split('');

  for (int i = 3; i < input.length - 2; i + 3) {}

  return 'a';
}

//TODO refazer tb
String listToCpf(List<int> listInput) {
  if (listInput.length < 12 || listInput.length > 11) {
    throw Error();
  }
  return convertToString(listInput.toString()).toString();
}

List<int> cpfCompleto(List<int> listInput) {
  if (listInput.length < 9) {
    throw Error();
  }
  int digitoVerificadorUm = 0;
  int digitoVerificadorDois = 0;

  digitoVerificadorUm = verificarPrimeiroDigito(listInput);
  listInput.add(digitoVerificadorUm);

  digitoVerificadorDois = verificarSegundoDigito(listInput);
  listInput.add(digitoVerificadorDois);

  return listInput;
}

int verificarPrimeiroDigito(List<int> listInput) {
  int digitoVerificadorUm = 0;
  int j = 10;

  for (int i = 0; i < listInput.length; i++) {
    digitoVerificadorUm += listInput[i] * j;
    j--;
  }

  return umDigito(digitoVerificadorUm);
}

int verificarSegundoDigito(List<int> listInput) {
  int digitoVerificadorDois = 0;
  int j = 11;

  for (int i = 0; i < listInput.length; i++) {
    digitoVerificadorDois += listInput[i] * j;
    j--;
  }

  return umDigito(digitoVerificadorDois);
}

bool validateCpf(List<int> listInput) {
  if (listInput.length < 11 || listInput.length > 12) {
    throw Error();
  }
  int digitoVerificadorUm = 0;
  int digitoVerificadorDois = 0;

  int ultimoValor = listInput.last;
  listInput.remove(ultimoValor);
  int penultimoValor = listInput.last;
  listInput.remove(penultimoValor);

  digitoVerificadorUm = verificarPrimeiroDigito(listInput);
  listInput.add(digitoVerificadorUm);
  digitoVerificadorDois = verificarSegundoDigito(listInput);

  return (digitoVerificadorUm == penultimoValor &&
      digitoVerificadorDois == ultimoValor);
}

int umDigito(int i) {
  int resto = i % 11;
  int digito = 0;

  digito = 11 - resto;

  if (digito >= 10) {
    return 0;
  }
  return digito;
}

List<int> generateCpf() {
  List<int> generatedList = List<int>.generate(
    9,
    (int index) => Random().nextInt(9),
  );

  int digitoVerificadorUm = 0;
  int digitoVerificadorDois = 0;

  digitoVerificadorUm = verificarPrimeiroDigito(generatedList);

  generatedList.add(digitoVerificadorUm);

  digitoVerificadorDois = verificarSegundoDigito(generatedList);

  generatedList.add(digitoVerificadorDois);

  print(generatedList);
  return generatedList;
}

void main() {
  test(
    'deve converter corretamente a string do cpf',
    () {
      String sCpf = '202.561.560-42';

      String cpfConvertido = convertToString(sCpf).toString();

      expect(cpfConvertido, equals('20256156042'));
    },
    skip: false,
  );

  test('deve retornar um cpf completo a partir de 9 numeros', () {
    List<int> cpf = <int>[6, 9, 1, 7, 5, 4, 3, 2, 0];
    List<int> expectedCpf = <int>[6, 9, 1, 7, 5, 4, 3, 2, 0, 9, 9];

    cpf = cpfCompleto(cpf);

    expect(cpf, expectedCpf);
  });

  test('deve validar se o cpf é valido', () {
    List<int> cpf = <int>[3, 3, 9, 9, 7, 8, 7, 6, 0, 0, 2];

    expect(validateCpf(cpf), isTrue);
  });

  test('deve gerar um cpf aleatoriamente', () {
    List<int> cpfGerado = generateCpf();

    expect(validateCpf(cpfGerado), isTrue);
  });
}
