import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/models/cart_order_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CompletedCardOrderItem extends StatelessWidget {
  final CartOrdersModel order;
  const CompletedCardOrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.grey2,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 85,
                width: 85,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.grey2,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CachedNetworkImage(
                  imageUrl: order.product.imgUrl,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.product.name,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 2),
                    RichText(
                      text: TextSpan(
                        text: 'Size: ',
                        style: DefaultTextStyle.of(context).style.copyWith(
                              fontSize: 14,
                              color: AppColors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                        children: [
                          TextSpan(
                            text: order.size.name,
                            style: const TextStyle(
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6),
                    RichText(
                      text: TextSpan(
                        text: 'Qty: ',
                        style: DefaultTextStyle.of(context).style.copyWith(
                              fontSize: 14,
                              color: AppColors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                        children: [
                          TextSpan(
                            text: order.quantity.toString(),
                            style: TextStyle(
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 32,
                      width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.green,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Completed",
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.green,
                                  ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: order.totalPrice.toString(),
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(-55, -10),
                            child: Text(
                              '\$',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: AppColors.grey2,
                    ),
                  ),
                  child: GestureDetector(
                    child: Center(
                      child: Text(
                        "Detail",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.grey2,
                    ),
                    color: AppColors.primary,
                  ),
                  child: GestureDetector(
                    child: Center(
                      child: Text(
                        "Recived Order",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
