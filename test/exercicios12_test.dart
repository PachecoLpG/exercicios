@Tags(<String>['ex12'])
import 'package:test/test.dart';

// Com o enum Color,
enum Color {
  red,
  green,
  blue,
  yellow,
  purple;
}
// Dado um valor para uma Color atual, criar duas funções
// uma que retorne a proxima cor na sequência e a defina como atual,
// e outra que retorne a cor anterior na sequência e a defina como atual
// Considere que a anterior da primeira cor é a última e que a próxima da última é a primeira

Color nextColor(Color color) {
  if (color.index == Color.values.last.index) {
    return Color.values.first;
  } else {
    return Color.values[color.index + 1];
  }
}

Color beforeColor(Color color) {
  if (color.index == Color.values.first.index) {
    return Color.values.last;
  } else {
    return Color.values[color.index - 1];
  }
}

void main() {
  test('deve mudar para proxima cor', () {
    Color color = Color.green;

    expect(color, Color.green);

    color = nextColor(color);

    expect(color, Color.blue);
  });

  test('deve voltar para cor anterior', () {
    Color color = Color.purple;

    expect(color, Color.purple);

    color = beforeColor(color);

    expect(color, Color.yellow);
  });

  test('deve mudar para a cor correta', () {
    Color color = Color.red;
    Color color2 = Color.purple;

    expect(color, Color.red);
    expect(color2, Color.purple);

    color = beforeColor(color);
    color2 = nextColor(color);

    expect(color, Color.purple);
    expect(color2, Color.red);
  });
}
