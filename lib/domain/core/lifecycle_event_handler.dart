import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {
  final AsyncCallback? onResume;
  final AsyncCallback? onSuspend;
  final AsyncCallback? onChangeBrightness;

  LifecycleEventHandler({
    this.onResume,
    this.onSuspend,
    this.onChangeBrightness,
  });

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        if (onResume != null) {
          await onResume!();
        }
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        if (onSuspend != null) {
          await onSuspend!();
        }
        break;
    }
  }

  @override
  void didChangePlatformBrightness() async {
    if (onChangeBrightness != null) {
      await onChangeBrightness!();
    }

    super.didChangePlatformBrightness();
  }
}
