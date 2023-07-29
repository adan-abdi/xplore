// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:shamiri/application/redux/states/app_state.dart';
import 'package:shamiri/di/controllers_di.dart';
import 'package:shamiri/di/locator.dart';
import 'package:shamiri/domain/value_objects/app_global_constants.dart';
import 'package:shamiri/features/feature_home/presentation/home_page.dart';
import 'package:shamiri/features/feature_main/main_screen.dart';
import 'package:shamiri/features/feature_onboarding/presentation/screens/landing_page.dart';
import 'package:shamiri/infrastructure/local_repository/database_state_persistor.dart';
import 'package:shamiri/presentation/core/pages/dashboard.dart';
import 'package:shamiri/presentation/core/pages/dashboard_scaffold.dart';
import 'package:shamiri/presentation/core/pages/user_profile_page.dart';
import 'package:shamiri/presentation/core/widgets/unrecoverable_error_widget.dart';
import 'package:shamiri/xplore_app.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
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
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
