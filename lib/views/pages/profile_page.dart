import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/view_models/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = BlocProvider.of<ProfileCubit>(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
      bloc: profileCubit,
      buildWhen: (previous, current) =>
          current is ProfileLoaded ||
          current is ProfileError ||
          current is ProfileLoading,
      builder: (context, state) {
        if (state is ProfileError) {
          return Scaffold(
              body: Center(
            child: Text(state.error),
          ));
        } else if (state is ProfileLoading) {
          return const Scaffold(
              body: Center(
            child: CircularProgressIndicator.adaptive(),
          ));
        } else if (state is ProfileLoaded) {
          final user = state.user;
          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.arrow_back),
              ),
              title: Text(
                "Profile",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: user.imgUrl,
                        width: 90,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Username",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        const Icon(Icons.person_outline_rounded),
                        const SizedBox(width: 12),
                        Text(
                          user.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Email or Phone Number",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        const Icon(Icons.email_outlined),
                        const SizedBox(width: 12),
                        Text(
                          user.email,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Account Linked With",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ListView.builder(
                        itemCount: user.linkedAccounts.length,

                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Image.asset(user.linkedAccounts[index].imgLink,
                                    width: 22),
                                const SizedBox(width: 12),
                                Text(
                                  user.linkedAccounts[index].provider,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                const Icon(Icons.link)
                              ],
                            ),
                          );
                        },

                        // child: Row(
                        //   children: [
                        //     Image.asset("assets/images/google.png", width: 22),
                        //     const SizedBox(width: 12),
                        //     Text(
                        //       "Google",
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .bodySmall!
                        //           .copyWith(fontWeight: FontWeight.bold),
                        //     ),
                        //     Spacer(),
                        //     Icon(Icons.link)
                        //   ],
                        // ),
                      ),
                    ),
                  ),
                 
                ],
              ),
            ),
          );
        } else {
          return const Scaffold(body: SizedBox());
        }
      },
    );
  }
}
