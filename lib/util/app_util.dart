
import 'package:flutter/material.dart';

class AppUtil {
  AppUtil._privateConstructor();

  AppUtil();

  static final AppUtil instance = AppUtil._privateConstructor();

  snackBarView(String errorMessage, Color color) {
    return SnackBar(
      content: Text(errorMessage),
      backgroundColor: color,
    );
  }

}
