import 'package:ecommerce/models/cart_order_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckoutProduct extends StatelessWidget {
  final CartOrdersModel order;
  const CheckoutProduct({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          child: Image.network(
            order.product.imgUrl,
            height: 100,
            width: 100,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order.product.name,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text.rich(
              TextSpan(
                text: "Size: ",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                children: [
                  TextSpan(
                    text: order.size.name,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  )
                ],
              ),
            ),
          ],
        ),
        Spacer(),
        Text(
          "\$ ${order.quantity * order.product.price}",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w800,
              ),
        )
      ],
    );
  }
}
