import 'package:ecommerce/models/category_item_model.dart';
import 'package:ecommerce/views/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoryTabView extends StatelessWidget {
  const CategoryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: dummyCategories.indexed
              .map(
                (e) => CategoryItem(index: e.$1, category: e.$2),
              )
              .toList(),
        ),
      ),
    );
  }
}
