import 'package:cardiac_petct/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:cardiac_petct/src/services/firebase_autorizator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final FirebaseNavigationService firebaseNavigationService = Modular.get();
  @override
  void initState() {
    super.initState();
    firebaseNavigationService.defineNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
