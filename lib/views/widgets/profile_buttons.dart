import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final Widget leftIcon;
  final String title;
  final Widget additional;
  const ProfileButton({
    super.key,
    required this.leftIcon,
    required this.title,
    this.additional = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightGrey,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: leftIcon,
                ),
              ),
            ),
            Text(title),
            const Spacer(),
            additional,
            const Icon(Icons.arrow_right)
          ],
        ),
      ),
    );
  }
}
