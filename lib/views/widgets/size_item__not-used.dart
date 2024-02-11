import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SizeItem extends StatefulWidget {
  final String name;
  const SizeItem({super.key, required this.name});

  @override
  State<SizeItem> createState() => _SizeItemState();
}

class _SizeItemState extends State<SizeItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        onTap:(){
          setState(() {
            
          });
        },
        child: Container(
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.grey2,
          ),
          child: Center(
            child: Text(
              widget.name,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ),
      ),
    );
  }
}
