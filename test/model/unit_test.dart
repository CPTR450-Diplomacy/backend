import 'package:diplomacy/model/model.dart';
import 'package:test/test.dart';

void main(){
  test('Unit Test', () {
    Order order = '' as Order;
    Province position = '' as Province;
    UnitType type = '' as UnitType;
    Unit unit = Unit(order, position, type);
    
    expect(unit.order, isA<Order>());
  });
}

