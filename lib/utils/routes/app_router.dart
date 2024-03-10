import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/utils/routes/app_routes.dart';
import 'package:ecommerce/view_models/checkout_cubit/checkout_cubit.dart';
import 'package:ecommerce/view_models/favorite_product_cubit/favorite_product_cubit.dart';
import 'package:ecommerce/view_models/home_cubit/home_cubit.dart';
import 'package:ecommerce/view_models/product_details_cubit/product_details_cubit.dart';
import 'package:ecommerce/view_models/profile_cubit/profile_cubit.dart';
import 'package:ecommerce/views/pages/checkout_page.dart';
import 'package:ecommerce/views/pages/custom_nav_bar.dart';
import 'package:ecommerce/views/pages/login_page.dart';
import 'package:ecommerce/views/pages/product_details_page.dart';
import 'package:ecommerce/views/pages/profile_page.dart';
import 'package:ecommerce/views/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic> onGenerator(RouteSettings settings) {
    final homeCubit = HomeCubit();
    final userDataCubit = ProfileCubit();
    final favoriteProductCubit = FavoriteProductCubit();
    final productDetailsCubit = ProductDetailsCubit();

    switch (settings.name) {
      case AppRoutes.customButtomNavBar:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) {
                  homeCubit.getHomeData();
                  return homeCubit;
                },
              ),
              BlocProvider(
                create: (context) {
                  favoriteProductCubit.getFavoriteProducts();
                  return favoriteProductCubit;
                },
              ),
            ],
            child: const CustomNavBar(),
          ),
          settings: settings,
        );
      case AppRoutes.detailsPage:
        ProductItemModel product = settings.arguments as ProductItemModel;
        favoriteProductCubit.getFavoriteProducts();
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) {
                  final product = settings.arguments as ProductItemModel;
                  final productId = product.id;
                  productDetailsCubit.getProductDetails(productId);
                  return productDetailsCubit;
                },
              ),
              BlocProvider.value(
                value: favoriteProductCubit,
              ),
            ],
            child: const ProductDetailsPage(),
          ),
          settings: settings,
        );
      case AppRoutes.loginPage:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginPage();
          },
        );
      case AppRoutes.signupPage:
        return MaterialPageRoute(
          builder: (context) {
            return const Signup();
          },
        );
      case AppRoutes.checkoutPage:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) {
                final cubit = CheckoutCubit();
                cubit.getPageData();

                return cubit;
              },
              child: const CheckoutPage(),
            );
          },
        );
      case AppRoutes.profilePage:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) {
                userDataCubit.getUserData();
                return userDataCubit;
              },
              child: const ProfilePage(),
            );
          },
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Page not found"),
            ),
          ),
        );
    }
  }
}
