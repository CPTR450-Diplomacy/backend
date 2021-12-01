part of model;

class User {
  final String email;

  final String name;

  final Set<Player> players = {};

  User(this.email, this.name);
}
