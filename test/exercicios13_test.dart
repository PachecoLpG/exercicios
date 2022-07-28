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
  List<Order> orders = <Order>[];

  Customer({
    required this.id,
    required this.name,
  });
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

  double calculateTotalPrice() {
    for (Item i in items) {
      totalPrice += i.quantity * i.unityPrice;
    }
    return totalPrice;
  }
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
    for (Customer c in customers) {
      for (Order o in c.orders) {
        if (orderId == o.id) {
          items.add(item);
          o.items.add(item);
        }
      }
    }
  }

  void addOrder({required Order order, required int customerId}) {
    for (Customer c in customers) {
      if (c.id == customerId) {
        c.orders.add(order);
      }
    }
  }

  Json toJson() => <String, dynamic>{
        'customers': <dynamic>[
          for (Customer c in customers)
            <String, dynamic>{
              'id': c.id,
              'name': c.name,
              'orders': <dynamic>[
                for (Order o in c.orders)
                  <String, dynamic>{
                    'id': o.id,
                    'items': <dynamic>[
                      for (Item i in o.items)
                        <String, dynamic>{
                          'name': i.name,
                          'quantity': i.quantity,
                          'unityPrice': i.unityPrice,
                        }
                    ],
                    'totalPrice': o.calculateTotalPrice(),
                  }
              ]
            }
        ],
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
  final Database db = Database();
  // db.addCustomer(customer: Customer(id: 1, name: 'Alfa'));
  // db.addCustomer(customer: Customer(id: 2, name: 'Bravo'));
  // // TotalPrice: 250
  // db.addOrder(order: Order(id: 1), customerId: 1);
  // db.addItem(
  //   item: Item(name: 'Alfa-order1-itemA', quantity: 2, unityPrice: 50),
  //   orderId: 1,
  // );
  // db.addItem(
  //   item: Item(name: 'Alfa-order1-itemB', quantity: 1, unityPrice: 150),
  //   orderId: 1,
  // );
  // // TotalPrice: 30
  // db.addOrder(order: Order(id: 2), customerId: 1);
  // db.addItem(
  //   item: Item(name: 'Alfa-order2-itemA', quantity: 1, unityPrice: 30),
  //   orderId: 2,
  // );
  // // TotalPrice: 100
  // db.addOrder(order: Order(id: 3), customerId: 2);
  // db.addItem(
  //   item: Item(name: 'Bravo-order3-itemA', quantity: 5, unityPrice: 20),
  //   orderId: 3,
  // );

  db.addCustomer(customer: Customer(id: 1, name: 'CustomerName'));
  db.addOrder(order: Order(id: 1), customerId: 1);
  db.addItem(
    item: Item(name: 'ItemName', quantity: 2, unityPrice: 50),
    orderId: 1,
  );

  Json output = db.toJson();
  print(output);

  test('o metodo toJson deve retornar o esperado', () {
    Json expectedOutput = <String, dynamic>{
      'customers': <dynamic>[
        <String, dynamic>{
          'id': 1,
          'name': 'CustomerName',
          'orders': <dynamic>[
            <String, dynamic>{
              'id': 1,
              'items': <dynamic>[
                <String, dynamic>{
                  'name': 'ItemName',
                  'quantity': 2,
                  'unityPrice': 50
                }
              ],
              'totalPrice': 100
            }
          ]
        }
      ]
    };

    expect(output, expectedOutput);
  });
}
