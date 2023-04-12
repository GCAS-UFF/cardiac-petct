import 'package:cardiac_petct/features/auth/data/models/user_model.dart';
import 'package:cardiac_petct/features/auth/domain/erros/auth_failures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class AuthRemoteDatasource {
  Future<void> registration(UserModel userModel, String password);
  Future<bool> confirmEmailVerified();
  Future<void> sendEmailVerification();
}

class AuthRemoteDatasourceImp implements AuthRemoteDatasource {
  late final FirebaseAuth firebaseAuth;
  late final FirebaseDatabase firebaseDatabase;
  AuthRemoteDatasourceImp() {
    init();
    userChangesStateHandler();
  }

  void init() {
    firebaseAuth = FirebaseAuth.instance;
    firebaseDatabase = FirebaseDatabase.instance;
  }

  userChangesStateHandler() {
    firebaseAuth.userChanges().listen((user) {
      if (user == null) {
        return Modular.to.navigate('/auth/');
      }
      if (!user.emailVerified) {
        Modular.to.navigate('/email-verify/');
        return;
      }
      return Modular.to.navigate('/home/');
    });
  }

  @override
  Future<void> registration(UserModel userModel, String password) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: userModel.email, password: password);
      final firebaseUser = userCredential.user;

      DatabaseReference userReference =
          firebaseDatabase.ref().child('Users').child(firebaseUser!.uid);
      userModel = userModel.copyWith(id: firebaseUser.uid);
      await userReference.set(userModel.toMap());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw UserAlreadyInUse();
      }
    }
  }

  @override
  Future<bool> confirmEmailVerified() async {
    try {
      await firebaseAuth.currentUser!.reload();
      final firebaseUser = firebaseAuth.currentUser;
      return firebaseUser!.emailVerified;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw UserAlreadyInUse();
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    try {
      await firebaseAuth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException {
      rethrow;
    }
  }
}
