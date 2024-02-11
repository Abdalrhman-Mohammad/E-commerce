import 'package:ecommerce/models/filter_item_model.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/views/widgets/filter_item.dart';
import 'package:ecommerce/views/widgets/product_item.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  String selectedFilter = dummyFilters[0].id;
  @override
  Widget build(BuildContext context) {
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
                    Icon(Icons.search),
                    const SizedBox(
                      width: 7,
                    ),
                    Text("Search something..."),
                    Spacer(),
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
            SizedBox(height: 8),
            Expanded(
              child: GridView.builder(
                itemCount: dummyFavorites.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.82,
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return ProductItem(product: dummyFavorites[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
