// Flutter imports:
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shamiri/core/domain/model/cart_model.dart';
import 'package:shamiri/core/domain/model/user_model.dart';
import 'package:shamiri/core/domain/model/user_prefs.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/core/presentation/controller/user_prefs_controller.dart';
import 'package:shamiri/core/utils/constants.dart';

// Project imports:
import 'package:shamiri/di/controllers_di.dart';
import 'package:shamiri/di/locator.dart';
import 'package:shamiri/features/feature_home/presentation/screens/home_page.dart';
import 'package:shamiri/features/feature_main/main_screen.dart';
import 'package:shamiri/features/feature_onboarding/presentation/screens/landing_page.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:shamiri/features/feature_onboarding/presentation/screens/verify_phone_page.dart';

import 'features/feature_onboarding/presentation/screens/create_profile_page.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();

  await Hive.initFlutter(appDocumentDirectory.path);

  Hive.registerAdapter(UserPrefsAdapter());
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(CartModelAdapter());
  await Hive.openBox(Constants.USER_PREFS_BOX);

  invokeDependencies();
  initializeControllers();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthController _authController;
  late final UserPrefsController _userPrefsController;

  @override
  void initState() {
    super.initState();

    _authController = Get.find<AuthController>();
    _userPrefsController = Get.find<UserPrefsController>();

    initializeUserprefs();
  }

  void initializeUserprefs() async {
    final userPrefsBox =
        await Hive.box(Constants.USER_PREFS_BOX).get('userPrefs') as UserPrefs?;

    if (userPrefsBox == null) {
      _userPrefsController.addUserPrefs(
          userPrefs: UserPrefs(isLoggedIn: false, isProfileCreated: false));
    }

    _authController.setUserLoggedIn(
        isLoggedIn: userPrefsBox?.isLoggedIn ?? false);

    _authController.setUserProfileCreated(
        isProfileCreated: userPrefsBox?.isProfileCreated ?? false);
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return Obx(
      () => GetMaterialApp(
        home: _authController.isUserLoggedIn.value &&
                _authController.isUserProfileCreated.value
            ? MainScreen()
            : _authController.isUserLoggedIn.value &&
                    !_authController.isUserProfileCreated.value
                ? CreateProfilePage()
                : LandingPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
