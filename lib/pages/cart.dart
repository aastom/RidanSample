import 'package:flutter/material.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:provider/provider.dart';
import 'package:ridan_sample/models/products.dart';
import 'package:ridan_sample/provider/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Products> cartItems = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    cartItems = Provider.of<CartManager>(context).carts;

    

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.70,
            child: ListView.builder(
                itemCount: cartItems.length,
                // itemExtent: 100,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (val) {},
                    key: ValueKey("dissmiss"),
                    background: buildSwipeActionRight(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    // margin: EdgeInsets.symmetric(horizontal: 16),
                                    height: 120,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        scale: 2,
                                        fit: BoxFit.fitHeight,
                                        image: NetworkImage(
                                              cartItems[index].image),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            cartItems[index].title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20),
                                          ),
                                        ),
                                        SizedBox(height:10),
                                      
                                        
                                        Container(
                                          child: CustomNumberPicker(
                                            initialValue: 1,
                                            maxValue: 1000000,
                                            minValue: 0,
                                            step: 1,
                                            onValue: (value) {
                                              print(value.toString());
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Text(
                                         r'$'+ cartItems[index].price.toString(),
                                        ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Container(
            color: Colors.grey[100],
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text('Total',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                r'$152.90',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 280,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 5.0)
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              // side: BorderSide(color: Colors.red),
                            ),
                          ),
                          elevation: MaterialStateProperty.all<double>(5.0),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => CartPage())

                          //         );
                        },
                        child: Text('Checkout')),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildSwipeActionRight() => Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.blue,
        child: Icon(Icons.delete_forever, color: Colors.white, size: 32),
      );
}
