import 'package:diplomacy/model/model.dart';
import 'package:test/test.dart';

void main() {
  test('Move Order Parsing Test', () {
    // define move orders to test
    List<String> moveOrders = ['A Kie-Mun', 'F Bel-Bel'];
    expect(moveOrders, ['A Kie-Mun', 'F Bel-Bel']);

    // display some of the information that the function uses
    // for the first move order
    print('First substring: "' +
        moveOrders.first.substring(2, 4) +
        '" Second substring: "' +
        moveOrders.first.substring(6, 8) +
        '"');
    expect(moveOrders.first.substring(2, 4), 'Ki');
    expect(moveOrders.first.substring(6, 8), 'Mu');

    // create a diplomacy class to test parseOrder()
    // note: this currently fails due to the
    // way orders are defined in parseOrder()
    Diplomacy myDiplomacy = Diplomacy();
    expect(myDiplomacy is Diplomacy, equals(true));

    for (var moveOrder in moveOrders) {
      expect(true, moveOrder is String);
      expect(true, myDiplomacy.parseOrder(moveOrder) is Move);
    }
  });
  test('Hold Order Parsing Test', () {
    // define hold orders to test
    List<String> holdOrders = ['A Lvp Holds', 'F Lon Holds'];
    expect(holdOrders, ['A Lvp Holds', 'F Lon Holds']);

    // display some of the information that the function uses
    // for the first hold order
    print('The substring: "' + holdOrders.first.substring(2, 4) + '"');

    // create a diplomacy class to test parseOrder()
    // note: this currently fails due to the
    // way orders are defined in parseOrder()
    Diplomacy myDiplomacy = Diplomacy();
    expect(true, myDiplomacy is Diplomacy);

    for (var holdOrder in holdOrders) {
      expect(holdOrder is String, equals(true));
      expect(
        myDiplomacy.parseOrder(holdOrder) is Hold,
        true,
      );
    }
  });

  test('Support Order Parsing Test', () {
    // define support orders to test
    List<String> supportOrders = [
      'A Par S A Mar-Rom',
      'A Ven S F Nap-Nap',
      'F Tri S A Vie-Bud',
      'F Ank S F Stp-War'
    ];
    expect(supportOrders, [
      'A Par S A Mar-Rom',
      'A Ven S F Nap-Nap',
      'F Tri S A Vie-Bud',
      'F Ank S F Stp-War'
    ]);

    // display some of the information that the function uses
    // for the first support order
    print('First supported substring: "' +
        supportOrders.first.substring(10, 12) +
        '" Second supported substring: "' +
        supportOrders.first.substring(14, 16) +
        '" Last substring: "' +
        supportOrders.first.substring(2, 4) +
        '"');

    // create a diplomacy class to test parseOrder()
    // note: this currently fails due to the
    // way orders are defined in parseOrder()
    Diplomacy myDiplomacy = Diplomacy();
    expect(true, myDiplomacy is Diplomacy);

    for (var supportOrder in supportOrders) {
      expect(supportOrder is String, equals(true));
      print(myDiplomacy.parseOrder(supportOrder).runtimeType);
      expect(myDiplomacy.parseOrder(supportOrder) is Support, equals(true));
    }
  });

  test('Convoy Order Parsing Test', () {
    // define convoy orders to test
    List<String> convoyOrders = ['F Stp C A Mos-Sev'];

    // display some of the information that the function uses
    // for the convoy support order
    print('First convoyed substring: "' +
        convoyOrders.first.substring(10, 12) +
        '" Second convoyed substring: "' +
        convoyOrders.first.substring(14, 16) +
        '" Last substring: "' +
        convoyOrders.first.substring(2, 4) +
        '"');

    // create a diplomacy class to test parseOrder()
    // note: this currently fails due to the
    // way orders are defined in parseOrder()d
    Diplomacy myDiplomacy = Diplomacy();
    expect(true, myDiplomacy is Diplomacy);

    for (var convoyOrder in convoyOrders) {
      expect(convoyOrder is String, equals(true));
      expect(myDiplomacy.parseOrder(convoyOrder) is Convoy, equals(true));
    }
  });

  test('Incorrect Order Test', () {
    // define convoy orders to test
    List<String> myOrders = ['B Kie-Mun', 'F BEl-Bel', 'F Stp C Z Mos-Sev'];
    int count = 0;
    // create a diplomacy class to test parseOrder()
    // note: this currently fails due to the
    // way orders are defined in parseOrder()d
    Diplomacy myDiplomacy = Diplomacy();
    expect(true, myDiplomacy is Diplomacy);

    for (var myOrder in myOrders) {
      count++;
      expect(() => myDiplomacy.parseOrder(myOrder), throwsFormatException);
      print('Exception ' + count.toString() + ' found');
    }
  });
}
