part of model;

class FilePersistence extends Persistence {
  String usersTable = 'data/users';
  String gameMastersTable = 'data/gameMasters';

  @override
  Future<void> initialize() async {
    if (!await Directory('data').exists()) {
      await Directory('data').create();
    }

    if (!await Directory(usersTable).exists()) {
      await Directory(usersTable).create();
    }

    if (!await Directory(gameMastersTable).exists()) {
      await Directory(gameMastersTable).create();
    }

    initialized = true;
  }

  @override
  Future<void> storeObject(Map<String, dynamic> object, Table table) async {
    String tablePath;
    if (table == Table.users) {
      tablePath = usersTable;
    } else {
      tablePath = gameMastersTable;
    }

    if (!object.containsKey('id')) {
      throw StateError('Invalid object: \'id\' field does not exist');
    }

    await File('$tablePath/${object['id']}').writeAsString(jsonEncode(object));
  }

  @override
  Future<dynamic> readObject(String id, Table table) async {
    String tablePath;
    if (table == Table.users) {
      tablePath = usersTable;
    } else {
      tablePath = gameMastersTable;
    }

    var fileName = '$tablePath/$id';

    if (!await File(fileName).exists()) {
      throw StateError('Object does not exist');
    }

    return jsonDecode(await File(fileName).readAsString());
  }

  @override
  Future<void> waitForInitialization() async {
    while (!initialized) {
      await Future.delayed(Duration(milliseconds: 1));
    }
  }
}
