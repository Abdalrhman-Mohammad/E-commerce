import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/models/product_item_model.dart';

part 'favorite_product_state.dart';

class FavoriteProductCubit extends Cubit<FavoriteProductState> {
  FavoriteProductCubit() : super(FavoriteProductInitial());

  void getFavoriteProducts() async {
    try {
      emit(FavoriteProductLoading());
      await Future.delayed(const Duration(seconds: 1));
      final List<ProductItemModel> products = dummyFavorites;
      emit(FavoriteProductLoaded(favoriteProducts: products));
    } catch (e) {
      emit(FavoriteProductError(error: e.toString()));
    }
  }

  void addFavoriteProduct(String productId) async {
    final product =
        dummyProducts.firstWhere((element) => element.id == productId);
    dummyFavorites.add(product);
    // getFavoriteProducts();
    emit(FavoriteProductLoaded(favoriteProducts: dummyFavorites));

    // emit(ChangeFavoriteProductState(favoriteProducts: dummyFavorites));
  }

  void removeFavoriteProduct(String productId) async {
    final product =
        dummyFavorites.firstWhere((element) => element.id == productId);
    dummyFavorites.remove(product);
    // getFavoriteProducts();
    emit(FavoriteProductLoaded(favoriteProducts: dummyFavorites));

    // emit(ChangeFavoriteProductState(favoriteProducts: dummyFavorites));
  }
}
