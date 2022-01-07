import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class Products {
  late int id;
  late String title;
  late String image;
  late double price;

  Products(
      {required this.id,
      required this.image,
      required this.price,
      required this.title});

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}

// class Products {
//   int id;
//   String title;
//   String price;
//   String image;

//   Products({required this.id, required this.title, required this.price, required this.image});

//    Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     price = json['price'];
//     image = json['image'];
//   }

//   // }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['price'] = this.price;
//     data['image'] = this.image;

//     return data;
//   }
// }
