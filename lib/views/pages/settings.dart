import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl:
                    "https://media.licdn.com/dms/image/C4D03AQE3Qd9SkKKdow/profile-displayphoto-shrink_400_400/0/1653334218070?e=1712793600&v=beta&t=r6xjxk3f0k7uwpD0gDCNwZKtA-ZqEZ_ouQuqU6Lpvjc",
                width: 90,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Abdalrhman Janem",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Text("abdabood2664@gmail.com"),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.person_outlined),
                  const SizedBox(width: 12),
                  Text(
                    "My Profile",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.location_on_outlined),
                  const SizedBox(width: 12),
                  Text(
                    "My Adress",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.shopping_cart_outlined),
                  const SizedBox(width: 12),
                  Text(
                    "My Orders",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.credit_card),
                  const SizedBox(width: 12),
                  Text(
                    "My Cards",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.settings_outlined),
                  const SizedBox(width: 12),
                  Text(
                    "Settings",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.logout_outlined),
                  const SizedBox(width: 12),
                  Text(
                    "Log Out",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
