
part of model;

class Order {
  Province destination = '' as Province;
  void resolve(){}
}

class Hold extends Order{}

class Move extends Order{}

class Support extends Order{}

class Convoy extends Order{}