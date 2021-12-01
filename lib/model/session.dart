part of model;

class Session {
  final String token;

  final User user;

  final DateTime expires;

  Session(this.token, this.user, this.expires);
}
