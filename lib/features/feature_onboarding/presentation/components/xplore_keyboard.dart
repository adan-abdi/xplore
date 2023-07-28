import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';

class XploreKeyboard extends StatelessWidget {
  const XploreKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _keyboardCircle(value: "1"),
            _keyboardCircle(value: "2"),
            _keyboardCircle(value: "3")
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _keyboardCircle(value: "4"),
            _keyboardCircle(value: "5"),
            _keyboardCircle(value: "6")
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _keyboardCircle(value: "7"),
            _keyboardCircle(value: "8"),
            _keyboardCircle(value: "9")
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _keyboardCircle(value: "", visible: false),
            _keyboardCircle(value: "0"),
            _keyboardCircle(value: "", isDeleteIcon: true),
          ],
        ),
      ],
    );
  }

  Widget _keyboardCircle(
          {required String value,
          bool visible = true,
          bool isDeleteIcon = false}) =>
      Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: visible ? XploreColors.xploreOrange : Colors.transparent,
              borderRadius: BorderRadius.circular(100)),
          child: Center(
            child: isDeleteIcon ? Center(child: Icon(Icons.backspace_rounded, color: XploreColors.black,)) : Text(
              value,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ));
}
