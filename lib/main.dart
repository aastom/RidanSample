import 'package:flutter/material.dart';
import 'package:ridan_sample/pages/product_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    String src = "assets/images/denim.jpg";
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      // ignore: avoid_unnecessary_containers
      body: Container(
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
                Container(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(8),
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: const [
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.pregnant_woman_outlined),
                          title: Text('Woman (736)'),
                          trailing: Icon(Icons.chevron_right),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.person_outline),
                          title: Text('Man (536)'),
                          trailing: Icon(Icons.chevron_right),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.pregnant_woman_outlined),
                          title: Text('Children (736)'),
                          trailing: Icon(Icons.chevron_right),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.pregnant_woman_outlined),
                          title: Text('Woman (736)'),
                          trailing: Icon(Icons.chevron_right),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.pregnant_woman_outlined),
                          title: Text('Woman (736)'),
                          trailing: Icon(Icons.chevron_right),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.pregnant_woman_outlined),
                          title: Text('Woman (736)'),
                          trailing: Icon(Icons.chevron_right),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
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
