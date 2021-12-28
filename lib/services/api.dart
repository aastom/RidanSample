//get all Products
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ridan_sample/models/products.dart';

Future <List<Products>> getAllProducts() async {
  String url = "https://fakestoreapi.com/products";

  // List data = [];
  //Products products = Products();

  List<Products> myData = [];

  List<Products> prodData = <Products>[];

  try {
    var response = await Dio().get(url,
        options: new Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }));

    if (response.statusCode == 200) {
    

      // debugPrint(response.data.toString());

      prodData =
          (response.data as List).map((v) => Products.fromJson(v)).toList();
      myData = prodData;

      print(response.statusCode.toString());


    
    
    }
  } on DioError catch (e) {
    print(e.response);
    print('Error Retriving data');
  }

  

  return myData;
}

// get all Categories


// Future<List<Products>?> allProducts()async{

//   List data = [];

//   String url = "https://fakestoreapi.com/products";
//   List<Products> prodData = <Products>[];
//   try {
//     var response = await Dio().get(url,
//         options: new Options(headers: {
//           HttpHeaders.contentTypeHeader: 'application/json',
//         }));

       

//     if (response.statusCode == 200) {
     
//       prodData = (response.data as List).map((v) => Products.fromJson(v)).toList();
//       data = response.data;
    

    
//       //print(productList.title);
//     }
//   } on DioError catch (e) {
//     print(e.response);
//     print('Error Retriving data');
//   }

//   return  data;

// }