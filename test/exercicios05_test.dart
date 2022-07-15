@Tags(['ex05'])
import 'package:test/test.dart';

// Dado um List<Map<String, dynamic>>
List<Map<String, dynamic>> input = <Map<String, dynamic>>[
  {'nome': 'Laranja', 'quantidade': 5},
  {'nome': 'Laranja', 'quantidade': 2},
  {'nome': 'Banana', 'quantidade': 7},
  {'nome': 'Banana', 'quantidade': 8},
  {'nome': 'Laranja', 'quantidade': 3},
  {'nome': 'Manga', 'quantidade': 1},
];

// Criar uma classe para cada tipo de fruta e uma função que converta o input em uma List<Fruta>
//
// Em um segundo momento, criar uma função utilizando "Generic Methods" que recebe List<Fruta> e
// tem como saída o tipo de fruta especificado

class Fruta {
  String nome = '';
  int quantidade = 0;

  Fruta({
    required this.nome,
    required this.quantidade,
  });
}

List<T> genericMethod<T>(List<Fruta> list, String filter) {
  return list
      .where((element) => element.nome.toLowerCase().contains(filter))
      .toList() as List<T>;
}

List<Fruta> frutas(List<Map<String, dynamic>> input) {
  List<Fruta> output = [];

  for (Map<String, dynamic> map in input) {
    output.add(
      Fruta(nome: map['nome'], quantidade: map['quantidade']),
    );
  }

  return output;
}

List<Fruta> expectedOutput = [
  Fruta(nome: 'Laranja', quantidade: 5),
  Fruta(nome: 'Laranja', quantidade: 2),
  Fruta(nome: 'Banana', quantidade: 7),
  Fruta(nome: 'Banana', quantidade: 8),
  Fruta(nome: 'Laranja', quantidade: 3),
  Fruta(nome: 'Manga', quantidade: 1),
];

void main() {
  test('deve converter o input para uma lista de frutas', () {
    List<Fruta> output = [];

    output = frutas(input);

    for (Fruta fruta in output) {
      print(fruta.nome);
      print(fruta.quantidade);
    }

    for (int i = 0; i < output.length; i++) {
      expect(output[i].nome, expectedOutput[i].nome);
      expect(output[i].quantidade, expectedOutput[i].quantidade);
    }
  });

  test('deve retornar as frutas pelo tipo especificado', () {
    List<Fruta> output = frutas(input);
    List<Fruta> fruta = genericMethod<Fruta>(output, 'banana');
    List<Fruta> expectedOutput = <Fruta>[
      Fruta(nome: 'Banana', quantidade: 7),
      Fruta(nome: 'Banana', quantidade: 8),
    ];

    for (Fruta f in fruta) {
      print(f.nome);
      print(f.quantidade);
    }

    for (int i = 0; i < fruta.length; i++) {
      expect(fruta[i].nome, expectedOutput[i].nome);
      expect(fruta[i].quantidade, expectedOutput[i].quantidade);
    }
  });
}
