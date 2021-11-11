import 'package:diplomacy/model/model.dart';
import 'package:test/test.dart';

void main(){
  test('Country Test', () {
    Country country = Country();
    expect(country.name, isA<String>());
    expect(country.province, isA<Province>());
  });
}

/*
    expect(country.province, <Province>(){
      'baja' ; 
      'blast';
    });
 */