@Tags(<String>['ex09'])

import 'package:test/test.dart';

// Dado uma String de entrada, criar duas funções
// uma função que calcule quantas permutações são possíveis com a palavra
// e outra função que retorne todos os valores possíveis em uma List<String>
// Por exemplo, dado a seguinte palavra como entrada
final String input = "BANANA";
// A função que retorna a quantia de permutações possíveis deverá retornar 60
// e a função que retorna as permutações deverá retornar, não necessariamente nessa ordem:
// ["BANANA", "BANAAN", "BANNAA", "BAANNA", "BAANAN", "BAAANN", "BNAANA", "BNAAAN", "BNANAA", "BNNAAA", "ABNANA", "ABNAAN", "ABNNAA", "ABANNA", "ABANAN", "ABAANN", "ANBANA", "ANBAAN", "ANBNAA", "ANABNA", "ANABAN", "ANANBA", "ANANAB", "ANAABN", "ANAANB", "ANNBAA", "ANNABA", "ANNAAB", "AABNNA", "AABNAN", "AABANN", "AANBNA", "AANBAN", "AANNBA", "AANNAB", "AANABN", "AANANB", "AAABNN", "AAANBN", "AAANNB", "NBAANA", "NBAAAN", "NBANAA", "NBNAAA", "NABANA", "NABAAN", "NABNAA", "NAABNA", "NAABAN", "NAANBA", "NAANAB", "NAAABN", "NAAANB", "NANBAA", "NANABA", "NANAAB", "NNBAAA", "NNABAA", "NNAABA", "NNAAAB",];
// Obs: A quantia de permutações possíveis deverá ser CALCULADO para comparar com o resultado da outra função

// Para a palavra "DART"
// 24
// ["DART", "DATR", "DRAT", "DRTA", "DTAR", "DTRA", "ADRT", "ADTR", "ARDT", "ARTD", "ATDR", "ATRD", "RDAT", "RDTA", "RADT", "RATD", "RTDA", "RTAD", "TDAR", "TDRA", "TADR", "TARD", "TRDA", TRAD]

String swap(String a, int i, int j) {
  List<String> charArray = a.split('');
  String temp = '';

  temp = charArray[i];
  charArray[i] = charArray[j];
  charArray[j] = temp;
  return charArray.join();
}

List<String> permute(String word, int l, int r) {
  List<String> output = <String>[];
  if (l == r) {
    output.add(word);
    return output;
  }
  for (int i = l; i <= r; i++) {
    word = swap(word, l, i);
    if (!output.contains(word)) {
      output = output + permute(word, l + 1, r);
    }
    word = swap(word, l, i);
  }
  return output;
}

int factorial(int i) {
  if (i == 0) {
    return 1;
  }
  return (i) * (factorial(i - 1));
}

double possiblePermutations(String word, int n, int k) {
  List<int> teste = charOccurrences(word);
  int soma = 1;

  for (int i in teste) {
    soma *= factorial(i);
  }

  print(factorial(n));
  print(soma);

  return (factorial(n)) / (soma);
}

List<int> charOccurrences(String word) {
  List<String> splitted = word.split('');
  Map<String, int> occurrences = <String, int>{};

  for (String char in splitted) {
    occurrences[char] =
        !occurrences.containsKey(char) ? 1 : occurrences[char]! + 1;
  }

  return occurrences.values.toList();
}

void main() {
  test('deve calcular a quantidade de possiveis permutações', () {
    String word = 'BANANA';
    int expectedOutput = 60;
    int output = 0;

    output = possiblePermutations(word, word.length, word.length - 1).toInt();

    expect(output, expectedOutput);
  });

  test('deve retornar uma lista de permutações', () {
    String word = 'ABC';
    List<String> expectedOutput = <String>[
      'ABC',
      'ACB',
      'BAC',
      'BCA',
      'CBA',
      'CAB',
    ];
    List<String> output = <String>[];

    output = permute(word, 0, word.length - 1);
    expect(output, expectedOutput);
  });

  test(
      'deve verificar se a quantidade de possiveis permutações é igual a quantidade permutada',
      () {
    String word = 'DART';
    List<String> permutations = <String>[];
    int output = 0;

    output = possiblePermutations(word, word.length, word.length - 1).toInt();
    permutations = permute(word, 0, word.length - 1);
    print(permutations);

    expect(output, permutations.length);
  });
}
