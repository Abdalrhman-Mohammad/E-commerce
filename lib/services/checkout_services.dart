import 'package:ecommerce/models/address.dart';
import 'package:ecommerce/models/cart_order_model.dart';
import 'package:ecommerce/models/method_payment.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/services/firestore_services.dart';
import 'package:ecommerce/utils/api_routes.dart';

abstract class CheckoutServices {
  Future<List<CartOrdersModel>> getCartProducts(String uid);
  Future<List<PaymentMethod>> getPaymentMethods(String uid);
  Future<List<AddressModel>> getAddresses(String uid);
}

class CheckoutServicesImpl implements CheckoutServices {
  final firestoreService = FirestoreService.instance;

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
  Future<List<PaymentMethod>> getPaymentMethods(String uid) async {
    return await firestoreService.getCollection<PaymentMethod>(
      path: ApiRoutes.paymentMetdods(uid),
      builder: (data, documentID) {
        return PaymentMethod.fromMap(data);
      },
    );
  }

  @override
  Future<List<AddressModel>> getAddresses(String uid) async {
    return await firestoreService.getCollection<AddressModel>(
      path: ApiRoutes.addresses(uid),
      builder: (data, documentID) {
        print(data.toString() + "-------------------");
        return AddressModel.fromMap(data);
      },
    );
  }
}
