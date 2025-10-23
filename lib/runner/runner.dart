import 'dart:async';

import 'package:dealerware_flutter_use_cases/firebase_options.dart';
import 'package:dealerware_flutter_use_cases/runner/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Runner {
  static Future<void> run() async {
    await runZonedGuarded(
      () async {
        await initFlutterDependencies();
        runFlutterApp();
      },
      (error, stack) {
        debugPrint(error.toString());
        debugPrint(stack.toString());
      },
    );
  }

  static Future<void> runFlutterApp() async {
    runApp(ProviderScope(child: const MyApp()));
  }

  static Future<void> initFlutterDependencies() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
