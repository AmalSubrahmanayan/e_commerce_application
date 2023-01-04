class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  String id;
  String name;
  String image;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
      );

  // Map<String, dynamic> toJson() => {
  //     "_id": id.toJson(),
  //     "name": name,
  //     "image": image,

  // };
}
