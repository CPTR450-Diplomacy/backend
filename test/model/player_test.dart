import 'package:diplomacy/model/model.dart';
import 'package:test/test.dart';


void main(){
  test('Player Test', () {
    String name = '';
    Set<Country> allegiances = {};
    Player player = Player(name,allegiances);
    expect(player.name, isA<String>());

  });
}
