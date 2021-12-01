part of model;

@JsonSerializable()
class Player {
  String name = "";
  Set<Country> allegiances = {};

  Player(this.name, this.allegiances);

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
