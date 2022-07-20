@Tags(<String>['ex02'])

import 'package:test/test.dart';

// Dado um List<int>
List<int> input = <int>[0, 1, 2, 3, 10, 100, 5, 3, 2];
// Criar uma função que separe os números pares dos impares
// Por exemplo:
// {pares: [0, 2, 10, 100, 2], impares: [1, 3, 5, 3]}

Map<String, List<int>> splitOddAndEven({required List<int> input}) {
  return <String, List<int>>{
    'pares': input.where((int e) => e.isEven).toList(),
    'impares': input.where((int e) => e.isOdd).toList()
  };
}

void main() {
  test('deve retornar corretamente a lista de pares e impares', () {
    Map<String, List<int>> expectedOutput = <String, List<int>>{
      'pares': <int>[0, 2, 10, 100, 2],
      'impares': <int>[1, 3, 5, 3]
    };

    print('EXPECTED ---->$expectedOutput');

    Map<String, List<int>> output = splitOddAndEven(input: input);

    print('OUTPUT ---->$output');

    expect(output.values, expectedOutput.values);
  });
}
