class ProductModel {
  final int id;
  final String title;
  var price;
  final String category;
  final String description;
  final String image;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.category,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
      category: json["category"],
      id: json["id"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      image: json["image"],
      rating: RatingModel.fromJson(json["rating"]),
    );
  }
}

class RatingModel {
  var rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(json) {
    return RatingModel(rate: json["rate"], count: json["count"]);
  }
}
