
part of model;

class Order {
  Province destination = '' as Province;
  void resolve(){}

  Order(destination);
}

class Hold extends Order{
  Hold(destination) : super(destination);
}

class Move extends Order{
  Move(destination) : super(destination);
}

class Support extends Order{
  Support(destination) : super(destination);
}

class Convoy extends Order{
  Convoy(destination) : super(destination);
}