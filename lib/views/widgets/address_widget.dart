import 'package:ecommerce/models/address.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  final AddressModel address;
  const AddressWidget({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            address.imgUrl,
            height: 100,
            width: 100,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              address.title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(
              address.description,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w600, color: AppColors.grey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
