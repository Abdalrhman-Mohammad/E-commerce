import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/view_models/favorite_product_cubit/favorite_product_cubit.dart';
import 'package:ecommerce/view_models/product_details_cubit/product_details_cubit.dart';
import 'package:ecommerce/views/widgets/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productDetailsCubit = BlocProvider.of<ProductDetailsCubit>(context);
    final favoriteProductCubit = BlocProvider.of<FavoriteProductCubit>(context);
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      bloc: productDetailsCubit,
      buildWhen: (previous, current) =>
          current is ProductDetailsLoaded ||
          current is ProductDetailsError ||
          current is ProductDetailsLoading,
      builder: (context, state) {
        if (state is ProductDetailsError) {
          return Scaffold(
            body: Center(
              child: Text(state.error),
            ),
          );
        } else if (state is ProductDetailsLoading) {
          return const Scaffold(
              body: Center(
            child: CircularProgressIndicator.adaptive(),
          ));
        } else if (state is ProductDetailsLoaded) {
          final ProductItemModel product = state.product;

          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                product.name,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
            body: Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: size.height * 0.6,
                  // padding: EdgeInsets.only(top: size.height * 0.09),
                  decoration: BoxDecoration(
                    color: AppColors.grey2,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.imgUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.5,
                  ),
                  child: Container(
                    width: double.maxFinite,
                    height: size.height * 0.5,
                    padding:
                        const EdgeInsets.only(top: 30, right: 30, left: 30),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: AppColors.yellow,
                                      size: 20,
                                    ),
                                    Text(
                                      " 4.8",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            BlocBuilder<ProductDetailsCubit,
                                ProductDetailsState>(
                              bloc: productDetailsCubit,
                              buildWhen: (previous, current) =>
                                  current is QuantityChanged,
                              builder: (context, state) {
                                if (state is QuantityChanged) {
                                  final counter = state.quantity;
                                  return Counter(
                                      cubit: productDetailsCubit,
                                      counter: counter);
                                } else {
                                  return Counter(
                                      cubit: productDetailsCubit, counter: 1);
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Size",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 40,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: ProductSize.values
                                .map(
                                  (e) => BlocBuilder<ProductDetailsCubit,
                                      ProductDetailsState>(
                                    bloc: productDetailsCubit,
                                    buildWhen: (previous, current) =>
                                        current is SizeChanged,
                                    builder: (context, state) {
                                      if (state is SizeChanged) {
                                        final value = state.value;

                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          child: InkWell(
                                            onTap: () {
                                              productDetailsCubit
                                                  .sizeChanged(e);
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: value == e
                                                  ? AppColors.primary
                                                  : AppColors.grey2,
                                              child: Center(
                                                child: Text(
                                                  e.name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall!
                                                      .copyWith(
                                                        color: value == e
                                                            ? AppColors.white
                                                            : AppColors.black,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          child: InkWell(
                                            onTap: () {
                                              productDetailsCubit
                                                  .sizeChanged(e);
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: AppColors.grey2,
                                              child: Center(
                                                child: Text(
                                                  e.name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall!
                                                      .copyWith(
                                                        color: AppColors.black,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text("Details"),
                        const SizedBox(height: 8),
                        Text(
                          product.description,
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: AppColors.grey,
                                  ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "\$ ${product.price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            BlocConsumer<ProductDetailsCubit,
                                ProductDetailsState>(
                              bloc: productDetailsCubit,
                              listenWhen: (previous, current) =>
                                  current is ErrorAddingToCart,
                              listener: (context, state) {
                                // if (state is ErrorAddingToCart) {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(
                                //       content: Text(state.error),
                                //     ),
                                //   );
                                // }
                                if (state is ErrorAddingToCart) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Alert!"),
                                        content: Text(state.error),
                                        actions: [
                                          TextButton(
                                            child: const Text("OK"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              buildWhen: (previous, current) =>
                                  current is AddedToCart ||
                                  current is AddingToCart,
                              builder: (context, state) {
                                if (state is AddingToCart) {
                                  return SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.primary),
                                      ),
                                      onPressed: null,
                                      child: const Center(
                                        child: CircularProgressIndicator
                                            .adaptive(),
                                      ),
                                    ),
                                  );
                                } else if (state is AddedToCart) {
                                  return SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.primary),
                                      ),
                                      onPressed: null,
                                      child: Center(
                                        child: Text(
                                          "Added",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: AppColors.white,
                                              ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  // if (state is ErrorAddingToCart) {}
                                  return SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.primary),
                                      ),
                                      onPressed: () {
                                        productDetailsCubit
                                            .addToCart(product);
                                      },
                                      child: Center(
                                        child: Text(
                                          "Add to order",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: AppColors.white,
                                              ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 110,
                  child:
                      BlocBuilder<FavoriteProductCubit, FavoriteProductState>(
                    bloc: favoriteProductCubit,
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
                        return InkWell(
                          onTap: () {
                            if (found) {
                              favoriteProductCubit
                                  .removeFavoriteProduct(product.id);
                            } else {
                              favoriteProductCubit.addFavoriteProduct(product);
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
                      } else {
                        return const SizedBox(
                          child: Text("ELSE"),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Scaffold(
              body: Center(
            child: SizedBox(),
          ));
        }
      },
    );
  }
}
