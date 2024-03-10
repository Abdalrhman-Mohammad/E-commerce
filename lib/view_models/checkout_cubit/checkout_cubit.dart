import 'package:ecommerce/services/firestore_services.dart';
import 'package:ecommerce/utils/api_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/models/address.dart';
import 'package:ecommerce/models/cart_order_model.dart';
import 'package:ecommerce/models/method_payment.dart';
import 'package:ecommerce/services/auth_services.dart';
import 'package:ecommerce/services/checkout_services.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
  CheckoutServicesImpl checkoutServices = CheckoutServicesImpl();
  AuthServicesImpl authServices = AuthServicesImpl();
  FirestoreService firestoreService = FirestoreService.instance;
  void getPageData() async {
    try {
      emit(CheckoutPageLoading());
      final products = await checkoutServices
          .getCartProducts((await authServices.currentUser())!.uid);
      final addresses = await checkoutServices
          .getAddresses((await authServices.currentUser())!.uid);
      final prferedAddress = addresses.firstWhere((element) => element.isFav);
      final paymentMethods = await checkoutServices
          .getPaymentMethods((await authServices.currentUser())!.uid);
      final preferedPaymentMethod =
          paymentMethods.firstWhere((element) => element.isFav);
      final subTotal = products.fold<double>(
          0, (sum, curr) => sum + curr.quantity * curr.product.price);
      const shipping = 6.0;
      emit(CheckoutPageLoaded(
        orders: products,
        address: prferedAddress,
        prefferedPayment: preferedPaymentMethod,
        subTotal: subTotal,
        shipping: shipping,
        addresses: addresses,
        paymentMethods: paymentMethods,
      ));
    } catch (e) {
      print(e.toString());
      emit(CheckoutPageError(e.toString()));
    }
  }

  Future<void> setAddress(String addressName) async {
    final addresses = await checkoutServices
        .getAddresses((await authServices.currentUser())!.uid);
    addresses.forEach((e) async {
      if (e.title == addressName) {
        e = e.copyWith(isFav: true);
        await firestoreService.setData(
            path: ApiRoutes.address(
                (await authServices.currentUser())!.uid, e.id),
            data: e.toMap());
      } else {
        e = e.copyWith(isFav: false);
        await firestoreService.setData(
            path: ApiRoutes.address(
                (await authServices.currentUser())!.uid, e.id),
            data: e.toMap());
      }
    });
  }

  Future<void> setPaymentMethod(String? paymentMethodName) async {
    if (paymentMethodName == null) return;
    final paymentMethods = await checkoutServices
        .getPaymentMethods((await authServices.currentUser())!.uid);
    paymentMethods.forEach((e) async {
      if (e.name == paymentMethodName) {
        e = e.copyWith(isFav: true);
        await firestoreService.setData(
            path: ApiRoutes.paymentMethod(
                (await authServices.currentUser())!.uid, e.id),
            data: e.toMap());
      } else {
        e = e.copyWith(isFav: false);
        await firestoreService.setData(
            path: ApiRoutes.paymentMethod(
                (await authServices.currentUser())!.uid, e.id),
            data: e.toMap());
      }
    });
  }
}
