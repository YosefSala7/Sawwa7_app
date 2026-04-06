import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/navbar.dart';
import 'package:flutter_application_2/AllOnboarding.dart';
import 'package:flutter_application_2/storageAuth.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashLoaded extends SplashState {
  final dynamic nextScreen;
  SplashLoaded(this.nextScreen);
}

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> checkToken() async {
    emit(SplashLoading());

    final hasToken = await TokenStorage.hasToken();

    if (hasToken) {
      emit(SplashLoaded(const Navbar()));
    } else {
      emit(SplashLoaded(b1()));
    }
  }
}