import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:ecommerce/models/cart_order_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/utils/routes/app_routes.dart';
import 'package:ecommerce/view_models/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/views/widgets/cart_order.dart';
import 'package:ecommerce/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Order",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  BlocBuilder<CartCubit, CartState>(
                    bloc: cartCubit,
                    buildWhen: (previous, current) =>
                        current is GetFromCartError ||
                        current is GetFromCartLoaded ||
                        current is GetFromCartLoading,
                    builder: (context, state) {
                      if (state is GetFromCartError) {
                        return Center(
                          child: Text(state.error),
                        );
                      }
                      if (state is GetFromCartLoading) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      if (state is GetFromCartLoaded) {
                        final orders = state.cartOrders;
                        return RefreshIndicator(
                          onRefresh: () => cartCubit.getOrdersFromCart(),
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: orders.length,
                                itemBuilder: (context, index) {
                                  return CartOrder(order: orders[index]);
                                },
                              ),
                              SizedBox(height: 32),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Subtotal",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: AppColors.grey,
                                        ),
                                  ),
                                  Text(
                                    "\$${state.subTotal}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.grey,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Shipping",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: AppColors.grey,
                                        ),
                                  ),
                                  Text(
                                    "\$${state.shipping}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.grey,
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              DottedDashedLine(
                                axis: Axis.horizontal,
                                height: 1,
                                width: size.width,
                                dashColor: AppColors.grey,
                              ),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Totalamount",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: AppColors.grey,
                                        ),
                                  ),
                                  Text(
                                    "\$${state.subTotal + 10}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.grey,
                                        ),
                                  ),
                                ],
                              ),
                              MainButton(
                                title: "Checkout",
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pushNamed(AppRoutes.checkoutPage);
                                },
                              ),
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
