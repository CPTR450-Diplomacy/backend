import 'package:diplomacy/model/model.dart';
import 'package:test/test.dart';


void main(){
  test('Player Test', () {
    Player player = Player();
    expect(player.name, isA<String>());

  });
}

/*
    expect(player.allegiances, <Country>(){

    });
    
*/