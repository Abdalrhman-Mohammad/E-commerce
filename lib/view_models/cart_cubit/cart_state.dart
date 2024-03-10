part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class GetFromCartLoading extends CartState {}

final class GetFromCartLoaded extends CartState {
  final List<CartOrdersModel> cartOrders;
  final double subTotal;
  final double shipping;
  GetFromCartLoaded({
    required this.cartOrders,
    required this.subTotal,
    required this.shipping,
  });
}

final class GetFromCartError extends CartState {
  final String error;

  GetFromCartError({required this.error});
}
