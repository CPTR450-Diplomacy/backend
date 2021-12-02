import 'dart:convert';

import 'package:diplomacy/model/model.dart';
import 'package:test/test.dart';

void main() {
  tearDown(() {
    Diplomacy().reset();
  });
  test('Test addNewUser()', () {
    var mockUserInfo = {'email': 'test@email.com', 'name': 'Diplomacy Tester'};
    expect(Diplomacy().users.length, equals(0));
    Diplomacy().addNewUser(mockUserInfo);
    expect(Diplomacy().users.length, equals(1));
    expect(Diplomacy().users.elementAt(0).name, equals('Diplomacy Tester'));
    expect(Diplomacy().users.elementAt(0).email, equals('test@email.com'));
  });
  test('Test createSession()', () {
    var mockUserInfo = {'email': 'test@email.com', 'name': 'Diplomacy Tester'};
    expect(Diplomacy().users.length, equals(0));
    var token = Diplomacy().createSession(mockUserInfo);
    expect(Diplomacy().users.length, equals(1));
    expect(base64Url.decode(token).length, equals(10));
  });
  test('Test generateRandomString()', () {
    expect(base64Url.decode(Diplomacy().generateRandomString(10)).length,
        equals(10));
  });
}
