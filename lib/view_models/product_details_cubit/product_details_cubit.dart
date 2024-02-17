import 'package:ecommerce/models/cart_order_model.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
  ProductSize? size;
  int quantity = 1;
  void getProductDetails(String elementId) async {
    try {
      emit(ProductDetailsLoading());
      final ProductItemModel product =
          dummyProducts.firstWhere((element) => element.id == elementId);
      await Future.delayed(const Duration(seconds: 1));
      emit(ProductDetailsLoaded(product: product));
    } catch (e) {
      emit(ProductDetailsError(error: e.toString()));
    }
  }

  void sizeChanged(ProductSize value) {
    size = value;
    emit(SizeChanged(value: value));
  }

  void incrementCounter() async {
    quantity++;
    await Future.delayed(const Duration(milliseconds: 500));
    emit(QuantityChanged(quantity: quantity));
  }

  void decrementCounter() async {
    if (quantity > 1) quantity--;
    await Future.delayed(const Duration(milliseconds: 500));
    emit(QuantityChanged(quantity: quantity));
  }

  void addToCart(String productId) async {
    try {
      emit(AddingToCart());
      final product =
          dummyProducts.firstWhere((element) => element.id == productId);
      await Future.delayed(const Duration(seconds: 1));
      final order = CartOrdersModel(
        id: DateTime.now().toIso8601String(),
        product: product,
        totalPrice: quantity * product.price,
        quantity: quantity,
        size: size!,
      );
      dummyCartOrders.add(order);
      emit(AddedToCart());
    } catch (e) {
      emit(ErrorAddingToCart(error: e.toString()));
    }
  }

  void getFromCart() async {
    try {
      emit(GetFromCartLoading());
      await Future.delayed(const Duration(seconds: 1));
      emit(GetFromCartLoaded(cartOrders: dummyCartOrders));
    } catch (e) {
      emit(GetFromCartError(error: e.toString()));
    }
  }
}
