import 'package:ecommerce/services/auth_services.dart';
import 'package:ecommerce/services/cart_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/models/cart_order_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final AuthServices authServices = AuthServicesImpl();
  final cartServices = CartServicesImpl();
  Future<void> getOrdersFromCart() async {
    try {
      emit(GetFromCartLoading());
      final orders = await cartServices
          .getCartProducts((await authServices.currentUser())!.uid);
      final subTotal = orders.fold<double>(
          0, (sum, curr) => sum + curr.quantity * curr.product.price);
      final shipping = 6.0;
      emit(GetFromCartLoaded(
          cartOrders: orders, subTotal: subTotal, shipping: shipping));
    } catch (e) {
      emit(GetFromCartError(error: e.toString()));
    }
  }

  void removeOrderFromCart(String cartProductID) async {
    try {
      emit(GetFromCartLoading());
      await cartServices.removeCartProducts(
          (await authServices.currentUser())!.uid, cartProductID);

      getOrdersFromCart();
    } catch (e) {
      emit(GetFromCartError(error: e.toString()));
    }
  }

  void incrementCounter(CartOrdersModel cartOrder) async {
    try {
      // emit(GetFromCartLoading());
      await cartServices.incrementCounter(
          (await authServices.currentUser())!.uid, cartOrder);

      getOrdersFromCart();
    } catch (e) {
      emit(GetFromCartError(error: e.toString()));
    }
  }

  void decrementCounter(CartOrdersModel cartOrder) async {
    try {
      // emit(GetFromCartLoading());
      await cartServices.decrementCounter(
          (await authServices.currentUser())!.uid, cartOrder);

      getOrdersFromCart();
    } catch (e) {
      emit(GetFromCartError(error: e.toString()));
    }
  }
  //not completed
}
