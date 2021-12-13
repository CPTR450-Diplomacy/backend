part of model;

@JsonSerializable()
class Order {
  // TODO change source and destination to Provinces selected from GameMaster
  String source;
  String? destination;
  void resolve() {}

  Order(this.source, this.destination);
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class Hold extends Order {
  Hold(source) : super(source, null);
  factory Hold.fromJson(Map<String, dynamic> json) => _$HoldFromJson(json);

  Map<String, dynamic> toJson() => _$HoldToJson(this);
}

@JsonSerializable()
class Move extends Order {
  Move(source, destination) : super(source, destination);

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);

  Map<String, dynamic> toJson() => _$MoveToJson(this);
}

@JsonSerializable()
class Support extends Order {
  Move orderSupported;

  Support(source, this.orderSupported) : super(source, null);

  factory Support.fromJson(Map<String, dynamic> json) =>
      _$SupportFromJson(json);

  Map<String, dynamic> toJson() => _$SupportToJson(this);
}

@JsonSerializable()
class Convoy extends Order {
  Move orderSupported;

  Convoy(source, this.orderSupported) : super(source, null);

  factory Convoy.fromJson(Map<String, dynamic> json) => _$ConvoyFromJson(json);

  Map<String, dynamic> toJson() => _$ConvoyToJson(this);
}
