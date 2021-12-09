import 'player.dart';
import 'country.dart';
import 'province.dart';
import 'order.dart';

const countries = [
  'Austria',
  'England',
  'France',
  'Germany',
  'Italy',
  'Russia',
  'Turkey'
];

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

enum Season { spring, fall }

class GameYear {
  GameYear([this.season = Season.spring, this.year = 1901]);

  Season season;
  int year;
}

class GameMaster {
  // Default constructor: seven players
  GameMaster(List<String> names, {this.id}) {
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
  List<Order>? orders;

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

  Map<String, List<String>> whoControlsWhatProvinces() {
    // TODO: Fix this function
    Map<String, List<String>> theMap = {};
    for (var player in players) {
      // This assumes 7 players
      var playerCntry = player.allegiences.first;
      List<String> provinces = [];
      for (var province in playerCntry.provinces) {
        provinces.add(province.name);
      }
      theMap[playerCntry.name] = provinces;
    }
    return theMap;
  }

  void _assignCountries(List<Player> players) {
    // TODO: allow for random assignment via parameter?
    if (players.length == 7) {
      for (int i = 0; i < players.length; ++i) {
        players[i].allegiences.add(Country(name: countries[i]));
      }
    } else {
      // Not implemented
    }
  }

  void advanceYear() {
    if (currentYear.season == Season.fall) {
      currentYear.season = Season.spring;
      currentYear.year += 1;
    } else {
      currentYear.season = Season.fall;
    }
  }

  // TODO: Fill set of provinces with full list of provinces

  void _assignProvinces(List<Player> players) {
    if (players.length == 7) {
      // Each player represents one country
      for (var player in players) {
        // Assign provinces to country
        var playerCntry = player.allegiences.first;
        var provincesToAdd = startProvinces[playerCntry.name];
        if (provincesToAdd != null) {
          for (var province in provincesToAdd) {
            // TODO: assign players object from GameMaster
            playerCntry.provinces.add(Province(name: province));
          }
        }
      }
    }
  }

  void receiveOrders(List<Order> orders) {
    this.orders = orders;
  }

  Map<String, List<String>> resolveOrders() {
    // TODO: Actually move the units
    // For now this just updates the provinces.
    var theProvinces = whoControlsWhatProvinces();
    for (var order in orders!) {
      var provinces = theProvinces[order.country];
      var i = provinces?.indexOf(order.src);
      provinces?[i!] = "[C] " + order.dst;
      theProvinces[order.country] = provinces!;
    }
    return theProvinces;
  }

  void _resolveYear() {
    _resolveSeason();
    _unitRebalance();
  }

  void _setDependencies() {
    // What does an order depend on?
  }

  void _resolveSeason() {
    _setDependencies();
  }

  void _unitRebalance() {}
}
