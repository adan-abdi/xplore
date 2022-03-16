// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<Widget> otpPinCodeWidgets({
  required BuildContext context,
  required double dist,
  required TextEditingController controller1,
  required FocusNode controller1fn,
  required Function field1FocusChange,
  required TextEditingController controller2,
  required FocusNode controller2fn,
  required Function field2FocusChange,
  required TextEditingController controller3,
  required FocusNode controller3fn,
  required Function field3FocusChange,
  required TextEditingController controller4,
  required FocusNode controller4fn,
  required Function field4FocusChange,
  required TextEditingController controller5,
  required FocusNode controller5fn,
  required Function field5FocusChange,
  required TextEditingController controller6,
  required FocusNode controller6fn,
  required Function field6FocusChange,
}) {
  return <Widget>[
    Padding(
      padding: EdgeInsets.only(right: dist, left: dist),
      child: Container(
        alignment: Alignment.center,
        child: TextFormField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          enabled: true,
          controller: controller1,
          autofocus: true,
          focusNode: controller1fn,
          onChanged: (ct) {
            if (ct.length > 0) {
              field1FocusChange;
            }
          },
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, color: Colors.deepOrange),
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(right: dist, left: dist),
      child: new Container(
        alignment: Alignment.center,
        child: new TextField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          onChanged: (ct) {
            field2FocusChange;
          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          controller: controller2,
          focusNode: controller2fn,
          enabled: true,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, color: Colors.deepOrange),
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(right: dist, left: dist),
      child: new Container(
        alignment: Alignment.center,
        child: new TextField(
          onChanged: (ct) {
            field3FocusChange;
          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          controller: controller3,
          focusNode: controller3fn,
          textAlign: TextAlign.center,
          enabled: true,
          style: TextStyle(fontSize: 24, color: Colors.deepOrange),
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(right: dist, left: dist),
      child: new Container(
        alignment: Alignment.center,
        child: new TextField(
          onChanged: (ct) {
            field4FocusChange;
          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          controller: controller4,
          focusNode: controller4fn,
          enabled: true,
          style: TextStyle(fontSize: 24, color: Colors.deepOrange),
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(right: dist, left: dist),
      child: new Container(
        alignment: Alignment.center,
        child: new TextField(
          onChanged: (ct) {
            field5FocusChange;
          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          controller: controller5,
          focusNode: controller5fn,
          textAlign: TextAlign.center,
          enabled: true,
          style: TextStyle(fontSize: 24, color: Colors.deepOrange),
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(right: dist, left: dist),
      child: new Container(
        alignment: Alignment.center,
        child: new TextField(
          onChanged: (ct) {
            field6FocusChange;
          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          controller: controller6,
          focusNode: controller6fn,
          enabled: true,
          style: TextStyle(fontSize: 24, color: Colors.deepOrange),
        ),
      ),
    ),
  ];
}
