import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int current = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: AppColors.grey,

        // ),
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (current > 1) current--;
              });
            },
            icon: const Icon(Icons.remove),
          ),
          Text(current.toString()),
          IconButton(
            onPressed: () {
              setState(() {
                current++;
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
