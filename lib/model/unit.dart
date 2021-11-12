part of model;

class Unit {
  Order order = '' as Order;
  Province position = '' as Province;
  UnitType type  = '' as UnitType;

  Unit(this.order, this.position, this.type);
}

class UnitType {
  Type type = '' as Type;
}

// TODO link the order from order.dart to this file
