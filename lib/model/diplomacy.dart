part of model;

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

  Order parseOrder(String orderRegexExp) {
    // Move: A/F PRV - PRV
    final moveRegex = RegExp(r'[AF](\s)[A-Z][a-z]{2}-[A-Z][a-z]{2}');

    // Hold: A/F PRV Holds
    final holdsRegex = RegExp(r'[AF](\s)[A-Z][a-z]{2}(\s)Holds');

    //Support: A/F PRV S A/F PRV - PRV
    final supportRegex = RegExp(
        r'[AF](\s)[A-Z][a-z]{2}(\s)S(\s)[AF](\s)[A-Z][a-z]{2}-[A-Z][a-z]{2}');

    // Convoy:s F PRV C A PRV - PRV
    final convoyRegex =
        RegExp(r'F(\s)[A-Z][a-z]{2}(\s)C(\s)A(\s)[A-Z][a-z]{2}-[A-Z][a-z]{2}');

    if (supportRegex.hasMatch(orderRegexExp)) {
      // TODO remove test source and destination provinces in favor of lookup in gamemaster
      Province source = Province(
          orderRegexExp.substring(10, 12), {}, false, ProvinceType.inland);
      Province destination = Province(
          orderRegexExp.substring(14, 16), {}, false, ProvinceType.inland);
      // call support constructor
      Move supportedMove = Move(source, destination);
      Province supportSource = Province(
          orderRegexExp.substring(2, 4), {}, false, ProvinceType.inland);
      Support orderParsed = Support(supportSource, supportedMove);
      return orderParsed;
    } else if (holdsRegex.hasMatch(orderRegexExp)) {
      Province source = Province(
          orderRegexExp.substring(2, 4), {}, false, ProvinceType.inland);
      // call holds constructor
      Hold orderParsed = Hold(source);
      return orderParsed;
    } else if (convoyRegex.hasMatch(orderRegexExp)) {
      Province source = Province(
          orderRegexExp.substring(10, 12), {}, false, ProvinceType.inland);
      Province destination = Province(
          orderRegexExp.substring(14, 16), {}, false, ProvinceType.inland);
      // call convoy constructor
      Move convoyedMove = Move(source, destination);
      Province convoySource = Province(
          orderRegexExp.substring(2, 4), {}, false, ProvinceType.inland);
      Convoy orderParsed = Convoy(convoySource, convoyedMove);
      return orderParsed;
    } else if (moveRegex.hasMatch(orderRegexExp)) {
      Province source = Province(
          orderRegexExp.substring(2, 4), {}, false, ProvinceType.inland);
      Province destination = Province(
          orderRegexExp.substring(6, 8), {}, false, ProvinceType.inland);
      // call move constructor
      Move orderParsed = Move(source, destination);
      return orderParsed;
    } else {
      throw FormatException('Invalid order code');
    }
  }

  void reset() {
    _instance = null;
  }
}

// TODO should have json , decode json , map after that
// should return nothing, if exception return internal error,
// throw anything that doesn't match that
// also encapsulate inside an object instead of float here like a silly person

// https://en.wikibooks.org/wiki/Diplomacy/Rules
// https://www.educative.io/edpresso/regex-in-dart
// https://media.wizards.com/2015/downloads/ah/diplomacy_rules.pdf