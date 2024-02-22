import 'package:ecommerce/services/auth_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthServices authServices = AuthServicesImpl();
  Future<void> signInWIthEmailAnsPassword(String email, String password) async {
    emit(AuthLoading());
    try {
      final result =
          await authServices.signInWithEmailAndPassword(email, password);
      if (result) {
        return emit(AuthSuccess());
      } else {
        return emit(AuthFailure('Faild to sign in'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signUpWIthEmailAnsPassword(String email, String password) async {
    final AuthServices authServices = AuthServicesImpl();
    emit(AuthLoading());
    try {
      final result =
          await authServices.signUpWithEmailAndPassword(email, password);
      if (result) {
        return emit(AuthSuccess());
      } else {
        return emit(AuthFailure('Faild to sign out'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    try {
      await authServices.signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> getCurrentUser() async {
    emit(AuthLoading());
    try {
      print("user");
      final user = await authServices.currentUser();
      print(user);
      if (user != null) {
        return emit(AuthSuccess());
      } else {
        return emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
