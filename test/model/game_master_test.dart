import 'package:diplomacy/model/model.dart';
import 'package:test/test.dart';

void main() {
  // Build a GameMaster with 7 players
  test('GameMaster_SevenPlayer_Constructor', () {
    var names = [
      'Abigail',
      'Benny',
      'Carly',
      'Duncan',
      'Evan',
      'Fiona',
      'Grant'
    ];
    GameMaster ourGM = GameMaster(names, id: 'test_id');
    expect(ourGM.numPlayers, 7);
    expect(ourGM.getPlayerNames(), names);
    expect(ourGM.id, 'test_id');
    expect(ourGM.whoControlsWhatCountry(), <String, String>{
      'Abigail': 'Austria',
      'Benny': 'England',
      'Carly': 'France',
      'Duncan': 'Germany',
      'Evan': 'Italy',
      'Fiona': 'Russia',
      'Grant': 'Turkey'
    });
    expect(ourGM.whoControlsWhatProvinces(), <String, List<String>>{
      'Austria': ['Vienna', 'Budapest', 'Trieste'],
      'England': ['London', 'Edinburgh', 'Liverpool'],
      'France': ['Paris', 'Marseilles', 'Brest'],
      'Germany': ['Berlin', 'Munich', 'Kiel'],
      'Italy': ['Rome', 'Venice', 'Naples'],
      'Russia': ['Moscow', 'Sevastopol', 'Warsaw', 'St. Petersburg (SC)'],
      'Turkey': ['Ankara', 'Constantinople', 'Smyrna']
    });
    var testGY = GameYear();
    expect(ourGM.currentYear.season, testGY.season);
    expect(ourGM.currentYear.year, testGY.year);
    expect(ourGM.currentPhase, PhaseName.diplomatic);
    ourGM.advanceYear();
    expect(ourGM.currentYear.season, GameYear(Season.fall).season);
    ourGM.advanceYear();
    expect(ourGM.currentYear.season, GameYear(Season.spring).season);
    expect(ourGM.currentYear.year, 1902);

    // Sample game tests

    // I don't have time to edit all my order declarations to reference provinces
    List<Order> ordersList = [];

    // Thus these tests need to be refactored to have updated provinces
    ourGM.receiveOrders(ordersList);
    ourGM.resolveOrders();
    expect(ourGM.whoControlsWhatProvinces(), <String, List<String>>{
      'Austria': ['Vienna', 'Budapest', 'Trieste'],
      'England': ['London', 'Edinburgh', 'Liverpool'],
      'France': ['Paris', 'Marseilles', 'Brest'],
      'Germany': ['Berlin', 'Munich', 'Kiel'],
      'Italy': ['Rome', 'Venice', 'Naples'],
      'Russia': ['Moscow', 'Sevastopol', 'Warsaw', 'St. Petersburg (SC)'],
      'Turkey': ['Ankara', 'Constantinople', 'Smyrna']
    });
  });
}
