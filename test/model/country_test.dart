import 'package:diplomacy/model/model.dart';
import 'package:test/test.dart';

void main(){
  test('Country Test', () {
    String name = 'Germany';
    Set<Province> province = {};
    Country country = Country(name, province);
    expect(country.name, isA<String>());
    expect(country.province, isA<Province>());
  });
}
