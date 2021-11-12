import 'player.dart';
import 'country.dart';
import 'province.dart';
import 'order.dart';

const countries = <String>{
    'Austria',
    'England',
    'France',
    'Germany',
    'Italy',
    'Russia',
    'Turkey'
};

const startProvinces = <String, List<String>>{
    // TODO: Change these to abbreviations
    'Austria': ['Vienna', 'Budapest', 'Trieste'],
    'England': ['London', 'Edinburgh', 'Liverpool'],
    'France': ['Paris', 'Marseilles', 'Brest'],
    'Germany': ['Berlin', 'Munich', 'Kiel'],
    'Italy': ['Rome', 'Venice', 'Naples'],
    'Russia': ['Moscow', 'Sevastopol', 'Warsaw', 'St. Petersburg (SC)'],
    'Turkey': ['Ankara', 'Constantinople', 'Smyrna']
};

enum PhaseName {
  diplomatic,
  orderWriting,
  orderResolution,
  retreatDisband,
  gainLoseUnits
}

enum Season {
  spring,
  fall
}

class GameYear {
  GameYear([this.season = Season.spring, this.year = '1901']);

  Season season;
  String year;
}

class GameMaster {
    // Default constructor: seven players
    GameMaster(List<String> names, {this.id}) {
        // TODO: assert list length is 7
        numPlayers = 7;
        players = List<Player>.empty(growable: true);
        provinces = <Province>{};
        for (var name in names) { 
          players.add(Player(name: name));
        }
        // Randomly assign players with country based on lookup
        _assignCountries(players);
        // Assign each province based on dictionary lookup
        _assignProvinces(players);
    }
    // TODO: GameMaster.fromJSON() constructor
    /* Named constructors for fewer players
    GameMaster.sixPlayers({String id = 1}) {}
    GameMaster.fivePlayers({String id = 1}) {}
    GameMaster.fourPlayers({String id = 1}) {}
    GameMaster.threePlayers({String id = 1}) {}
    GameMaster.twoPlayers({String id = 1}) {}
    */
    // Public variables
    late int numPlayers;
    late List<Player> players;
    late Set<Province> provinces;
    var currentYear = GameYear();
    PhaseName currentPhase = PhaseName.diplomatic;

    // Private variables
    late String? id;
    List<Order>? _orders;

    // Getters
    List<Order> get orders => _orders;
    
    // Methods
    List<String> getPlayerNames() {
      var theList = <String>[];
      for (var player in players) {
        theList.add(player.name);
      }
      return theList;
    }

    Map<String, String> whoControlsWhatCountry() {
      Map<String, String> theMap = {};
      for (var player in players) {
        // This assumes 7 players
        theMap[player.name] = player.allegiences.first.name;
      }
      return theMap;
    }

    Map<String, String> whoControlsWhatProvinces() {
      // TODO: Fix this function
      Map<String, String> theMap = {};
      for (var player in players) {
        // This assumes 7 players
        theMap[player.name] = player.allegiences.first.name;
      }
      return theMap;
    }

    void _assignCountries(List<Player> players) {
        // TODO: allow for random assignment via parameter?
        if (players.length == 7) {
            for (int i = 0; i < players.length; ++i) {
                players[i].allegiences?.add( new Country(name: COUNTRIES[i]) );
            }
        } else {
            // Not implemented
        }
    }

    void advanceYear() {
      // TODO: Figure out next year
      _setNextYear(Season.fall, '1901');
    }

    void _setNextYear(Season season, String year) {
      // TODO: This function
    }

    void _assignProvinces(List<Player> players) {
        if (players.length == 7) {
            // Each player represents one country
            for (player in players) {
                // Assign provinces to country
                var playerCntry = player.allegiances.first;
                playerCntry.provinces.add(startProvinces[player.name]);
            }
        }
    }

    void resolveYear() {
        resolveSeason();
        unitRebalance();
    }

    void _setDependencies()

    void resolveYear();

    
    void resolveSeason() {
        // checkValidity();
        _setDependencies();


    }
}