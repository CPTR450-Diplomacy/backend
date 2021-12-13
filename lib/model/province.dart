part of model;

@JsonSerializable()
class Province {
  static Province province = '' as Province;
  Set<Province> adjacentProvinces = {};
  Unit unit;
  bool hasSupplyCenter = false;

  Province(this.adjacentProvinces, this.unit, this.hasSupplyCenter);

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);
  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}
