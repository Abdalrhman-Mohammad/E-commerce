import 'package:ecommerce/models/cart_order_model.dart';
import 'package:ecommerce/view_models/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/views/widgets/cart_order.dart';
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
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: BlocBuilder<CartCubit, CartState>(
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
                            child: ListView.builder(
                              itemCount: orders.length,
                              itemBuilder: (context, index) {
                                return CartOrder(order: orders[index]);
                              },
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
