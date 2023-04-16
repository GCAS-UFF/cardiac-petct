import 'package:cardiac_petct/features/auth/data/models/user_model.dart';
import 'package:cardiac_petct/src/services/constants/firebase_autorizator_route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirebaseNavigationService {
  late final FirebaseAuth firebaseAuth;
  late final FirebaseDatabase firebaseDatabase;

  FirebaseNavigationService() {
    init();
  }

  void init() {
    firebaseAuth = FirebaseAuth.instance;
    firebaseDatabase = FirebaseDatabase.instance;
  }

  defineNavigation() {
    firebaseAuth.userChanges().listen((user) async {
      if (user != null) {
        if (!user.emailVerified) {
          return Modular.to.navigate(FirebaseAutorizatorRouteNames.emailVerify);
        }
        final isAnamnesisComplete = await checkCompletionAnamnesisForm();
        if (!isAnamnesisComplete) {
          return Modular.to.navigate(FirebaseAutorizatorRouteNames.anamnesis);
        }
        return Modular.to.navigate(FirebaseAutorizatorRouteNames.home);
      }
      return Modular.to.navigate(FirebaseAutorizatorRouteNames.auth);
    });
  }

  Future<bool> checkCompletionAnamnesisForm() async {
    final userRef = firebaseDatabase
        .ref()
        .child('Users')
        .child(firebaseAuth.currentUser!.uid);
    final response = await userRef.get();
    final userData = UserModel.fromDataSnapshot(response);
    return userData.anamnesisForm;
  }
}
