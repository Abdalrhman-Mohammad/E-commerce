part of 'home_cubit.dart';

sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class HomeCubitLoading extends HomeCubitState {}

final class HomeCubitLoaded extends HomeCubitState {
  HomeCubitLoaded({
    required this.products,
    required this.announcement,
    required this.categories,
  });

  final List<ProductItemModel> products;
  final List<AnnouncementModel> announcement;
  final List<CategoryModel> categories;
}

final class HomeCubitError extends HomeCubitState {
  final String error;

  HomeCubitError({required this.error});
}
