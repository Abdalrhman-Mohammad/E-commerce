import 'package:ecommerce/models/announcement_item.dart';
import 'package:ecommerce/models/category_item_model.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial());

  void getHomeData() async {
    try {
      emit(HomeCubitLoading());
      final List<ProductItemModel> products = dummyProducts;
      final List<AnnouncementModel> announcement = dummyAnnouncements;
      final List<CategoryModel> categories = dummyCategories;

      await Future.delayed(const Duration(seconds: 1));
      emit(HomeCubitLoaded(
          products: products,
          announcement: announcement,
          categories: categories));
    } catch (e) {
      emit(HomeCubitError(error: e.toString()));
    }
  }
}
