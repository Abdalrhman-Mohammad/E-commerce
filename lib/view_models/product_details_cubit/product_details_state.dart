part of 'product_details_cubit.dart';

sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsLoaded extends ProductDetailsState {
  final ProductItemModel product;
  ProductDetailsLoaded({
    required this.product,
  });
}

final class ProductDetailsError extends ProductDetailsState {
  final String error;

  ProductDetailsError({required this.error});
}

final class SizeChanged extends ProductDetailsState {
  final ProductSize value;

  SizeChanged({required this.value});
}

final class QuantityChanged extends ProductDetailsState {
  final int quantity;

  QuantityChanged({required this.quantity});
}

final class AddingToCart extends ProductDetailsState {}

final class AddedToCart extends ProductDetailsState {}

final class ErrorAddingToCart extends ProductDetailsState {
  final String error;

  ErrorAddingToCart({required this.error});
}

// final class GetFromCartLoading extends ProductDetailsState {}

// final class GetFromCartLoaded extends ProductDetailsState {
//   final List<CartOrdersModel> cartOrders;

//   GetFromCartLoaded({required this.cartOrders});
// }

// final class GetFromCartError extends ProductDetailsState {
//   final String error;

//   GetFromCartError({required this.error});
// }
 //moved to cart