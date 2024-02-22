import 'package:ecommerce/models/announcement_item.dart';
import 'package:ecommerce/models/category_item_model.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/services/home_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial());
  final homeServices = HomeServicesImpl();
  void getHomeData() async {
    try {
      emit(HomeCubitLoading());
      final List<ProductItemModel> products = await homeServices.getProducts();
      final List<AnnouncementModel> announcement =
          await homeServices.getAnnouncements();
      final List<CategoryModel> categories = await homeServices.getCategories();
      emit(HomeCubitLoaded(
          products: products,
          announcement: announcement,
          categories: categories));
    } catch (e) {
      emit(HomeCubitError(error: e.toString()));
    }
  }
}
