part of model;

@JsonSerializable()
class Order {
  Province destination = '' as Province;
  void resolve() {}

  Order(destination);
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class Hold extends Order {
  Hold(destination) : super(destination);
  factory Hold.fromJson(Map<String, dynamic> json) => _$HoldFromJson(json);

  Map<String, dynamic> toJson() => _$HoldToJson(this);
}

@JsonSerializable()
class Move extends Order {
  Move(destination) : super(destination);

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);

  Map<String, dynamic> toJson() => _$MoveToJson(this);
}

@JsonSerializable()
class Support extends Order {
  Support(destination) : super(destination);

  factory Support.fromJson(Map<String, dynamic> json) =>
      _$SupportFromJson(json);

  Map<String, dynamic> toJson() => _$SupportToJson(this);
}

@JsonSerializable()
class Convoy extends Order {
  Convoy(destination) : super(destination);

  factory Convoy.fromJson(Map<String, dynamic> json) => _$ConvoyFromJson(json);

  Map<String, dynamic> toJson() => _$ConvoyToJson(this);
}
