import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ridan_sample/pages/cart.dart';
import 'package:ridan_sample/pages/home.dart';
import 'package:ridan_sample/pages/product_details.dart';
import 'package:ridan_sample/provider/cart_provider.dart';
import 'package:ridan_sample/widgets/categories_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CartManager(),
            child: CartPage(),
          ),
          ChangeNotifierProvider(
            create: (context) => CartManager(),
            child: ProductDetailPage(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

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
        body: Home());
  }
}
