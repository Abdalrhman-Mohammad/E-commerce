import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final ProductItemModel product;
  const ProductItem({super.key, required this.product});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 130,
              width: 200,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.grey2,
                borderRadius: BorderRadius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl: widget.product.imgUrl,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              right: 3,
              top: 3,
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (dummyFavorites.contains(widget.product)) {
                      dummyFavorites.remove(widget.product);
                    } else {
                      dummyFavorites.add(widget.product);
                    }
                  });
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.grey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Icon(
                      dummyFavorites.contains(widget.product)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: dummyFavorites.contains(widget.product)
                          ? AppColors.red
                          : AppColors.white,
                      size: 17,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Text(
          widget.product.name,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          widget.product.category,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.grey,
              ),
        ),
        Text(
          "\$" + widget.product.price.toString(),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
