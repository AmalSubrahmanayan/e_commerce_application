class AddToCartModel {
  final String size;
  final String productId;
  final int quantity;

  AddToCartModel({
    required this.productId,
    required this.quantity,
    required this.size,
  });

  Map<String, dynamic> toJson() {
    return {
      'product': productId,
      'qty': quantity,
      'size': size,
    };
  }
}
