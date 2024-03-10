import 'package:ecommerce/utils/routes/app_routes.dart';
import 'package:ecommerce/view_models/auth_cubit/auth_cubit.dart';
import 'package:ecommerce/views/widgets/settings_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "General",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SettingsButton(
                title: "Edit Profile",
                icon: Icons.person_outlined,
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(AppRoutes.profilePage);
                },
              ),
              const SettingsButton(
                title: "Change Password",
                icon: Icons.lock,
              ),
              const SettingsButton(
                title: "Notifications",
                icon: Icons.shopping_cart_outlined,
              ),
              const SettingsButton(
                title: "Security",
                icon: Icons.shield_outlined,
              ),
              const SettingsButton(
                title: "Language",
                icon: Icons.language,
              ),
              Text(
                "Preferencess",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SettingsButton(
                title: "Legal and Policies",
                icon: Icons.shield_outlined,
              ),
              const SettingsButton(
                title: "Help and Support",
                icon: Icons.help,
              ),
              SettingsButton(
                title: "Log Out",
                icon: Icons.logout_outlined,
                onTap: () {
                  authCubit.signOut();
                  Navigator.pushNamed(context, AppRoutes.loginPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
