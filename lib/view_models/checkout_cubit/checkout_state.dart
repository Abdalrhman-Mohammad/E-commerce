part of 'checkout_cubit.dart';

sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutPageLoading extends CheckoutState {}

final class CheckoutPageLoaded extends CheckoutState {
  final List<CartOrdersModel> orders;
  final List<AddressModel> addresses;
  final List<PaymentMethod> paymentMethods;
  final AddressModel address;
  final PaymentMethod prefferedPayment;
  final double subTotal;
  final double shipping;
  CheckoutPageLoaded({
    required this.subTotal,
    required this.address,
    required this.prefferedPayment,
    required this.orders,
    required this.shipping,
    required this.paymentMethods,
    required this.addresses,
  });
}

final class CheckoutPageError extends CheckoutState {
  final String error;

  CheckoutPageError(this.error);
}
