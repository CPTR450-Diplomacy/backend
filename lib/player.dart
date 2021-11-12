import 'country.dart';

class Player {
  Player({required this.name}) {
    allegiences = <Country>{};
  }
  String name;
  late Set<Country> allegiences;
}
