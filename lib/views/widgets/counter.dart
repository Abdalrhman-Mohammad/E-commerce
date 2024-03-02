import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final dynamic cubit;
  final int counter;
  const Counter({super.key, required this.cubit, required this.counter});

  @override
  Widget build(BuildContext context) {
    print("reach");
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
              cubit.decrementCounter();

              // setState(() {
              //   if (current > 1) current--;
              // });
            },
            icon: const Icon(Icons.remove),
          ),
          Text(counter.toString()),
          IconButton(
            onPressed: () async {
              cubit.incrementCounter();
              // await Future.delayed(const Duration(seconds: 1));

              // setState(() {
              //   current++;
              // });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
