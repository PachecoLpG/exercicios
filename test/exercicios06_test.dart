@Tags(['ex06'])
import 'package:test/test.dart';

// Criar uma classe que represente uma Entrega, com data de início e fim.
//
// É necessário ter um método que indique o status da entrega, (a entregar, em andamento ou finalizada),
// e também para iniciar e finalizar a entrega. Ao iniciar/entregar deverá ser conferido se a entrega encontra-se em condições de executar essa ação
// Por exemplo, não é possível dar início 2x e tbm finalizar sem iniciar

class Entrega {
  DateTime? dataFim;
  DateTime? dataInicio;
  EntregaStatus status = EntregaStatus.pendente;

  EntregaStatus getStatus() => status;

  void starDelivery() {
    if (dataInicio == null && status == EntregaStatus.pendente) {
      dataInicio = DateTime.now();
      status = EntregaStatus.emAndamento;
    } else {
      throw 'A entrega ja foi iniciada';
    }
  }

  void finishDelivery() {
    if (dataFim == null && status == EntregaStatus.emAndamento) {
      dataFim = DateTime.now();
      status = EntregaStatus.finalizada;
    } else {
      throw 'Não é possivel finalizar entregas não iniciadas';
    }
  }
}

enum EntregaStatus {
  emAndamento,
  finalizada,
  pendente,
}

void main() {
  test('deve obter o status atual da viagem', () {
    Entrega entrega = Entrega();

    expect(entrega.getStatus(), EntregaStatus.pendente);
    expect(entrega.getStatus() == EntregaStatus.emAndamento, isFalse);
    expect(entrega.getStatus() == EntregaStatus.finalizada, isFalse);
  });

  test('deve iniciar a entrega', () {
    Entrega entrega = Entrega();

    expect(entrega.getStatus(), EntregaStatus.pendente);
    entrega.starDelivery();
    expect(entrega.getStatus(), EntregaStatus.emAndamento);
    expect(entrega.dataInicio, isNotNull);
    expect(entrega.dataFim, isNull);
  });

  test('deve finalizar a entrega', () {
    Entrega entrega = Entrega();

    expect(entrega.getStatus(), EntregaStatus.pendente);
    entrega.starDelivery();
    expect(entrega.getStatus(), EntregaStatus.emAndamento);
    entrega.finishDelivery();
    expect(entrega.getStatus(), EntregaStatus.finalizada);
    expect(entrega.dataFim, isNotNull);
  });

  test('deve validar se entrega pode ser finalizada', () {
    Entrega entrega = Entrega();

    expect(() => entrega.finishDelivery(),
        throwsA('Não é possivel finalizar entregas não iniciadas'));
  });

  test('deve validar se a viagem pode ser iniciada', () {
    Entrega entrega = Entrega();
    entrega.starDelivery();

    expect(() => entrega.starDelivery(), throwsA('A entrega ja foi iniciada'));
  });
}
