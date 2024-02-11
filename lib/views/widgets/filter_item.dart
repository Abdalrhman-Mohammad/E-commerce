import 'package:ecommerce/models/filter_item_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FilterItem extends StatefulWidget {
  final Filter filter;
  const FilterItem({super.key, required this.filter});

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: InkWell(
        onTap: (){
          setState(() {
            
          });
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
            child: Center(
              child: Text(
                widget.filter.name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.grey,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
