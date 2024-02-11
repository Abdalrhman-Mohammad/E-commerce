import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/utils/routes/app_routes.dart';
import 'package:ecommerce/views/pages/custom_nav_bar.dart';
import 'package:ecommerce/views/pages/product_details_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.detailsPage:
        ProductItemModel product = settings.arguments as ProductItemModel;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsPage(product: product),
          settings: settings,
        );
      case AppRoutes.customButtomNavBar:
        return MaterialPageRoute(
          builder: (_) => CustomNavBar(),
          settings: settings,
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
