
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bld_util.dart';

class BLD extends StatelessWidget {
  BLD({
    Key? key,
    required this.builder,
    this.visible,
    this.invisible,
    this.clean,
    this.style,
    this.hintStyle,
  }) : super(key: key);
  Widget Function() builder;
  Widget? visible;
  Widget? invisible;
  Widget? clean;
  TextStyle? style;
  TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    BLDUtil.init(
      context: context,
      visible: visible,
      invisible: invisible,
      clean: clean,
      style: style,
      hintStyle: hintStyle,
    );
    return builder();
  }
}