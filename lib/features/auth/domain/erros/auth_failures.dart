import 'package:cardiac_petct/src/errors/failure.dart';

class UserAlreadyInUse extends Failure {
  UserAlreadyInUse()
      : super(errorMessage: 'Usuário já cadastrado com este email.');
}

class EmailNotVerified extends Failure {
  EmailNotVerified() : super(errorMessage: 'Email não confirmado.');
}

class WrongPassword extends Failure {
  WrongPassword() : super(errorMessage: 'Senha incorreta.');
}

class UserNotFound extends Failure {
  UserNotFound() : super(errorMessage: 'Usuário não encontrado.');
}

class InvalidEmail extends Failure {
  InvalidEmail() : super(errorMessage: 'Email inválido');
}
