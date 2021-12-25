// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ridan_sample/pages/cart.dart';
import 'package:ridan_sample/utils/utils.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int? _value = 1;
  double sliderValue = 0.0;

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
              child: Container(
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
                        Text(
                          'Eywa Hoodie',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            r'$30.99',
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
                    radioColourMethod(),
                    Row(
                      children: [Text('Size')],
                    ),

                    //Sizes

                 
                    const SizedBox(height: 16),
                    buildSliderTopLabel(),
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
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartPage()));
                            },
                            child: Text('Add To Cart')),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  Row radioColourMethod() {
    return Row(
                    children: [
                      Radio(
                        toggleable: true,
                        // title: const Text('Lafayette'),
                        activeColor: Colors.white,
                        value: 1,
                        groupValue: 1,
                        onChanged: (value) {
                          setState(() {
                            _value = value as int?;
                          });
                        },
                      ),
                      Radio(
                        // title: const Text('Lafayette'),
                        activeColor: Colors.grey,
                        value: 2,
                        groupValue: 2,
                        onChanged: (value) {
                          setState(() {
                            _value = value as int?;
                          });
                        },
                      ),
                      Radio(
                        // title: const Text('Lafayette'),
                        activeColor: Colors.black,
                        value: 3,
                        groupValue: 3,
                        onChanged: (value) {
                          setState(() {
                            _value = value as int?;
                          });
                        },
                      ),
                      Radio(
                        // title: const Text('Lafayette'),
                        activeColor: Colors.blue,
                        value: 3,
                        groupValue: 3,
                        onChanged: (value) {
                          setState(() {
                            _value = value as int?;
                          });
                        },
                      ),
                    ],
                  );
  }


  ///Slider Helper Methods

  Widget buildSliderSideLabel() {
    final double min = 20;
    final double max = 80;
    final divisions = 4;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          buildSideLabel(min),
          Expanded(
            child: Slider(
              value: valueBottom,
              min: min,
              max: max,
              divisions: divisions,
              label: valueBottom.round().toString(),
              onChanged: (value) => setState(() => this.valueBottom = value),
            ),
          ),
          buildSideLabel(max),
        ],
      ),
    );
  }




  Widget buildSliderTopLabel() {
    final labels = ['S', 'M', 'L', 'XL', 'XXL'];
    final double min = 0;
    final double max = labels.length - 1.0;
    final divisions = labels.length - 1;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: Utils.modelBuilder(
              labels,
              (index, label) {
                final selectedColor = Colors.blue;
                final unselectedColor = Colors.blue.withOpacity(0.3);
                final isSelected = index <= indexTop;
                final color = isSelected ? selectedColor : unselectedColor;

                return buildLabel(
                    label: label.toString(), color: color, width: 30);
              },
            ),
          ),
        ),
        Slider(
          value: indexTop.toDouble(),
          min: min,
          max: max,
          divisions: divisions,
          // label: labels[indexTop],
          onChanged: (value) => setState(() => this.indexTop = value.toInt()),
        ),
      ],
    );
  }

  Widget buildLabel({
    required String label,
    required double width,
    required Color color,
  }) =>
      Container(
        width: width,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ).copyWith(color: color),
        ),
      );

  Widget buildSideLabel(double value) => Container(
        width: 25,
        child: Text(
          value.round().toString(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
}
