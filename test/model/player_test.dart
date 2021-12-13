import 'package:diplomacy/model/model.dart';
import 'package:test/test.dart';


void main(){
  test('Player Test', () {
    String name = 'DartMaster5000';
    Set<Country> allegiances = {};
    Player player = Player(name,allegiances);
    expect(player.name, isA<String>());
    expect(player.name, equals('DartMaster5000'));
    expect(player.allegiances, isA<Set>());
  });
}
