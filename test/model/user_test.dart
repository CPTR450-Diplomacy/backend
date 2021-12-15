import 'package:test/test.dart';
import 'package:diplomacy/model/model.dart';

void main(){
  test('User Test', () {
    String email = 'abc123@wallawalla.edu';
    String name = 'TheRealGabagool';
    User user = User(email, name);
    expect(user.email, isA<String>());
    expect(user.email, equals('abc123@wallawalla.edu'));
    expect(user.name, isA<String>());
    expect(user.name, equals('TheRealGabagool'));
  });
}

