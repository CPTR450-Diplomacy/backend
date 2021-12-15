// GENERATED CODE - DO NOT MODIFY BY HAND

part of model;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      json['name'] as String,
      (json['province'] as List<dynamic>)
          .map((e) => Province.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'province': instance.province.toList(),
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      Province.fromJson(json['source'] as Map<String, dynamic>),
      json['destination'] == null
          ? null
          : Province.fromJson(json['destination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'source': instance.source,
      'destination': instance.destination,
    };

Hold _$HoldFromJson(Map<String, dynamic> json) => Hold(
      json['source'],
    )..destination = json['destination'] == null
        ? null
        : Province.fromJson(json['destination'] as Map<String, dynamic>);

Map<String, dynamic> _$HoldToJson(Hold instance) => <String, dynamic>{
      'source': instance.source,
      'destination': instance.destination,
    };

Move _$MoveFromJson(Map<String, dynamic> json) => Move(
      json['source'],
      json['destination'],
    );

Map<String, dynamic> _$MoveToJson(Move instance) => <String, dynamic>{
      'source': instance.source,
      'destination': instance.destination,
    };

Support _$SupportFromJson(Map<String, dynamic> json) => Support(
      json['source'],
      Move.fromJson(json['orderSupported'] as Map<String, dynamic>),
    )..destination = json['destination'] == null
        ? null
        : Province.fromJson(json['destination'] as Map<String, dynamic>);

Map<String, dynamic> _$SupportToJson(Support instance) => <String, dynamic>{
      'source': instance.source,
      'destination': instance.destination,
      'orderSupported': instance.orderSupported,
    };

Convoy _$ConvoyFromJson(Map<String, dynamic> json) => Convoy(
      json['source'],
      Move.fromJson(json['orderSupported'] as Map<String, dynamic>),
    )..destination = json['destination'] == null
        ? null
        : Province.fromJson(json['destination'] as Map<String, dynamic>);

Map<String, dynamic> _$ConvoyToJson(Convoy instance) => <String, dynamic>{
      'source': instance.source,
      'destination': instance.destination,
      'orderSupported': instance.orderSupported,
    };

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      json['name'] as String,
      (json['allegiances'] as List<dynamic>)
          .map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'name': instance.name,
      'allegiances': instance.allegiances.toList(),
    };

Province _$ProvinceFromJson(Map<String, dynamic> json) => Province(
      json['name'] as String,
      (json['adjacentProvinces'] as List<dynamic>)
          .map((e) => Province.fromJson(e as Map<String, dynamic>))
          .toSet(),
      json['hasSupplyCenter'] as bool,
      $enumDecode(_$ProvinceTypeEnumMap, json['provinceType']),
    );

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'name': instance.name,
      'provinceType': _$ProvinceTypeEnumMap[instance.provinceType],
      'adjacentProvinces': instance.adjacentProvinces.toList(),
      'hasSupplyCenter': instance.hasSupplyCenter,
    };

const _$ProvinceTypeEnumMap = {
  ProvinceType.inland: 'inland',
  ProvinceType.coastal: 'coastal',
  ProvinceType.water: 'water',
};

Unit _$UnitFromJson(Map<String, dynamic> json) => Unit(
      Province.fromJson(json['position'] as Map<String, dynamic>),
      $enumDecode(_$UnitTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
      'position': instance.position,
      'type': _$UnitTypeEnumMap[instance.type],
    };

const _$UnitTypeEnumMap = {
  UnitType.fleet: 'fleet',
  UnitType.army: 'army',
};
