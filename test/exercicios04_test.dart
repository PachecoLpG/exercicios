import 'package:test/test.dart';

List<Map<String, dynamic>> input = <Map<String, dynamic>>[
  {'nome': 'Laranja', 'quantidade': 5},
  {'nome': 'Laranja', 'quantidade': 2},
  {'nome': 'Banana', 'quantidade': 7},
  {'nome': 'Banana', 'quantidade': 8},
  {'nome': 'Laranja', 'quantidade': 3},
  {'nome': 'Manga', 'quantidade': 1},
];
// Criar uma função que retorne a soma das quantidades, dado o nome do item
// Por exemplo:
// "Laranja" retorna 10

int addition({
  required List<Map<String, dynamic>> input,
  required String item,
}) {
  int add = 0;

  for (Map<String, dynamic> map in input) {
    if (map['nome'] == item) {
      add = map['quantidade'] + add;
    }
  }
  return add;
}

void main() {
  test('calculate', () {
    int expectedOutput1 = 10; //Laranja
    int expectedOutput2 = 1; //Manga
    int unexpected = 0; // Melão - não existe no map
    int output = 0;
    String item1 = 'Laranja';
    String item2 = 'Manga';
    String item3 = 'Melão';

    output = addition(input: input, item: item1);

    print('OUTPUT 1 ---> $output');

    expect(output, expectedOutput1);

    output = addition(input: input, item: item2);

    print('OUTPUT 2 ---> $output');

    expect(output, expectedOutput2);

    output = addition(input: input, item: item3);

    prints('OUTPUT 3 --->  $output');

    expect(output, unexpected);
  });
}
