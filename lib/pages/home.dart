import 'package:flutter/material.dart';
import 'package:ridan_sample/pages/product_details.dart';
import 'package:ridan_sample/widgets/categories_list.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
     String src = "assets/images/denim.jpg";
    return Container(
        // height: screenHeight,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            //Carousel
            Expanded(
              flex: 1,
              child: Container(
                height: 350,
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
                            style: TextStyle(
                                color: Colors.blue[400], fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 150,
                      child: ListView(
                        padding: EdgeInsets.all(8),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          ///List Card
                          newCardMethod(src),
                          newCardMethod(src),
                          newCardMethod(src),
                          newCardMethod(src),
                        ],
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
                    children: const [Text('Categories'), Text('show all')],
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

  Card newCardMethod(String src) {
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
                child: Image.asset(
                  src,
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
                      builder: (context) => ProductDetailPage(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(4),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Russ Shirt',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            r'$19.99',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              // color: Colors.grey
                            ),
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