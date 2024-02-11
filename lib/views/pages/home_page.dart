import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/models/announcement_item.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/views/pages/search_page.dart';
import 'package:ecommerce/views/widgets/category_tab_view.dart';
import 'package:ecommerce/views/widgets/home_tab_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final CarouselController _controller = CarouselController();
    int _current = 0;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                "https://media.licdn.com/dms/image/C4D03AQE3Qd9SkKKdow/profile-displayphoto-shrink_400_400/0/1653334218070?e=1712793600&v=beta&t=r6xjxk3f0k7uwpD0gDCNwZKtA-ZqEZ_ouQuqU6Lpvjc",
                width: 50,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  "Hi, Abdalrhman",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  "Let's go shopping",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppColors.grey,
                      ),
                ),
              ],
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                InkWell(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return SearchPage();
                            },
                          ),
                        ),
                    child: const Icon(Icons.search)),
                const SizedBox(width: 3),
                const Icon(
                  Icons.notifications_outlined,
                ),
              ],
            ),
          ),
        ],
      ),
      body: const DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            children: [
              TabBar(
                tabs: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Home"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Category"),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    HomeTabView(),
                    CategoryTabView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
