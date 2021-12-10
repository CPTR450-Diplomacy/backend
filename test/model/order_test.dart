import 'package:diplomacy/game_master.dart';
// import 'package:diplomacy/model/model.dart';
import 'package:test/test.dart';
import 'package:diplomacy/order.dart';

void main() {
  // Build a GameMaster with 7 players
  test('Order Test', () {
    var names = [
      'Abigail',
      'Benny',
      'Carly',
      'Duncan',
      'Evan',
      'Fiona',
      'Grant'
    ];
    GameMaster ourGM = GameMaster(names, id: 'test_id');

    // var testGY = GameYear();
    // expect(ourGM.currentYear.season, testGY.season);
    // expect(ourGM.currentYear.year, testGY.year);
    // expect(ourGM.currentPhase, PhaseName.diplomatic);
    // ourGM.advanceYear();
    // expect(ourGM.currentYear.season, GameYear(Season.fall).season);
    // ourGM.advanceYear();
    // expect(ourGM.currentYear.season, GameYear(Season.spring).season);
    // expect(ourGM.currentYear.year, 1902);

    // Sample game tests
    List<Order> ordersList = [
      Order(
          country: 'Austria',
          type: OrderType.move,
          src: 'Vienna',
          dst: 'Trieste'),
      Order(
          country: 'Austria',
          type: OrderType.move,
          src: 'Budapest',
          dst: 'Galicia'),
      Order(
          country: 'Austria',
          type: OrderType.move,
          src: 'Trieste',
          dst: 'Albania')
    ];

    ourGM.receiveOrders(ordersList);
    var resolvedList = ourGM.resolveOrders();
    expect(resolvedList, <String, List<String>>{
      'Austria': ['[C] Trieste', '[C] Galicia', '[C] Albania'],
      'England': ['London', 'Edinburgh', 'Liverpool'],
      'France': ['Paris', 'Marseilles', 'Brest'],
      'Germany': ['Berlin', 'Munich', 'Kiel'],
      'Italy': ['Rome', 'Venice', 'Naples'],
      'Russia': ['Moscow', 'Sevastopol', 'Warsaw', 'St. Petersburg (SC)'],
      'Turkey': ['Ankara', 'Constantinople', 'Smyrna']
    });
  });

  // a portion of the old stuff I was trying that was not remotely working.

  //   var ourProvinces = ourGM.provinces;
  //   if (ourGM.provinces.length >= 0) {
  //     var firstProvince = ourProvinces.elementAt(0);

  //     Order ourOrder = Order(firstProvince);
  //     Hold hold = Hold(firstProvince);
  //     Move move = Move(firstProvince);
  //     Support support = Support(firstProvince);
  //     Convoy convoy = Convoy(firstProvince);
  //     // ourOrder.newOrder(ourGM,ourOrder);

  //     List<Order> ourOrders = <Order>[];
  //     ourOrders.add(ourOrder);
  //     ourOrders.add(hold);
  //     ourOrders.add(move);
  //     ourOrders.add(support);
  //     ourOrders.add(convoy);

  //     // ourGM.addOrder(ourOrder);
  //     // province.Move move = new Move();
  //     // Order order = new Order(province);
  //   }
  // });
}
