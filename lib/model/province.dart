part of model;

// TODO change String to Province type
Map<String, String> controlledProvince = {
// Germany
    'Ank': 'Germany',
    'Con': 'Germany',
    'Smy': 'Germany',
// England
    'Lon': 'England',
    'Edi': 'England',
    'Lvp': 'England',
// France
    'Par': 'France',
    'Mar': 'France',
    'Bre': 'France',
// Italy
    'Rom': 'Italy',
    'Ven': 'Italy',
    'Nap': 'Italy',
// Turkey
    'Ank': 'Turkey',
    'Con': 'Turkey',
    'Smy': 'Turkey',
// Russia
    'War': 'Russia',
    'Mos': 'Russia',
    'Sev': 'Russia',
    'Stp': 'Russia',
};

Map <String, String> uncontrolledProvince = {
    'Bel': "",
    'Bul': "",
    'Den': "",
    'Gre': "",
    'Hol': "",
    'Nwy': "",
    'Por': "",
    'Rum': "",
    'Ser': "",
    'Spa': "",
    'Swe': "",
    'Tun': ""
};
class Province {
  // TODO modify static province definition
  static Province province = '' as Province;
  Set<Province> adjacentProvinces = {};
  Unit unit = '' as Unit;
  bool hasSupplyCenter = false;
}

