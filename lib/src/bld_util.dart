
// ignore_for_file: INVALID_USE_OF_PROTECTED_MEMBER
// ignore_for_file: INVALID_USE_OF_VISIBLE_FOR_TESTING_MEMBER

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BLDUtil {
  static late BLDUtil _instance;
  late BuildContext? context;
  Widget? visible;
  Widget? invisible;
  Widget? clean;
  TextStyle? style;
  TextStyle? hintStyle;

  static void setContext(BuildContext context) {
    _instance.context = context;
  }

  BLDUtil._();

  factory BLDUtil() {
    return _instance;
  }

  static init({
    BuildContext? context,
    Widget? visible,
    Widget? invisible,
    Widget? clean,
    TextStyle? style,
    TextStyle? hintStyle,
  }) {
    _instance = BLDUtil._()
      ..visible = visible ?? const Icon(Icons.visibility)
      ..invisible = invisible ?? const Icon(Icons.visibility_off)
      ..clean = clean ?? const Icon(Icons.close_rounded)
      ..style = style
      ..hintStyle = hintStyle;
    if (context != null) setContext(context);
  }
}
