import 'dart:ui';

import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/views/widgets/popular_search_item.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      constraints: const BoxConstraints(maxHeight: 57),
                      label: Row(
                        children: [
                          const Icon(Icons.search, size: 30),
                          const SizedBox(width: 10),
                          const Text("Search..."),
                          const Spacer(),
                          Image.asset(
                            "assets/images/settings.png",
                            width: 20,
                          )
                        ],
                      ),
                      // border: InputBorder.none,
                      focusedBorder:
                          Theme.of(context).inputDecorationTheme.focusedBorder,
                      enabledBorder:
                          Theme.of(context).inputDecorationTheme.enabledBorder,
                      errorBorder:
                          Theme.of(context).inputDecorationTheme.errorBorder,
                      disabledBorder:
                          Theme.of(context).inputDecorationTheme.disabledBorder,
                      // contentPadding: const EdgeInsets.only(left: 15),
                      // hintStyle: TextStyle(
                      //   color: AppColors.grey,
                      //   fontSize: 18,
                      // ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 7.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Last Search",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    "Clear All",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkBlue,
                        ),
                  ),
                ],
              ),
            ),
            GroupButton(
              isRadio: true,
              buttons: const [
                "Electornics",
                "Pants",
                "Three Second",
                "Long shirt",
              ],
              options: const GroupButtonOptions(
                spacing: 16,
                runSpacing: 16,
                mainGroupAlignment: MainGroupAlignment.start,
              ),
              buttonBuilder: (selected, value, context) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 14),
                  decoration: BoxDecoration(
                    color: selected ? AppColors.primary : AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.grey.withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            value,
                            style: TextStyle(
                              color:
                                  selected ? AppColors.white : AppColors.grey,
                            ),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.close,
                        color: AppColors.grey,
                        size: 20,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Text(
              "Popular Search",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  PopularSearchItem(
                    product: dummyPupularSearch[0],
                    additional: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.pink.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
                        child: Text(
                          "Hot",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  PopularSearchItem(
                    product: dummyPupularSearch[1],
                    additional: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.pink.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
                        child: Text(
                          "New",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  PopularSearchItem(
                    product: dummyPupularSearch[0],
                    additional: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 63, 219, 240)
                            .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 10),
                        child: Text(
                          "Popular",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.green.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  PopularSearchItem(
                    product: dummyPupularSearch[3],
                    additional: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.pink.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
                        child: Text(
                          "New",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
