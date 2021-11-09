part of model;

enum Table { users, gameMasters }

abstract class Persistence {
  // TODO replace maps with class
  void storeObject(dynamic object, Table table);
  dynamic readObject(String id, Table table);
}
