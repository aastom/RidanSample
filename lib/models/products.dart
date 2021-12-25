class Products {
  final int id;
  final String title;
  final String price;
  final String image;

  Products(this.id, this.title, this.price, this.image);

  Products.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        price = json['price'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'image': image,
      };
}
