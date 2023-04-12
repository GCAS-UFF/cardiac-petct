import 'package:cardiac_petct/src/errors/failure.dart';

class UserAlreadyInUse extends Failure {
  UserAlreadyInUse()
      : super(errorMessage: 'Usuário já cadastrado com este email.');
}
