part of model;

@JsonSerializable()
class Unit {
  Province position;
  UnitType type;

  Unit(this.position, this.type);

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
  Map<String, dynamic> toJson() => _$UnitToJson(this);
}

enum UnitType { fleet, army }

// TODO link the order from order.dart to this file
