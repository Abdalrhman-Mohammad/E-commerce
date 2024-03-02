import 'package:ecommerce/models/cart_order_model.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/services/firestore_services.dart';
import 'package:ecommerce/utils/api_routes.dart';

abstract class CartServices {
  Future<List<CartOrdersModel>> getCartProducts(String uid);
  Future<void> setCartProducts(String uid, CartOrdersModel cartProduct);
  Future<void> removeCartProducts(String uid, String cartProductID);
  Future<void> incrementCounter(String uid, CartOrdersModel cartProduct);
  Future<void> decrementCounter(String uid, CartOrdersModel cartProduct);
}

class CartServicesImpl implements CartServices {
  final firestoreService = FirestoreService.instance;
  @override
  Future<void> setCartProducts(String uid, CartOrdersModel cartProduct) async {
    return await firestoreService.setData(
      path: ApiRoutes.cartProduct(uid, cartProduct.id),
      data: cartProduct.toMap(),
    );
  }

  @override
  Future<void> removeCartProducts(String uid, String cartProductID) async {
    return await firestoreService.deleteData(
      path: ApiRoutes.cartProduct(uid, cartProductID),
    );
  }

  @override
  Future<List<CartOrdersModel>> getCartProducts(String uid) async {
    return await firestoreService.getCollection<CartOrdersModel>(
      path: ApiRoutes.cartProducts(uid),
      builder: (data, documentID) {
        return CartOrdersModel.fromMap(data);
      },
    );
  }

  @override
  Future<void> decrementCounter(String uid, CartOrdersModel cartProduct) async {
    cartProduct = cartProduct.copyWith(quantity: cartProduct.quantity - 1);
    return await firestoreService.setData(
      path: ApiRoutes.cartProduct(uid, cartProduct.id),
      data: cartProduct.toMap(),
    );
  }

  @override
  Future<void> incrementCounter(String uid, CartOrdersModel cartProduct) async {
    cartProduct = cartProduct.copyWith(quantity: cartProduct.quantity + 1);
    return await firestoreService.setData(
      path: ApiRoutes.cartProduct(uid, cartProduct.id),
      data: cartProduct.toMap(),
    );
  }
}
