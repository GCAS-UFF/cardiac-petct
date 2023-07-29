import 'package:cardiac_petct/src/errors/failure.dart';
import 'package:cardiac_petct/features/auth/domain/entities/user_entity.dart';
import 'package:cardiac_petct/features/auth/domain/usecases/registration_usecase/register_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final RegistrationUsecase registrationUsecase;
  RegistrationCubit(this.registrationUsecase)
      : super(RegistrationInitialsState());

  Future<void> registration(UserEntity userEntity, String password) async {
    emit(RegistrationLoadingState());
    final result = await registrationUsecase(userEntity, password);
    result.fold((l) => emit(RegistrationErrorState(l)),
        (r) => emit(RegistrationSuccessState()));
  }
}

abstract class RegistrationState {}

class RegistrationInitialsState extends RegistrationState {}

class RegistrationSuccessState extends RegistrationState {}

class RegistrationLoadingState extends RegistrationState {}

class RegistrationErrorState extends RegistrationState {
  final Failure failure;

  RegistrationErrorState(this.failure);
}
