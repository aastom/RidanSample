import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ridan_sample/pages/cart.dart';
import 'package:ridan_sample/provider/cart_provider.dart';

class CartBadge extends StatefulWidget {
  const CartBadge({Key? key}) : super(key: key);

  @override
  _CartBadgeState createState() => _CartBadgeState();
}

class _CartBadgeState extends State<CartBadge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<CartManager>(builder: (context, cartData, child) {
        return Badge(
          showBadge: cartData.carts.length == 0 ? false : true,
          position: BadgePosition.topEnd(top: 0, end: 3),
          animationDuration: Duration(milliseconds: 300),
          animationType: BadgeAnimationType.slide,
          badgeContent: Text(
            cartData.carts.length.toString(),
            style: TextStyle(color: Colors.white),
          ),
          child: IconButton(
            icon: Icon(Icons.shopping_cart_outlined,color: Colors.white,),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext buildContext) => CartPage()),
              );
            },
          ),
        );
      }),
    );
  }
}
