import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CheckOutTitles extends StatelessWidget {
  final String title;
  final VoidCallback? editFunction;
  final int? numberOfItems;
  const CheckOutTitles({
    super.key,
    required this.title,
    this.editFunction,
    this.numberOfItems,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title + (editFunction != null ? " ($numberOfItems)" : ""),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                )),
        if (editFunction != null)
          InkWell(
            onTap: editFunction,
            child: Text(
              "Edit",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.darkBlue),
            ),
          ),
      ],
    );
  }
}
