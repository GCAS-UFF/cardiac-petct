import 'package:cardiac_petct/src/errors/failure.dart';

class UserAlreadyInUse extends Failure {
  UserAlreadyInUse()
      : super(errorMessage: 'Usuário já cadastrado com este email.');
}

class EmailNotVerified extends Failure {
  EmailNotVerified() : super(errorMessage: 'Email não confirmado.');
}
