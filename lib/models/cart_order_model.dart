
import 'package:ecommerce/models/product_item_model.dart';

class CartOrdersModel {
  final String id;
  final ProductItemModel product;
  final double totalPrice;
  final int quantity;
  final ProductSize size;

  CartOrdersModel({
    required this.id,
    required this.product,
    required this.totalPrice,
    required this.quantity,
    required this.size,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product': product.toMap(),
      'totalPrice': totalPrice,
      'quantity': quantity,
      'size': size.toMap(size),
    };
  }

  factory CartOrdersModel.fromMap(Map<String, dynamic> map) {
    return CartOrdersModel(
      id: map['id'] as String,
      product: ProductItemModel.fromMap(map['product'] as Map<String, dynamic>),
      totalPrice: map['totalPrice'] as double,
      quantity: map['quantity'] as int,
      size: ProductSize.fromMap(map['size'] as String),
    );
  }

  CartOrdersModel copyWith({
    String? id,
    ProductItemModel? product,
    double? totalPrice,
    int? quantity,
    ProductSize? size,
  }) {
    return CartOrdersModel(
      id: id ?? this.id,
      product: product ?? this.product,
      totalPrice: totalPrice ?? this.totalPrice,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
    );
  }
}

List<CartOrdersModel> dummyCartOrders = [
  CartOrdersModel(
    id: "1",
    product: dummyProducts[0],
    totalPrice: 10,
    quantity: 1,
    size: ProductSize.S,
  )
];
List<CartOrdersModel> dummyCartOrdersCompleted = [
  CartOrdersModel(
    id: "1",
    product: dummyProducts[0],
    totalPrice: 10,
    quantity: 1,
    size: ProductSize.S,
  )
];
