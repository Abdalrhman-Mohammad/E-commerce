import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/services/home_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void getUserData() async {
    try {
      emit(ProfileLoading());
      final homeServices = HomeServicesImpl();

      await Future.delayed(const Duration(seconds: 1));
      final userData=await homeServices.getUserData("cpHXTT80P9sqOX7kQg1M");
      emit(ProfileLoaded(user: userData));
    } catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }
}
