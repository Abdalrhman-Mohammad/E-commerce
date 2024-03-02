part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class GetFromCartLoading extends CartState {}

final class GetFromCartLoaded extends CartState {
  final List<CartOrdersModel> cartOrders;

  GetFromCartLoaded({required this.cartOrders});
}

final class GetFromCartError extends CartState {
  final String error;

  GetFromCartError({required this.error});
}
  