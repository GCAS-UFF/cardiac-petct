import 'package:cardiac_petct/features/auth/data/models/user_model.dart';
import 'package:cardiac_petct/features/auth/domain/erros/auth_failures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class AuthRemoteDatasource {
  Future<void> registration(UserModel userModel, String password);
  Future<bool> confirmEmailVerified();
  Future<void> sendEmailVerification();
  Future<void> login(String email, String password);
  Future<void> recoverPassword(String email);
  Future<void> signOut();
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
      sendEmailVerification();
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

  @override
  Future<void> login(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        throw WrongPassword();
      }
      if (e.code == 'user-not-found') {
        throw UserNotFound();
      }
      rethrow;
    }
  }

  @override
  Future<void> recoverPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFound();
      }
      if (e.code == 'invalid-email') {
        throw InvalidEmail();
      }
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException {
      rethrow;
    }
  }
}
