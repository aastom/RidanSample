// ignore_for_file: avoid_unnecessary_containers, unnecessary_string_interpolations, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ridan_sample/models/products.dart';
import 'package:ridan_sample/pages/product_details.dart';
import 'package:ridan_sample/services/api.dart';
import 'package:ridan_sample/widgets/cart_badge.dart';
import 'package:ridan_sample/widgets/categories_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // getTheProducts();
    // getAllProducts().then((value) => print(value));
  }

  

  @override
  Widget build(BuildContext context) {
   // getAllProducts();
    String src = "assets/images/denim.jpg";
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      // height: screenHeight,
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          //Carousel
          Expanded(
            flex: 1,
            child:Stack(
                children: [
                  Container(
                    height: 350,
                    width: screenWidth,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50.0),
                        bottomLeft: Radius.circular(50.0),
                      ),
                      child: Image.asset(
                        src,
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
                             
                             
                            },
                            icon: Icon(
                              Icons.search,
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

          //Trending List

          Expanded(
            child: Container(
              height: 200,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Trending',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        ),
                        Text(
                          'Show all',
                          style:
                              TextStyle(color: Colors.blue[400], fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  //Product List
                  Container(
                    height: 150,
                    child: FutureBuilder<List<Products>>(
                      future: getAllProducts(),
                      builder: (BuildContext context, AsyncSnapshot<List<Products>> snapshot) {
                        if (snapshot.connectionState == ConnectionState.none &&
                            snapshot.hasData == null) {
                          return Container(
                            height: 150,
                          );
                        }

                        if(snapshot.data== null){
                          return Container(
                            height: 150,
                          );
                        }

                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            padding: EdgeInsets.all(8),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return newCardMethod(snapshot.data![index]);
                            });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Category List
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey[700]),
                    ),
                    Text(
                      'show all',
                      style: TextStyle(color: Colors.blue[400], fontSize: 12),
                    )
                  ],
                ),
              ),
              // ignore: prefer_const_constructors
              CategoryList(),
            ],
          ),
        ],
      ),
    );
  }

  Card newCardMethod(Products product) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 3,
      child: Container(
        height: 140,
        width: 120,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: 150,
                child: Image.network(
                  product.image,
                  // product['image'],
                  fit: BoxFit.fill,
                  isAntiAlias: false,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        product: product,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(4),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Container(
                              child: Text(
                                product.title.toString(),
                                overflow: TextOverflow.ellipsis,
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: [
                              Text(
                                r'$' + product.price.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  // color: Colors.grey
                                ),
                              ),
                            ],
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
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
