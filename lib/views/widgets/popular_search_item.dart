import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PopularSearchItem extends StatelessWidget {
  final ProductItemModel product;
  final Container? additional;
  const PopularSearchItem(
      {super.key, required this.product, required this.additional});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        height: 80,
        child: Row(
          children: [
            Image.network(
              product.imgUrl,
              fit: BoxFit.fill,
              width: 90,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "1.6k Search today",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.grey),
                )
              ],
            ),
            Spacer(),
            if (additional != null) additional!,
          ],
        ),
      ),
    );
  }
}
