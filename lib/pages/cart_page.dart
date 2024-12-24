import 'package:coffee_shop02/components/coffee_tile.dart';
import 'package:coffee_shop02/model/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/coffee.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //remove item from cart
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            // your cart
            Text(
              'Your Cart',
              style: TextStyle(fontSize: 20),
            ),

            //list  of cart items
            Expanded(child: ListView.builder(itemBuilder: (context, index) {
              // get individual cart items
              Coffee eachCoffee = value.userCart[index];

              //return the coffee tile
              return CoffeeTile(
                  coffee: eachCoffee,
                  onPressed: () => removeFromCart(eachCoffee),
                  icon: Icon(Icons.delete));
            }))
          ],
        ),
      )),
    );
  }
}
