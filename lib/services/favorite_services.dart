import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/services/firestore_services.dart';
import 'package:ecommerce/utils/api_routes.dart';

abstract class FavoriteServices {
  Future<List<ProductItemModel>> getFavProducts();
  Future<void> addFavProduct();
  Future<void> removeFavProduct();
}

class FavorireServicesImpl {
  final firestoreService = FirestoreService.instance;
  Future<List<ProductItemModel>> getProducts(String uid) async {
    return await firestoreService.getCollection<ProductItemModel>(
      path: ApiRoutes.favProducts(uid),
      builder: (data, documentID) {
        return ProductItemModel.fromMap(data);
      },
    );
  }

  Future<void> addFavProducts(String uid, ProductItemModel favProduct) async {
    return await firestoreService.setData(
      path: ApiRoutes.favProduct(uid, favProduct.id),
      data: favProduct.toMap(),
    );
  }

  Future<void> removeFavProduct(String uid, String productId) async {
    return await firestoreService.deleteData(
      path: ApiRoutes.favProduct(uid, productId),
    );
  }
}
