import 'package:ecommerce/models/category_item_model.dart';
import 'package:ecommerce/view_models/home_cubit/home_cubit.dart';
import 'package:ecommerce/views/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryTabView extends StatelessWidget {
  const CategoryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<HomeCubit, HomeCubitState>(
          bloc: homeCubit,
          buildWhen: (previous, current) =>
              current is HomeCubitLoaded ||
              current is HomeCubitError ||
              current is HomeCubitLoading,
          builder: (context, state) {
            print(state.toString() + "category");

            if (state is HomeCubitError) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is HomeCubitLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is HomeCubitLoaded) {
              final categories = state.categories;
              return Column(
                children: categories.indexed
                    .map(
                      (e) => CategoryItem(index: e.$1, category: e.$2),
                    )
                    .toList(),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
