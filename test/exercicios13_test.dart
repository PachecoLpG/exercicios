@Tags(<String>['ex13'])
import 'package:test/test.dart';

/// Criar uma classe [Database] com métodos para add [Customer],
/// [Order] e [Item], além de linkar os objetos pelo id informardo a medida que são add.
///
/// * [Customer]
///     * id
///     * name
///     * orders[]

class Customer {
  int id;
  String name;
  List<Order> orders;

  Customer({
    required this.id,
    required this.name,
    this.orders = const <Order>[],
  });

  // Map<String, dynamic> toJson() => <String, dynamic>{
  //       'id': id,
  //       'name': name,
  //       'orders': orders,
  //     };
}

/// * [Order]
///     * id
///     * items[]
///     * totalPrice

class Order {
  int id;
  List<Item> items = <Item>[];
  double totalPrice = 0;

  Order({required this.id});

  // Map<String, dynamic> toJson() => <String, dynamic>{
  //       'id': id,
  //       'items': items,
  //       'totalPrice': totalPrice,
  //     };
}

/// * [Item]
///     * name
///     * quantity
///     * unityPrice

class Item {
  String name;

  int quantity;
  double unityPrice;

  Item({
    required this.name,
    required this.quantity,
    required this.unityPrice,
  });

  // Map<String, dynamic> toJson() => <String, dynamic>{
  //       'name': name,
  //       'id': id,
  //       'quantity': quantity,
  //       'unitPrice': unityPrice,
  //     };
}

/// * [Database]
///     * customers[]
///     * items[]
///     * database[]

class Database {
  List<Customer> customers = <Customer>[];
  List<Item> items = <Item>[];
  List<Database> database = <Database>[];

  void addCustomer({required Customer customer}) {
    customers.add(customer);
  }

  void addItem({required Item item, required int orderId}) {
    items.add(item);
  }

  void addOrder({required Order order, required int customerId}) {
    for (Customer c in customers) {
      if (c.id == customerId) {
        c.orders.add(order);
      }
    }
  }

  Map<String, dynamic> toJson() => <String, List<dynamic>>{
        'customers': customers,
        'items': items,
      };
}

typedef Json = Map<String, dynamic>;

/// Também deverá ter o método [Database.toJson], que gera um `Map<String, dynamic>`
///
/// Por exemplo:
/// - Add [Customer] com `id = 1` e `name = "CustomerName"`
/// - Add [Order] com `id = 1` e `customerId = 1`
/// - Add [Item] com `name = "ItemName"`, `quantity = 2`, `unityPrice = 50` e `orderId = 1`
///
/// Deve retornar com o método [Database.toJson]
///
/// `{customers: [{id: 1, name: CustomerName, orders: [{id: 1, items: [{name: ItemName, quantity: 2, unityPrice: 50}], totalPrice: 100}]}]}`

void main() {
  test(
    '',
    () {
      final Database db = Database();
      db.addCustomer(customer: Customer(id: 1, name: 'Alfa'));
      db.addCustomer(customer: Customer(id: 2, name: 'Bravo'));
      // TotalPrice: 250

      db.addOrder(order: Order(id: 1), customerId: 1);
      db.addItem(
        item: Item(name: 'Alfa-order1-itemA', quantity: 50, unityPrice: 10),
        orderId: 1,
      );
      db.addItem(
        item: Item(name: 'Alfa-order1-itemB', quantity: 150, unityPrice: 0.2),
        orderId: 1,
      );
      // TotalPrice: 30
      db.addOrder(order: Order(id: 2), customerId: 1);
      db.addItem(
        item: Item(name: 'Alfa-order2-itemA', quantity: 30, unityPrice: 0.3),
        orderId: 2,
      );
      // TotalPrice: 100
      db.addOrder(order: Order(id: 3), customerId: 2);
      db.addItem(
        item: Item(name: 'Bravo-order3-itemA', quantity: 20, unityPrice: 17),
        orderId: 3,
      );
      Json output = db.toJson();
      print(output);
    },
    skip: true,
  );
}
