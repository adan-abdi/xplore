// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:rxdart/subjects.dart';

// Project imports:
import 'package:xplore/application/core/themes/colors.dart';
import 'package:xplore/application/redux/states/app_state.dart';
import 'package:xplore/application/singletons/button_status.dart';

class ActionButton extends StatefulWidget {
  final String widgetText;
  final String nextRoute;
  final Function? onTapcallback;
  final BehaviorSubject<Color>? colorStream;
  final BehaviorSubject<bool>? statusStream;

  const ActionButton({
    Key? key,
    required this.widgetText,
    required this.nextRoute,
    required this.statusStream,
    required this.colorStream,
    this.onTapcallback,
  }) : super(key: key);

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: StreamBuilder(
          stream: widget.colorStream ?? ButtonStatusStore().colorStream.stream,
          builder: (BuildContext context, AsyncSnapshot<Color> colorStream) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      colorStream.data ?? XploreColors.white),
                ),
                child: StreamBuilder(
                  stream: widget.statusStream,
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> statusStream) {
                    return Text(
                      widget.widgetText,
                      style: TextStyle(
                        color: (statusStream.data ?? false)
                            ? XploreColors.white
                            : XploreColors.black,
                      ),
                    );
                  },
                ),
                onPressed: () {
                  (widget.onTapcallback == null)
                      ? StoreProvider.dispatch<AppState>(
                          context,
                          NavigateAction.pushNamed(widget.nextRoute),
                        )
                      : widget.onTapcallback;
                },
              ),
            );
          }),
    );
  }
}
