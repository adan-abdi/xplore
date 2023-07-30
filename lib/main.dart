// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shamiri/core/domain/model/user_prefs.dart';
import 'package:shamiri/core/utils/constants.dart';

// Project imports:
import 'package:shamiri/di/controllers_di.dart';
import 'package:shamiri/di/locator.dart';
import 'package:shamiri/features/feature_main/main_screen.dart';
import 'package:shamiri/features/feature_onboarding/presentation/screens/landing_page.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();

  await Hive.initFlutter(appDocumentDirectory.path);

  Hive.registerAdapter(UserPrefsAdapter());
  await Hive.openBox(Constants.USER_PREFS_BOX);

  invokeDependencies();
  initializeControllers();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return GetMaterialApp(
      home: LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
