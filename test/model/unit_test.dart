import 'package:test/test.dart';
import 'package:diplomacy/model/model.dart';

void main() {
  test('Unit Test', () {
    Set<Province> adjacents1 = {};
    bool supply1 = true;

    Province source = Province('ABC', adjacents1, supply1, ProvinceType.inland);

    UnitType type = UnitType.army;
    Unit unit = Unit(source, type);

    expect(unit.position, isA<Province>());
    expect(unit.type, isA<UnitType>());
  });
}
