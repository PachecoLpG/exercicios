/// Desenvolva um programa que simule um sistema de aprovação com um banco de dados.
///
/// Deve ter uma lista de [Unidade], cada unidade possui um id e uma lista
/// de ids das que estão abaixo dela na hierarquia.
///
/// Deve ter uma lista de [Solicitacao], cada solicitacao possui seu id, valor e status.
/// - Os status são:
///   0. pendente
///   1. recusado
///   2. aprovado
///
/// Deve ter uma lista de [Operador], cada operador possui um id
/// e qual unidade ele pertence.
///
/// A [Database] deverá ter essas três listas de dados que serão **privadas**.
/// Para adicionar um novo objeto, deverá ter um método que retornará o id daquilo
/// que foi adicionado, exceto no caso do [Operador]
///
/// Todos os objetos elementos que compõe a [Database] deverão ter seus atributos como
/// `final`, exceto o status da [Solicitacao]. Além disso, todos os atributos deverão ser
/// pertencer ao dart e não objetos declarados como por exemplo `enum`.
///
/// Em hipótese alguma deverá ser exposto toda a lista de dados da [Database]
/// para quem não deveria ter acesso. Cada [Operador] deve ter acesso somente as [Solicitacao]
/// que estão dentro da hierarquia que ele pertence. Ao alterar o status da [Solicitacao]
/// não é necessário registrar qual [Operador] realizou a ação.
///
/// Nenhum objeto além da [Database] deverá ser criado fora dela, inclusive no [main].
///
/// Deverá haver verificações dentro dos métodos da [Database], de forma que não seja possível
/// obter um erro inesperado. Considera-se erro "inesperado" todos aqueles que não resultam em
/// `throw` emitido pelo código escrito.
///
/// A vinculação da hierarquia de uma [Unidade] a outra deve ser feita pela unidade "filha",
/// que indica o id de quem deverá ser vinculada como raiz.
///
/// Para funcionar corretamente, primeiro deverá ser adicionada a [Unidade] a qual os ids se referem,
/// depois os [Operador] e [Solicitacao]
///
/// O [Operador] conseguir buscar todas as solicitações que são visíveis a ele, utilizando filtro por status.
/// O filtro poderá ser por um ou mais status, e se desativados, trazer todos. Deverá ser feita somente
/// um método para isso.

class Operador {
  int id;
  Unidade unidade;

  Operador({required this.id, required this.unidade});
}

class Unidade {
  int id;
  List<int> lowerId = <int>[];

  Unidade({required this.id});

  void addLower({required int id}) {
    for (int i in lowerId) {
      if (i == id) {
        throw Error();
      }
    }

    lowerId.add(id);
    print('Unidade Id: $id acicionada abaixo da Unidade Id: ${this.id}');
  }
}

class Solicitacao {
  int id;
  double valor;
  int status;
  int unidadeId;

  Solicitacao({
    required this.id,
    required this.valor,
    required this.status,
    required this.unidadeId,
  });

  String get statusNome {
    if (status == 0) {
      return 'pendente';
    }
    if (status == 1) {
      return 'recusado';
    }
    return 'aprovado';
  }

  void changeStatus(int newStatus) {
    if (newStatus >= 0 && newStatus < 4) {
      status = newStatus;
    } else {
      throw Error();
    }
  }
}

class Database {
  final List<Solicitacao> _solicitacoes = <Solicitacao>[];

  final List<Unidade> _unidades = <Unidade>[];

  final List<Operador> _operadores = <Operador>[];

  int addSolicitacao({required Solicitacao solicitacao}) {
    for (Solicitacao s in _solicitacoes) {
      if (s.id == solicitacao.id) {
        throw Error();
      }
    }

    _solicitacoes.add(
      Solicitacao(
        id: solicitacao.id,
        valor: solicitacao.valor,
        status: solicitacao.status,
        unidadeId: solicitacao.unidadeId,
      ),
    );
    print(
      'Solicitação adicionada com sucesso para a Unidade: ${solicitacao.unidadeId}',
    );
    return solicitacao.id;
  }

  int addUnidade({required Unidade unidade}) {
    for (Unidade u in _unidades) {
      if (u.id == unidade.id) {
        throw Error();
      }
    }

    _unidades.add(Unidade(id: unidade.id));
    print('Unidade adicionada com sucesso');
    return unidade.id;
  }

  void addOperador({required Operador operador}) {
    for (Solicitacao o in _solicitacoes) {
      if (o.id == operador.id) {
        throw Error();
      }
    }

    _operadores.add(Operador(id: operador.id, unidade: operador.unidade));
    print('Operador adicionado com sucesso');
  }

//TODO zuado, melhorar
  void select({
    required Operador operador,
    bool isFiltered = false,
    int statusFilter = 0,
  }) {
    bool haveLower = operador.unidade.lowerId.contains(operador.id);

    for (Solicitacao s in _solicitacoes) {
      bool canOperator = s.unidadeId == operador.unidade.id;
      if (!isFiltered) {
        if (canOperator) {
          printData(s);
          if (haveLower) {
            printData(s);
            continue;
          }
          continue;
        }
      }
      if (s.status == statusFilter && canOperator) {
        printData(s);
        if (haveLower) {
          printData(s);
        }
      }
    }
  }
}

void printData(Solicitacao s) {
  print('Solicitação - Id: ${s.id} Status: ${s.status}');
  print('Valor: ${s.valor} Unidade: ${s.unidadeId}');
}

// O operador da unidade 10 deve poder ver a unidade 7 pois ela esta abaixo da 10
void main() {
  Database db = Database();
  Unidade un = Unidade(id: 10);
  Unidade un2 = Unidade(id: 7);
  Operador op = Operador(id: 1, unidade: un);

  un.addLower(id: 7);

  db.addOperador(operador: op);
  db.addUnidade(unidade: un);
  db.addUnidade(unidade: un2);
  db.addSolicitacao(
    solicitacao: Solicitacao(id: 5, valor: 10, status: 0, unidadeId: 10),
  );
  db.addSolicitacao(
    solicitacao: Solicitacao(id: 7, valor: 15, status: 1, unidadeId: 7),
  );

  db.select(operador: op);
}
