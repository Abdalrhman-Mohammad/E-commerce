import 'package:ecommerce/models/cart_order_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/view_models/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterOrderPage extends StatelessWidget {
  final int counter;
  final CartOrdersModel order;
  const CounterOrderPage({
    super.key,
    required this.counter,
    required this.order,
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
          Text(counter.toString()),
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
