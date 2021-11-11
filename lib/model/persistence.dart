part of model;

enum Table { users, gameMasters }

abstract class Persistence {
  bool initialized = false;

  Persistence() {
    initialize();
  }

  Future<void> initialize();
  // TODO replace maps with class
  Future<void> storeObject(Map<String, dynamic> object, Table table);
  Future<dynamic> readObject(String id, Table table);
  Future<void> waitForInitialization();
}
