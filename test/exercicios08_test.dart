import 'package:test/test.dart';

// Dado um List<int>
List<int> input = <int>[2, 1, 0, 9];
// Criar uma função que receba o List<int> e retorne a seguinte lista
// ["Há 2 itens", "Somente um item", "Nenhum item", "Há 9 itens"]

List<String> elements(List<int> input) {
  List<String> output = [];

  for (int i in input) {
    if (i == 0) output.add("Nenhum item");
    if (i == 1) output.add("Somente um item");
    if (i > 1) output.add("Há $i itens");
  }

  return output;
}

void main() {
  test('deve retornar uma lista de String com elementos correspondentes', () {
    List<String> output = [];
    List<String> expectedOutput = <String>[
      "Há 2 itens",
      "Somente um item",
      "Nenhum item",
      "Há 9 itens"
    ];

    output = elements(input);
    print(output);

    expect(output.length, expectedOutput.length);
    expect(output, expectedOutput);
  });
}
