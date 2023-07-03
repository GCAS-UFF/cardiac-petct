import 'package:cardiac_petct/features/anamnesis/data/datasources/anamnesis_local_datasource.dart';
import 'package:cardiac_petct/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:cardiac_petct/features/auth/data/models/user_model.dart';
import 'package:cardiac_petct/src/services/constants/firebase_autorizator_route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirebaseNavigationService {
  late final FirebaseAuth firebaseAuth;
  late final FirebaseDatabase firebaseDatabase;
  final AuthLocalDatasource authLocalDatasource;
  final AnamnesisLocalDatasource anamnesisLocalDatasource;

  FirebaseNavigationService(
      this.authLocalDatasource, this.anamnesisLocalDatasource) {
    init();
  }

  late DatabaseReference userRef;

  void init() {
    firebaseAuth = FirebaseAuth.instance;
    firebaseDatabase = FirebaseDatabase.instance;
  }

  defineNavigation() async {
    final userCached = await authLocalDatasource.getUser();
    if (userCached == null) {
      firebaseAuth.userChanges().listen((user) async {
        if (user != null) {
          if (!user.emailVerified) {
            return Modular.to
                .navigate(FirebaseAutorizatorRouteNames.emailVerify);
          }
          userRef = firebaseDatabase
              .ref()
              .child('Users')
              .child(firebaseAuth.currentUser!.uid);
          final response = await userRef.get();
          final userData = UserModel.fromDataSnapshot(response);
          await authLocalDatasource.cacheUser(userData);
          final anamnesis = await anamnesisLocalDatasource.getLocalAnamnesis();
          if (anamnesis == null) {
            return Modular.to.navigate(FirebaseAutorizatorRouteNames.anamnesis);
          }
          final hasExamSettings = userData.examSettings != null;
          if (!hasExamSettings) {
            Modular.to.push(
              MaterialPageRoute(
                builder: (context) => Center(
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ),
            );
            return;
          }
          return Modular.to.navigate(FirebaseAutorizatorRouteNames.home);
        }
        return Modular.to.navigate(FirebaseAutorizatorRouteNames.auth);
      });
    } else {
      final anamnesis = await anamnesisLocalDatasource.getLocalAnamnesis();
      if (anamnesis == null) {
        return Modular.to.navigate(FirebaseAutorizatorRouteNames.anamnesis);
      }
      final hasExamSettings = userCached.examSettings != null;
      if (!hasExamSettings) {
        return Modular.to.push(
          MaterialPageRoute(
            builder: (context) => Center(
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
        );
      }
      return Modular.to.navigate(FirebaseAutorizatorRouteNames.home);
    }
  }
}
