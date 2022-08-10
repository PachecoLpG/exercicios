/// Desenvolva uma função que dado um address de WebSocket echo service
/// e um número de tentativas, retorne o tempo em ms para cada uma delas
/// e também o tempo máximo, mínimo e médio.
///
/// - Compare os valores entre pelo menos dois WebSocket
/// - Utilize [WebSocket] da lib `dart:io`
///
///

import 'dart:async';
import 'dart:io';

Future<void> echoService({required String url, int tentativas = 5}) async {
  WebSocket ws = await WebSocket.connect(url);
  int i = 0;
  DateTime send = DateTime.now();
  DateTime recived = DateTime.now();
  List<int> tempo = <int>[];
  ws.add('Iniciando');

  ws.listen((dynamic event) {
    if (i == tentativas) {
      ws.close();
      calculatePing(tempo);
    }
    if (i < tentativas) {
      ws.add('Echo ${i.toString()}');
      send = DateTime.now();
      i++;
    }
    print('Recebido: $event');
    recived = DateTime.now();
    tempo.add(recived.difference(send).inMilliseconds);
  });
}

void calculatePing(List<int> input) {
  int media = 0;
  int menor = 1000;
  int maior = 0;

  for (int element in input) {
    media += element;
    if (element > maior) {
      maior = element;
    }
    if (element < menor) {
      menor = element;
    }
  }
  print('Media: ${media / input.length}');
  print('Maximo: $maior');
  print('Minimo: $menor');
}

Future<void> main() async {
  await echoService(url: 'wss://ws.postman-echo.com/raw');
}
