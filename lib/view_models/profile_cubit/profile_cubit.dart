import 'package:ecommerce/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void getUserData() async {
    try {
      emit(ProfileLoading());

      await Future.delayed(const Duration(seconds: 1));
      final userData = dummyUser;
      emit(ProfileLoaded(user: userData));
    } catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }
}
