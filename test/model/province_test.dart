import 'package:test/test.dart';
import 'package:diplomacy/model/model.dart';

void main(){
  test('Province Test', () {
    Set<Province> adjacents = {};
    bool supply = true;

    Province province1 = Province(adjacents, supply);
    expect(province1.adjacentProvinces, isA<Set>());
    expect(province1.hasSupplyCenter, isA<bool>());
    expect(province1.hasSupplyCenter, equals(true));
  });
}

