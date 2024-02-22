import 'package:ecommerce/models/announcement_item.dart';
import 'package:ecommerce/models/category_item_model.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/services/firestore_services.dart';
import 'package:ecommerce/utils/api_routes.dart';

abstract class HomeServices {
  Future<List<ProductItemModel>> getProducts();
  Future<List<AnnouncementModel>> getAnnouncements();
  Future<List<CategoryModel>> getCategories();
  Future<List<LinkedAccount>> getLinkedAccounts();
  Future<UserModel> getUserData();
}

class HomeServicesImpl {
  final firestoreService = FirestoreService.instance;
  Future<List<ProductItemModel>> getProducts() async {
    return await firestoreService.getCollection<ProductItemModel>(
      path: ApiRoutes.products(),
      builder: (data, documentID) {
        return ProductItemModel.fromMap(data);
      },
    );
  }

  Future<List<AnnouncementModel>> getAnnouncements() async {
    return await firestoreService.getCollection<AnnouncementModel>(
      path: ApiRoutes.announcements(),
      builder: (data, documentID) {
        return AnnouncementModel.fromMap(data);
      },
    );
  }

  Future<List<CategoryModel>> getCategories() async {
    return await firestoreService.getCollection<CategoryModel>(
      path: ApiRoutes.categories(),
      builder: (data, documentID) {
        return CategoryModel.fromMap(data);
      },
    );
  }
    Future<List<LinkedAccount>> getLinkedAccounts(String UserID) async {
    return await firestoreService.getCollection<LinkedAccount>(
      path: ApiRoutes.categories(),
      builder: (data, documentID) {
        return LinkedAccount.fromMap(data);
      },
    );
  }
   Future<UserModel> getUserData(String userID) async {
    return await firestoreService.getDocument<UserModel>(
      path: ApiRoutes.user(userID),
      builder: (data, documentID) {
        return UserModel.fromMap(data);
      },
    );
  }
}
//getUserData