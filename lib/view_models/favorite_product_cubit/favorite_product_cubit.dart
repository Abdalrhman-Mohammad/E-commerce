import 'package:ecommerce/services/auth_services.dart';
import 'package:ecommerce/services/favorite_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/models/product_item_model.dart';

part 'favorite_product_state.dart';

class FavoriteProductCubit extends Cubit<FavoriteProductState> {
  FavoriteProductCubit() : super(FavoriteProductInitial());
  final favorireServicesImpl = FavorireServicesImpl();
  // final authServicesImpl=AuthServicesImpl();
  final firebaseAuth = FirebaseAuth.instance;

  void getFavoriteProducts() async {
    try {
      emit(FavoriteProductLoading());

      final List<ProductItemModel> products =
          await favorireServicesImpl.getProducts(firebaseAuth.currentUser!.uid);
      emit(FavoriteProductLoaded(favoriteProducts: products));
    } catch (e) {
      emit(FavoriteProductError(error: e.toString()));
    }
  }

  void addFavoriteProduct(ProductItemModel favProduct) async {
    favorireServicesImpl.addFavProducts(
        firebaseAuth.currentUser!.uid, favProduct);
    // dummyFavorites.add(product);
    // emit(FavoriteProductLoaded(favoriteProducts: dummyFavorites));
    getFavoriteProducts();
  }

  void removeFavoriteProduct(String productId) async {
    favorireServicesImpl.removeFavProduct(
        firebaseAuth.currentUser!.uid, productId);
    getFavoriteProducts();
  }
}
