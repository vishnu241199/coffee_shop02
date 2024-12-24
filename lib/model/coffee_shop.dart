import 'package:coffee_shop02/model/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  //coffee for sale list
  final List<Coffee> _shop = [
    //back coffee
    Coffee(
        name: 'Back Coffee',
        price: '30',
        imagePath: "lib/images/blackcoffee.png"),
    //latte
    Coffee(name: 'Latte', price: '80', imagePath: "lib/images/latteart.png"),

    // green tea
    Coffee(
        name: 'Green Tea', price: '60',  imagePath: "lib/images/greentea.png"),

    //doughnut
    Coffee(
        name: 'Doughnut', price: '100', imagePath: "lib/images/doughnut.png"),
  ];

  //user cart
  List<Coffee> _userCart = [];

  var userCart;

  //get coffee list
  List<Coffee> get coffeeShop => _shop;

  //get user cart
  List<Coffee> get UserCart => _userCart;

  //add item to the cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
