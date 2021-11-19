import 'province.dart';

class Country {
  Country({required this.name});
  String name;
  Set<Province> provinces = <Province>{};
}
