part of model;

@JsonSerializable()
class Country {
  String name = "";
  Set<Province> province = {};

  Country(this.name, this.province);
  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  /// Connect the generated [_$CountryToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
