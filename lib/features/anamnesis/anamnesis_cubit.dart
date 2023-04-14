import 'package:cardiac_petct/features/anamnesis/domain/entities/anamnesis_entity.dart';
import 'package:cardiac_petct/features/anamnesis/domain/usecases/send_anamnesis_answers_usecase.dart';
import 'package:cardiac_petct/src/errors/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnamnesisCubit extends Cubit<AnamnesisState> {
  final SendAnamnesisAnswersUsecase sendAnamnesisAnswersUsecase;
  AnamnesisCubit(this.sendAnamnesisAnswersUsecase)
      : super(AnamnesisInitialState());

  AnamnesisEntity anamnesisEntity = AnamnesisEntity.empty();

  Future<void> sendAnamnesisForm() async {
    final result = await sendAnamnesisAnswersUsecase(anamnesisEntity);
    result.fold((l) => emit(AnamnesisErrorState(l)),
        (r) => emit(AnamnesisSuccessState()));
  }
}

abstract class AnamnesisState {}

class AnamnesisInitialState extends AnamnesisState {}

class AnamnesisLoadingState extends AnamnesisState {}

class AnamnesisSuccessState extends AnamnesisState {}

class AnamnesisErrorState extends AnamnesisState {
  final Failure failure;

  AnamnesisErrorState(this.failure);
}
