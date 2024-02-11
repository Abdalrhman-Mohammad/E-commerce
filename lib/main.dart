import 'package:ecommerce/utils/app_theme.dart';
import 'package:ecommerce/utils/routes/app_router.dart';
import 'package:ecommerce/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.customButtomNavBar,
      onGenerateRoute: AppRouter.onGenerator,
    );
  }
}