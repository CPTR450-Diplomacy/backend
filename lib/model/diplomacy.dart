part of model;

class ParseOrder{
Map<String, dynamic> json = {};
  // Singleton
  static ParseOrder? _instance;
  ParseOrder._internal(){
    _instance = this;
  }

  factory ParseOrder() => _instance ?? ParseOrder._internal();
}
class Diplomacy {
  Set<Session> sessions = {};
  Set<User> users = {};


  // Singleton
  static Diplomacy? _instance;
  Diplomacy._internal() {
    _instance = this;
  }
  factory Diplomacy() => _instance ?? Diplomacy._internal();

  User addNewUser(Map<String, dynamic> userInfo) {
    var newUser = User(userInfo['email'], userInfo['name']);
    users.add(newUser);
    return newUser;
  }

  String createSession(Map<String, dynamic> userInfo) {
    User user;
    try {
      user = users.firstWhere((u) => u.email == userInfo['email']);
    } on StateError {
      if (!users.map((u) => u.email).contains(userInfo['email'])) {
        user = addNewUser(userInfo);
      } else {
        rethrow;
      }
    }

    var sessionToken = generateRandomString(10);
    var session =
        Session(sessionToken, user, DateTime.now().add(Duration(days: 1)));
    sessions.add(session);
    return sessionToken;
  }

  // https://www.scottbrady91.com/dart/generating-a-crypto-random-string-in-dart
  String generateRandomString(int length) {
    final Random _random = Random.secure();
    var values = List<int>.generate(length, (i) => _random.nextInt(256));

    return base64Url.encode(values);
  }

  void reset() {
    _instance = null;
  }
}

// TODO parse orders (Sam, Stefan)
// orders controller takes json

//New controller to accept post request
// should have json , decode json , map after that
// should return nothing, if exception return internal error
// https://en.wikibooks.org/wiki/Diplomacy/Rules
// https://www.educative.io/edpresso/regex-in-dart
// https://media.wizards.com/2015/downloads/ah/diplomacy_rules.pdf

// Move: A/F PRV - PRV
// Hold: A/F PRV Holds
//Support: A/F PRV S A/F PRV - PRV
// Convoy:s A/F PRV C A PRV - PRV

final move_regex = RegExp(r'[AF]:space:[A-Z][a-z]{2}-[A-Z][a-z]{2}');
final holds_regex = RegExp(r'[AF]:space:[A-Z][a-z]{2}:space:Holds');
final support_regex = RegExp(
    r'[AF]:space:[A-Z][a-z]{2}:space:S:space:[AF]:space:[A-Z][a-z]{2}-[A-Z][a-z]{2}');
final convoy_regex = RegExp(
    r'F:space:[A-Z][a-z]{2}:space:C:space:A:space:[A-Z][a-z]{2}-[A-Z][a-z]{2}');

// throw anything that doesn't match that
// also encapsulate inside an object instead of float here like a silly person