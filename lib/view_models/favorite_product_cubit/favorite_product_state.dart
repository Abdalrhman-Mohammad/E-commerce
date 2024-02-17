part of 'favorite_product_cubit.dart';

sealed class FavoriteProductState {}

final class FavoriteProductInitial extends FavoriteProductState {}

final class FavoriteProductLoading extends FavoriteProductState {}

final class FavoriteProductLoaded extends FavoriteProductState {
  final List<ProductItemModel> favoriteProducts;

  FavoriteProductLoaded({required this.favoriteProducts});
}

final class FavoriteProductError extends FavoriteProductState {
  final String error;

  FavoriteProductError({required this.error});
}

// final class ChangeFavoriteProductState extends FavoriteProductState {
//   final List<ProductItemModel> favoriteProducts;

//   ChangeFavoriteProductState({required this.favoriteProducts});
// }
