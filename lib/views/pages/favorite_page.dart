import 'package:ecommerce/models/filter_item_model.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/utils/routes/app_routes.dart';
import 'package:ecommerce/view_models/favorite_product_cubit/favorite_product_cubit.dart';
import 'package:ecommerce/view_models/product_details_cubit/product_details_cubit.dart';
import 'package:ecommerce/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  String selectedFilter = dummyFilters[0].id;
  @override
  Widget build(BuildContext context) {
    final favoriteProductCubit = BlocProvider.of<FavoriteProductCubit>(context);
    // final productDetailsCubit = BlocProvider.of<ProductDetailsCubit>(context);
    final cubit = BlocProvider.of<FavoriteProductCubit>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Favorite",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: const [
          Icon(Icons.notifications_outlined),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                label: Row(
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(
                      width: 7,
                    ),
                    const Text("Search something..."),
                    const Spacer(),
                    Image.asset(
                      "assets/images/settings.png",
                      width: 25,
                    ),
                  ],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              height: 38,
              child: ListView.builder(
                itemCount: dummyFilters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            if (selectedFilter == dummyFilters[index].id) {
                              selectedFilter = dummyFilters[0].id;
                            } else {
                              selectedFilter = dummyFilters[index].id;
                            }
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(8),
                          color: selectedFilter != dummyFilters[index].id
                              ? AppColors.white
                              : AppColors.primary,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Center(
                            child: Text(
                              dummyFilters[index].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        selectedFilter == dummyFilters[index].id
                                            ? AppColors.white
                                            : AppColors.grey,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: BlocBuilder<FavoriteProductCubit, FavoriteProductState>(
                bloc: cubit,
                buildWhen: (previous, current) =>
                    current is FavoriteProductError ||
                    current is FavoriteProductLoaded ||
                    current is FavoriteProductLoading,
                builder: (context, state) {
                  if (state is FavoriteProductError) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else if (state is FavoriteProductLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (state is FavoriteProductLoaded) {
                    final List<ProductItemModel> favoritesProducts =
                        state.favoriteProducts;
                    return GridView.builder(
                      itemCount: favoritesProducts.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.82,
                        mainAxisSpacing: 25,
                        crossAxisSpacing: 15,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.of(
                                context,
                                rootNavigator: true,
                              )
                                  .pushNamed(
                                AppRoutes.detailsPage,
                                arguments: favoritesProducts[index],
                              )
                                  .then(
                                (value) {
                                  favoriteProductCubit.getFavoriteProducts();
                                  // productDetailsCubit.getFromCart();
                                },
                              );
                            },
                            child:
                                ProductItem(product: favoritesProducts[index]));
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
