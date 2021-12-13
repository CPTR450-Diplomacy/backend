part of model;

@JsonSerializable()
class Province {
  String name;
  ProvinceType provinceType;
  Set<Province> adjacentProvinces = {};
  bool hasSupplyCenter = false;

  Province(this.name, this.adjacentProvinces, this.hasSupplyCenter,
      this.provinceType);

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);
  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}

enum ProvinceType { inland, coastal, water }
