class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.price,
    this.offer,
    this.size,
    this.image,
    this.category,
    this.rating,
  });

  String? id;
  String? name;
  int? price;
  double? offer;
  List<String>? size;
  List<String>? image;
  String? category;
  String? rating;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        offer: json["offer"].toDouble(),
        size: List<String>.from(json["size"].map((x) => x)),
        image: List<String>.from(json["image"].map((x) => x)),
        category: json["category"],
        rating: json["rating"],
      );
}
