import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/utils/app_theme.dart';
import 'package:ecommerce/utils/routes/app_router.dart';
import 'package:ecommerce/utils/routes/app_routes.dart';
import 'package:ecommerce/view_models/auth_cubit/auth_cubit.dart';
import 'package:ecommerce/view_models/cart_cubit/cart_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final cubit = AuthCubit();
            cubit.getCurrentUser();
            return cubit;
          },
        ),
        BlocProvider(
          create: (context) {
            final cartCubit = CartCubit();
            cartCubit.getOrdersFromCart();
            return cartCubit;
          },
        ),
      ],
      child: Builder(
        builder: (context) {
          final authCubit = BlocProvider.of<AuthCubit>(context);
          return BlocBuilder<AuthCubit, AuthState>(
            bloc: authCubit,
            buildWhen: (previous, current) =>
                current is AuthInitial || current is AuthSuccess,
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                initialRoute: state is AuthSuccess
                    ? AppRoutes.customButtomNavBar
                    : AppRoutes.loginPage,
                onGenerateRoute: AppRouter.onGenerator,
              );
            },
          );
        },
      ),
    );
  }
}
