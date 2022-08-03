import 'package:meta/meta.dart';
import 'dart:math';

/// Desenvolva uma função que, baseado nas regras do truco gaudério:
/// - Ordene as cartas da menor para a maior - ja é gerado nessa ordenação
/// - Retorne a maior carta do baralho, sem usar a ordenação
/// - Retorne a menor carta do baralho, sem usar a ordenação
/// - Retorne o resultado entre duas cartas (empate ou quem ganhou)
/// - Bônus
///     - Defina a [Carta] como sendo @immutable
///   - Defina um tipo chamado [Baralho] para se referir a um conjunto de cartas
///   - Dê um override em [Carta.toString] para retornar o nome da carta de
/// uma forma mais limpa
///   - Crie novos operadores em [Carta] para comparar se ela é melhor, pior
/// ou de mesmo valor que a outra (se ganha, perde ou empata)
///
/// # Regras do jogo:
/// No Truco gaudério, joga-se com um baralho espanhol, que possui as cartas
/// do 1 ao 12, mas sem os coringas e também é removido os 8 e 9. Totalizando
/// 40 cartas
///
///
///3 mais forte depois dos casos especificos
/// A cada rodada ganha quem tem a carta mais "forte"
/// A sequência de quem tem a carta mais forte é dada por:
/// do quatro ao 12 e do 1 ao 3, nessa sequência o naipe na maioria dos casos
/// não é relevante, ocasionando em empate. Após o 3 vem as seguintes cartas:
/// 7 de ouro, 7 de espada, 1 de basto e 1 de espada. Estas não tem equivalência
/// com nenhuma outra carta e não empatam com nenhuma outra.

enum Naipe {
  Ouro,
  Espada,
  Basto,
  Copas,
  Indefinido;

  String get nome {
    switch (this) {
      case Naipe.Basto:
        return 'de bastos';
      case Naipe.Ouro:
        return 'de ouro';
      case Naipe.Espada:
        return 'de espada';
      case Naipe.Copas:
        return 'de copas';
      case Naipe.Indefinido:
        return '';
    }
  }
}

List<Carta> generateDeck() {
  List<Carta> baralho = <Carta>[];

  for (int i = 1; i <= 12; i++) {
    if (i != 8 && i != 9) {
      baralho.add(Carta(i, Naipe.Basto));
      baralho.add(Carta(i, Naipe.Copas));
      baralho.add(Carta(i, Naipe.Espada));
      baralho.add(Carta(i, Naipe.Ouro));
    }
  }

  return baralho;
}

enum Operador { Empate, Forte, Fraca }

@immutable
class Carta {
  final int valor;
  final Naipe naipe;

  @override
  String toString() => '$valor ${naipe.nome}';

  Carta([this.valor = 0, this.naipe = Naipe.Indefinido]);
  // As manilhas apresentam problemas na verificacao TODO melhorar
  Operador verifyStrength(Carta inputCard) {
    if (this.valor == inputCard.valor && this.naipe == inputCard.naipe) {
      return Operador.Empate;
    }
    if (inputCard.valor == 1 && inputCard.naipe == Naipe.Espada) {
      return Operador.Forte;
    }
    if (inputCard.valor == 1 && inputCard.naipe == Naipe.Basto) {
      return Operador.Forte;
    }
    if (inputCard.valor == 7 && inputCard.naipe == Naipe.Espada) {
      return Operador.Forte;
    }
    if (inputCard.valor == 7 && inputCard.naipe == Naipe.Ouro) {
      return Operador.Forte;
    }

    if (inputCard.valor == this.valor) {
      return Operador.Empate;
    }

    if (this.valor >= 4 && inputCard.valor >= 4) {
      if (inputCard.valor > this.valor) {
        return Operador.Forte;
      } else {
        return Operador.Fraca;
      }
    }

    if (inputCard.valor < this.valor) {
      return Operador.Forte;
    }
    return Operador.Fraca;
  }
}

class Baralho {
  List<Carta> cartas = generateDeck();
}

void maiorCarta(List<Carta> baralho) {
  Carta maiorCarta = Carta(0, Naipe.Indefinido);

  for (Carta c in baralho) {
    if (c.valor > maiorCarta.valor) {
      maiorCarta = c;
    }
  }

  print('Maior carta: ${maiorCarta.toString()}');
}

void menorCarta(List<Carta> baralho) {
  Carta menorCarta = Carta(12, Naipe.Indefinido);

  for (Carta c in baralho) {
    if (c.valor < menorCarta.valor) {
      menorCarta = c;
    }
  }

  print('Menor carta: ${menorCarta.toString()}');
}

void main() {
  Baralho baralho = Baralho();

  Carta carta1 = Carta(7, Naipe.Espada);

  Operador forca;

  print('------------');

  for (Carta c in baralho.cartas) {
    print(c.toString());
  }

  print('------------');

  menorCarta(baralho.cartas);
  maiorCarta(baralho.cartas);

  print('------------');

  for (Carta c in baralho.cartas) {
    forca = c.verifyStrength(carta1);
    print(forca);
  }
}
