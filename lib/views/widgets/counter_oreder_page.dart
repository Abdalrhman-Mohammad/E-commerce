import 'package:ecommerce/models/cart_order_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/view_models/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterOrderPage extends StatelessWidget {
  final int? counter;
  final CartOrdersModel order;
  final bool isLoading;
  const CounterOrderPage({
    super.key,
    this.counter,
    required this.order,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);

    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.grey3,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if (counter == 1) return;
              cartCubit.decrementCounter(order);
            },
            icon: const Icon(Icons.remove),
          ),
          isLoading == false ? Text(counter.toString()) :const Center(child: CircularProgressIndicator()),
          IconButton(
            onPressed: () async {
              cartCubit.incrementCounter(order);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
