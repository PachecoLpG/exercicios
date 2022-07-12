import 'package:test/test.dart';

// Dado um Map<int,String>
Map<int, String> input = <int, String>{
  100: 'Super dart',
  200: 'Mercado DART',
  300: 'SUPERMERCADO dart',
};
// Criar uma função pesquisa/filtra as entradas por um valor de busca
// Por exemplo, 'mercado' deve retornar
// {200: Mercado DART, 300: SUPERMERCADO dart}

//TODO verificar outra forma de filtrar por que essa esta duplicando o mapa
Map<int, String> filteredMap(
    {required String filter, required Map<int, String> input}) {
  return Map.from(input)
    ..removeWhere(
      (key, value) => !value.toLowerCase().contains(filter),
    );
}

void main() {
  test('deve retornar uma pesquisa por filtro', () {
    Map<int, String> expectedOutput = <int, String>{
      200: 'Mercado DART',
      300: 'SUPERMERCADO dart'
    };

    Map<int, String> output = filteredMap(filter: 'mercado', input: input);

    print(output);
    print(expectedOutput);

    expect(output.values, expectedOutput.values);
    Map<int, String> output2 = filteredMap(filter: 'super', input: input);

    print(output2);
  });
}
