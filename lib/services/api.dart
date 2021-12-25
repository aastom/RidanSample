//get all Products
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ridan_sample/models/products.dart';

Future getAllProducts() async {
  String url = "https://fakestoreapi.com/products";

  List data =[];

  try {
    var response = await Dio().get(url,
        options: new Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }));

    if (response.statusCode == 200) {
      print(response.data);
      // data = (response.data as List).map((v) => Products.fromJson(v)).toList();
      // data = response.data;
      // print(data);
      // Map<String, dynamic> userMap = jsonDecode(response.data);
      // var productList = Products.fromJson(userMap);

      data = response.data;

      // print(productList);
    }
  } on DioError catch (e) {
    print(e.response);
    print('Error Retriving data');
  }

  //print(data);

  return data;
}

// get all Categories