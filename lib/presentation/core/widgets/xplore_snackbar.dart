// Flutter imports:
import 'package:flutter/material.dart';

/// [snackbar]
SnackBar snackbar({
  required dynamic content,
  int durationSeconds = 10,
  String? label,
  Function? callback,
}) {
  return SnackBar(
    padding: const EdgeInsets.all(10.0),
    content: content.runtimeType == String
        ? Text(content as String)
        : content as Widget,
    duration: Duration(seconds: durationSeconds),
    action: callback != null
        ? SnackBarAction(label: label!, onPressed: callback as void Function())
        : null,
  );
}
