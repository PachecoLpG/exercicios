@Tags(['ex03'])
import 'package:test/test.dart';

// Dado um List<Map<String, dynamic>>
List<Map<String, dynamic>> input = <Map<String, dynamic>>[
  <String, dynamic>{'nome': 'Quinto', 'data': DateTime(2012)},
  <String, dynamic>{'nome': 'Segundo', 'data': DateTime(2010, 2)},
  <String, dynamic>{'nome': 'Quarto', 'data': DateTime(2011)},
  <String, dynamic>{'nome': 'Terceiro', 'data': DateTime(2010, 2, 2)},
  <String, dynamic>{'nome': 'Primeiro', 'data': DateTime(2010)},
];
// Criar uma função que gere um List<String> com o nome, ordenado pela data
// Por exemplo:
// [Primeiro, Segundo, Terceiro, Quarto, Quinto]

List<String> orderedList({required List<Map<String, dynamic>> input}) {
  List<String> list = [];

  input.sort((a, b) => (a['data']).compareTo(b['data']));

  for (Map<String, dynamic> element in input) {
    list.add(element['nome']);
  }

  return list;
}

void main() {
  test('deve retornar ordenado por data', () {
    List<String> output = [];
    List<String> expectedOutput = [
      'Primeiro',
      'Segundo',
      'Terceiro',
      'Quarto',
      'Quinto'
    ];

    output = orderedList(input: input);

    print(output);

    expect(output, expectedOutput);
  });
}
