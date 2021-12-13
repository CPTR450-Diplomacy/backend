import 'package:test/test.dart';
import 'package:diplomacy/model/model.dart';

void main(){
  test('Unit Test', () {
    Set<Province> adjacents1 = {};
    bool supply1 = true;

    Set<Province> adjacents2 = {};
    bool supply2 = false;

    Province source = Province(adjacents1, supply1);
    Province destination = Province(adjacents2, supply2);

    Order order = Order(source, destination);
    UnitType type = UnitType.army;
    Unit unit = Unit(order, source, type);

    expect(unit.order, isA<Order>());
    expect(unit.position, isA<Province>());
    expect(unit.type, isA<UnitType>());
  });
}

