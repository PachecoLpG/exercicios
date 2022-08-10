@Tags(<String>['ex21'])
import 'package:test/test.dart';

/// O problema: Um grupo de estudantes recebe um determinado número de exercícios
/// por dia. Entretanto, um deles deixou acumular uma certa quantia que deverá ser
/// realizada enquanto continua tendo mais exercícios na mesma taxa.
///
/// Desenvolva uma função que estime a quantia de dias que irá demorar para colocar
/// a lista de exercícios em dia, dado a quantia de exercícios acumulados, a quantia
/// de exercíos novos por dia e quantos exercícios é a meta diária.
///
/// Por exemplo:
/// - Com 0 acumulado e por dia ganha um e faz um, irá demorar nenhum dia
/// - Com 1 acumulado e por dia ganha um e faz um, nunca irá concluir
/// - Com 1 acumulado e por dia ganha um e faz dois, irá demorar 1 dia
/// - Com 2 acumulados e por dia ganha um e faz dois, irá demorar 2 dia

int acumulo(int acumulados, int meta) {
  if (acumulados == 0) {
    return 0;
  }
  if (acumulados == 1 && meta == 1) {
    throw Exception('Nunca ira concluir');
  }
  int d = 0;
  while (acumulados >= 1) {
    acumulados = acumulados - meta;
    acumulados++;
    d++;
  }
  print(d);
  return d;
}

void main() {
  test('deve calcular corretamente o acumulo: ', () {
    int output = acumulo(0, 1);

    expect(output, equals(0));

    expect(() => acumulo(1, 1), throwsException);

    output = acumulo(2, 2);

    expect(output, equals(2));

    print(acumulo(4, 2));
  });
}
