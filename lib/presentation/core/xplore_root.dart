import 'package:async_redux/async_redux.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:xplore/application/core/services/helpers.dart';
import 'package:xplore/application/core/themes/app_themes.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/domain/value_objects/app_widget_keys.dart';
import 'package:xplore/presentation/core/widgets/xplore_loader.dart';
import 'package:xplore/presentation/routes/route_generator.dart';
import 'package:xplore/presentation/routes/routes.dart';

/// This Class determines the initial app route, depending on the user's onboarding state
class XploreAppRoot extends StatefulWidget {
  const XploreAppRoot({
    Key? key,
    required this.store,
  }) : super(key: key);

  final Store<AppState> store;

  @override
  _XploreAppRootState createState() => _XploreAppRootState();
}

class _XploreAppRootState extends State<XploreAppRoot>
    with WidgetsBindingObserver {
  BehaviorSubject<String> appInitialRoute = BehaviorSubject<String>();
  static FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      Future<dynamic>.delayed(Duration.zero, () async {
        appInitialRoute.add(
          await getInitialRoute(context: context, store: widget.store),
        );
      });
    });

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: appInitialRoute.stream,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.data == null) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: XploreThemes.primaryColor,
                accentColor: XploreThemes.accentColor),
            home: Scaffold(
              body: Container(
                child: Center(
                  child: XploreLoader(),
                ),
              ),
            ),
          );
        }

        return MaterialApp(
          theme: ThemeData(
              primaryColor: XploreThemes.primaryColor,
              accentColor: XploreThemes.accentColor),
          debugShowCheckedModeBanner: false,
          navigatorKey: globalAppNavigatorKey,
          navigatorObservers: <NavigatorObserver>[
            FirebaseAnalyticsObserver(analytics: analytics),
          ],
          initialRoute: appInitialRoute.valueOrNull ?? landingPageRoute,
          onGenerateRoute: AppRouterGenerator.generateRoute,
        );
      },
    );
  }
}
