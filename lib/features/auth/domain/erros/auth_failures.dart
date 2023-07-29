import 'package:cardiac_petct/src/errors/failure.dart';
import 'package:localization/localization.dart';

class UserAlreadyInUse extends Failure {
  UserAlreadyInUse() : super(errorMessage: 'email-already-in-use'.i18n());
}

class EmailNotVerified extends Failure {
  EmailNotVerified() : super(errorMessage: 'email-not-confirmed-yet'.i18n());
}

class WrongPassword extends Failure {
  WrongPassword() : super(errorMessage: 'wrong-password'.i18n());
}

class UserNotFound extends Failure {
  UserNotFound() : super(errorMessage: 'user-not-found'.i18n());
}

class InvalidEmail extends Failure {
  InvalidEmail() : super(errorMessage: 'invalid-email'.i18n());
}
