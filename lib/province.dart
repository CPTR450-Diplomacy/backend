enum ProvinceType { inland, coastal, water }

class Province {
  Province({required this.name});

  String name;
  late ProvinceType type;
  Set<Province>? adjacentProvinces;
  //Unit? occupiedBy;
  late bool hasSupplyCenter;
}
