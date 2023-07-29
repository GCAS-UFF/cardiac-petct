import 'package:cardiac_petct/features/auth/domain/usecases/login_usecase/login_usecase.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/recover_password_usecase/recover_password_usecase.dart';
import 'package:cardiac_petct/src/errors/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  final RecoverPasswordUsecase recoverPasswordUsecase;
  LoginCubit(this.loginUseCase, this.recoverPasswordUsecase)
      : super(LoginInitialState());

  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());
    final result = await loginUseCase(email, password);
    result.fold(
        (l) => emit(LoginErrorState(l)), (r) => emit(LoginSuccessState()));
  }

  Future<void> sentRecoverPasswordEmail(String email) async {
    emit(LoginLoadingState());
    final result = await recoverPasswordUsecase(email);
    result.fold(
        (l) => emit(LoginErrorState(l)), (r) => emit(LoginSuccessState()));
  }
}

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginEmailSentState extends LoginState {}

class LoginErrorState extends LoginState {
  final Failure failure;

  LoginErrorState(this.failure);
}

class LoginLoadingState extends LoginState {}
