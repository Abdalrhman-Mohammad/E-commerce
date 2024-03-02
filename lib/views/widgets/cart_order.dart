import 'package:ecommerce/models/cart_order_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/view_models/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/views/widgets/counter_oreder_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartOrder extends StatelessWidget {
  final CartOrdersModel order;
  const CartOrder({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: size.height / 7,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColors.grey2,
              ),
              child: Image.network(
                order.product.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: InkWell(
                onTap: () {
                  cartCubit.removeOrderFromCart(order.id);
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: AppColors.pink.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(100)),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.delete_outline,
                      color: AppColors.red,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: CounterOrderPage(counter: order.quantity, order: order),
            ),
          ],
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.product.name,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  "Size: ${order.size}",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            Spacer(),
            Text(order.product.price.toString()),
          ],
        ),
      ],
    );
  }
}
