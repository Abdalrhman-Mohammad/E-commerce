import 'package:ecommerce/models/announcement_item.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/utils/routes/app_routes.dart';
import 'package:ecommerce/view_models/favorite_product_cubit/favorite_product_cubit.dart';
import 'package:ecommerce/view_models/home_cubit/home_cubit.dart';
import 'package:ecommerce/view_models/product_details_cubit/product_details_cubit.dart';
import 'package:ecommerce/views/widgets/custom_carousel_slider.dart';
import 'package:ecommerce/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    final favoriteProductCubit = BlocProvider.of<FavoriteProductCubit>(context);
    // final productDetailsCubit = BlocProvider.of<ProductDetailsCubit>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<HomeCubit, HomeCubitState>(
          bloc: homeCubit,
          buildWhen: (previous, current) =>
              current is HomeCubitLoaded ||
              current is HomeCubitError ||
              current is HomeCubitLoading,
          builder: (context, state) {
            if (state is HomeCubitError) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is HomeCubitLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is HomeCubitLoaded) {
              final List<ProductItemModel> products = state.products;
              final List<AnnouncementModel> announcement = state.announcement;
              return Column(
                children: [
                  CustomCarouselSlider(announcements: announcement),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "New Arrivals",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      Text(
                        "See All",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBlue,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
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
                            arguments: products[index],
                          )
                              .then(
                            (value) {
                              favoriteProductCubit.getFavoriteProducts();
                              // productDetailsCubit.getFromCart();
                            },
                          );
                        },
                        child: ProductItem(
                          product: products[index],
                        ),
                      );
                    },
                  )
                ],
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
