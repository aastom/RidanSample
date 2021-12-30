// ignore_for_file: prefer_const_constructors

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ridan_sample/models/products.dart';
import 'package:ridan_sample/pages/cart.dart';
import 'package:ridan_sample/pages/home.dart';
import 'package:ridan_sample/provider/cart_provider.dart';
import 'package:ridan_sample/utils/utils.dart';
import 'package:ridan_sample/widgets/cart_badge.dart';
import 'package:ridan_sample/widgets/radio.dart';
import 'package:ridan_sample/widgets/silder.dart';

class ProductDetailPage extends StatefulWidget {
  // final String? image;
  // final String? title;
  // final String? price;
  final Products? product;
  const ProductDetailPage({
    Key? key,
    this.product,
  }) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  
 

  int indexTop = 0;
  double valueBottom = 20;

  @override
  Widget build(BuildContext context) {
    String src = "assets/images/denim.jpg";
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      // ignore: prefer_const_literals_to_create_immutables
      body: SliderTheme(
        data: SliderThemeData(
            // trackHeight: 16,
            // trackShape:RectangularSliderTrackShape(),
            // thumbShape:RoundSliderThumbShape(enabledThumbRadius:20.0,elevation:3,)
            ),
        child: Container(
            child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    height: 350,
                    width: screenWidth,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50.0),
                        bottomLeft: Radius.circular(50.0),
                      ),
                      child: Image.network(
                        widget.product!.image.toString(),
                        fit: BoxFit.cover,
                        isAntiAlias: true,
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 32, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => Home()));
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          CartBadge()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Flexible(
                          child: Text(
                            widget.product!.title.toString(),
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            r'$' + widget.product!.price.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Text(
                              r'$52.99',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Text('Colour'),
                        ],
                      ),
                    ),
                    RadioWidget(),
                    Row(
                      children: [Text('Size')],
                    ),

                    const SizedBox(height: 16),
                    
                    SliderWidget(),

                    //button
                    addToCartButton(context)
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  SizedBox addToCartButton(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [
              Colors.blue.shade800,
              Colors.blue.shade200,
            ],
          ),
          color: Colors.blue.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton(
            style: ButtonStyle(
              // minimumSize:  MaterialStateProperty.all<Size>(),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  // side: BorderSide(color: Colors.red),
                ),
              ),
              elevation: MaterialStateProperty.all<double>(5.0),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {
              addToCart(widget.product);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            child: Text('Add To Cart')),
      ),
    );
  }

  

  ///Slider Helper Methods

  void addToCart(Products? product) {
    var cartProvider = Provider.of<CartManager>(context, listen: false);
    cartProvider.addToCart(product!);
  }
}
