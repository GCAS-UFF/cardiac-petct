import 'package:cardiac_petct/features/auth/domain/erros/auth_failures.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/confirm_email_verified_usecase/confirm_email_verified_usecase.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/send_email_verification_usecase/send_email_verification_usecase.dart';
import 'package:cardiac_petct/src/errors/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailVerifyCubit extends Cubit<EmailVerifyState> {
  final ConfirmEmailVerifiedUsecase confirmEmailVerifiedUsecase;
  final SendEmailVerificationUsecase sendEmailVerificationUsecase;
  EmailVerifyCubit(
      this.confirmEmailVerifiedUsecase, this.sendEmailVerificationUsecase)
      : super(EmailVerifyInitialsState());

  Future<void> confirmEmailVerified() async {
    final response = await confirmEmailVerifiedUsecase();
    response.fold((l) => emit(EmailVerifyErrorState(l)), (r) {
      if (r == true) {
        emit(EmailVerifySuccessState());
      } else {
        emit(EmailVerifyErrorState(EmailNotVerified()));
      }
    });
  }

  Future<void> sendEmailVerification() async {
    final response = await sendEmailVerificationUsecase();
    response.fold((l) => emit(EmailVerifyErrorState(l)),
        (r) => emit(EmailVerifyEmailSentState()));
  }
}

abstract class EmailVerifyState {}

class EmailVerifyInitialsState extends EmailVerifyState {}

class EmailVerifySuccessState extends EmailVerifyState {}

class EmailVerifyEmailSentState extends EmailVerifyState {}

class EmailVerifyLoadingState extends EmailVerifyState {}

class EmailVerifyErrorState extends EmailVerifyState {
  final Failure failure;

  EmailVerifyErrorState(this.failure);
}
