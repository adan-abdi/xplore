// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:shamiri/application/core/themes/colors.dart';

class SlidingTabs extends StatelessWidget {
  final List<SlidingTab>? tabs;
  final int? selectedTab;
  final void Function(int?)? onTabChanged;

  const SlidingTabs({
    Key? key,
    this.tabs,
    this.selectedTab,
    this.onTabChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<int>(
      thumbColor: XploreColors.white,
      backgroundColor: XploreColors.neutralLight,
      children: tabs!.asMap().map(
            (index, tab) => MapEntry(
              index,
              _SlidingSegment(
                tab.title,
                key: tab.key,
                selected: index == selectedTab,
              ),
            ),
          ),
      onValueChanged: onTabChanged!,
      groupValue: selectedTab,
    );
  }
}

class SlidingTab {
  final Key? key;
  final Text? title;

  SlidingTab({this.key, this.title});
}

class _SlidingSegment extends StatelessWidget {
  final Text? text;
  final bool selected;

  _SlidingSegment(
    this.text, {
    Key? key,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: selected ? XploreColors.transparent : XploreColors.neutralLight,
      height: 40,
      alignment: Alignment.center,
      child: DefaultTextStyle(
          child: text!,
          style: (selected
                  ? TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    )
                  : TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ))
              .apply(
            color: XploreColors.neutralDark,
          )),
    );
  }
}
