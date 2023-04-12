import 'package:cardiac_petct/src/errors/failure.dart';

class FailureToMessageConverter {
  static String convert(Failure failure) {
    if (failure is NoInternetConnectionFailure) {
      return 'Sem conexão com a internet';
    }
    return 'Erro';
  }
}
