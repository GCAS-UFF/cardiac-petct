import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:cardiac_petct/app_module.dart';
import 'package:cardiac_petct/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ModularApp(
      module: AppModule(),
      child: DevicePreview(
        enabled: false,
        builder: (context) => const AppWidget(),
      ),
    ),
  );
}
