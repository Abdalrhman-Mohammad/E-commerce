import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/view_models/favorite_product_cubit/favorite_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  final ProductItemModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FavoriteProductCubit>(context);
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 130,
              width: 200,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.grey2,
                borderRadius: BorderRadius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl: product.imgUrl,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ), ///////////////////////////////////////////////////////// what is that
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              right: 3,
              top: 3,
              child: BlocBuilder<FavoriteProductCubit, FavoriteProductState>(
                bloc: cubit,
                buildWhen: (previous, current) =>
                    // current is ChangeFavoriteProductState ||
                    current is FavoriteProductError ||
                    current is FavoriteProductLoaded ||
                    current is FavoriteProductLoading,
                builder: (context, state) {
                  if (state is FavoriteProductError) {
                    return const Center(child: Text("Error"));
                  } else if (state is FavoriteProductLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (state is FavoriteProductLoaded) {
                    final List<ProductItemModel> favoriteProducts =
                        state.favoriteProducts;

                    bool found = favoriteProducts
                        .any((element) => element.id == product.id);
                    print(found);
                    return InkWell(
                      onTap: () {
                        if (found) {
                          cubit.removeFavoriteProduct(product.id);
                        } else {
                          cubit.addFavoriteProduct(product);
                        }
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.grey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Icon(
                            found ? Icons.favorite : Icons.favorite_border,
                            color: found ? AppColors.red : AppColors.white,
                            size: 17,
                          ),
                        ),
                      ),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      if (dummyFavorites.contains(product)) {
                        cubit.removeFavoriteProduct(product.id);
                      } else {
                        cubit.addFavoriteProduct(product);
                      }
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.grey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Icon(
                          dummyProducts.contains(product)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: dummyProducts.contains(product)
                              ? AppColors.red
                              : AppColors.white,
                          size: 17,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Text(
          product.name,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          product.category,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.grey,
              ),
        ),
        Text(
          "\$" + product.price.toString(),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
