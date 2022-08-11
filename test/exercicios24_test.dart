import 'package:test/test.dart';

/// Desenvolva uma função que dado duas listas não obrigatoriamente do mesmo
/// tamanho mas desde que sejam do mesmo tipo, seja ele qual for, retorne a
/// interseção entre as duas.
///
/// ## Exemplo 1:
/// Interseção entre:
/// - ["Alfa", "Bravo", "Charlie", "Delta"];
/// - ["Alfa", "Beta", "Gama", "Delta"];
///
/// Deve retornar:
/// - ["Alfa", "Delta"];
///
/// ## Exemplo 2:
/// Interseção entre:
/// - [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
/// - [5, 7, 11, 13];
///
/// Deve retornar:
/// - [5, 7];
///

List<dynamic> intersection({
  required List<dynamic> inputOne,
  required List<dynamic> inputTwo,
}) {
  List<dynamic> output = <dynamic>[];

  if (inputOne.runtimeType != inputTwo.runtimeType) {
    throw Exception();
  }
  for (dynamic d in inputOne) {
    for (dynamic e in inputTwo) {
      if (d == e) {
        output.add(d);
      }
    }
  }
  return output;
}

void main() {
  test('deve retornar corretamente a interseção exemplo 01', () {
    List<dynamic> inputOne = <dynamic>["Alfa", "Bravo", "Charlie", "Delta"];
    List<dynamic> inputTwo = <dynamic>["Alfa", "Beta", "Gama", "Delta"];

    List<dynamic> output = intersection(inputOne: inputOne, inputTwo: inputTwo);

    print(output);

    expect(output, equals(<dynamic>["Alfa", "Delta"]));
  });

  test('deve retornar corretamente a interseção exemplo 02', () {
    List<dynamic> inputOne = <dynamic>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    List<dynamic> inputTwo = <dynamic>[5, 7, 11, 13];

    List<dynamic> output = intersection(inputOne: inputOne, inputTwo: inputTwo);

    print(output);

    expect(output, equals(<dynamic>[5, 7]));
  });

  test('deva falhar caso as listas não possuam o mesmo tipo', () {
    List<String> inputOne = <String>["Alfa", "Bravo", "Charlie", "Delta"];
    List<int> inputTwo = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    expect(
      () => intersection(inputOne: inputOne, inputTwo: inputTwo),
      throwsException,
    );
  });
}
