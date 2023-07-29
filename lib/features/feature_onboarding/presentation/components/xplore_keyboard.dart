import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';

class XploreKeyboard extends StatelessWidget {

  final TextEditingController phoneController;

  const XploreKeyboard({super.key, required this.phoneController});

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
      InkWell(
        onTap: (){
          //  add phone number based on the clicked number
          if (!isDeleteIcon) {
            phoneController.text += value;
            phoneController.selection = TextSelection.collapsed(offset: phoneController.text.length);
          } else {
            phoneController.text = phoneController.text.substring(0, phoneController.text.length - 1);
            phoneController.selection = TextSelection.collapsed(offset: phoneController.text.length);
          }
        },
        borderRadius: BorderRadius.circular(100),
        child: Ink(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: isDeleteIcon ? Center(child: Icon(Icons.backspace_rounded, color: XploreColors.black,)) : Text(
                value,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            )),
      );
}