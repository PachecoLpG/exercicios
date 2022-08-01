// import 'dart:io';
// /// Dado um arquivo .dat com a seguinte estrutura por colunas, separadas por tabulação
// /// Ano, mês, dia, hora, minuto, altura
// ///
// /// Observa-se que algumas referências de tempo possuem dois ou mais valores para o
// /// mesmo Ano, mês, dia, hora e minuto
// ///
// /// O objetivo é desenvolver uma função que leia o arquivo e grave a saída em outro com a mesma
// /// estrutura, mas para quando houver valores repetidos para o mesmo DateTime, retorne a
// /// média dos valores
// ///
// /// Além disso, desenvolver uma função que grave um arquivo com a mesma estrutura
// /// só que sem a coluna dos minutos, realizando a média dos valores obtidos naquela hora
// /// e considerando o ajuste para os que foram repetidos no mesmo minuto

import 'dart:convert';
import 'dart:io';

void main() async {
  File file = File('test/files/alturas.dat');
  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());
  Map<DateTime, double> map = <DateTime, double>{};

  await for (String line in lines) {
    List<String> splitted = line.split('	');
    DateTime dateTime = DateTime(
      int.parse(splitted[0]),
      int.parse(splitted[1]),
      int.parse(splitted[2]),
      int.parse(splitted[3]),
      int.parse(splitted[4]),
    );
    print("$dateTime - ${splitted.last}");
    map.addAll(<DateTime, double>{dateTime: double.parse(splitted.last)});
  }
  print(map);
  double media = 0;
}
