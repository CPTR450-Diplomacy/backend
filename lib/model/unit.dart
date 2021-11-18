part of model;

@JsonSerializable()
class Unit {
  Order order = '' as Order;
  Province position = '' as Province;
  UnitType type = '' as UnitType;

  Unit(this.order, this.position, this.type);

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
  Map<String, dynamic> toJson() => _$UnitToJson(this);
}

@JsonSerializable()
class UnitType {
  Type type = '' as Type;

  factory UnitType.fromJson(Map<String, dynamic> json) =>
      _$UnitTypeFromJson(json);
  Map<String, dynamic> toJson() => _$UnitTypeToJson(this);
}

// TODO link the order from order.dart to this file
