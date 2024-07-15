

import 'package:flutter/cupertino.dart';

import 'package:bld_ui_kit/src/bld_util.dart';
import 'package:flutter/material.dart';

class BLDText extends StatelessWidget {

  /// 要显示的文本
  final String data;

  /// 文本对齐方式-水平方向
  final TextAlign? textAlign;

  /// 处理视觉溢出(例如：...结尾)
  final TextOverflow? overflow;

  /// 最大行数
  final int? maxLines;

  /// 文本是否占据最大宽，默认为否
  // final bool? isExpand;

  final TextDirection? textDirection;

  /// 文本样式
  /// 优先级高于其他文本样式
  final TextStyle? style;

  /// 字体的样式
  final StrutStyle? strutStyle;

  // style

  /// 绘制文本时使用的颜色
  final Color? textColor;

  /// 背景颜色
  final Color? backgroundColor;

  /// 绘制文本时使用的字形大小
  final double? fontSize;

  /// 绘制文本时使用的字体厚度
  final FontWeight? fontWeight;

  /// 字体风格，常规/斜体
  final FontStyle? fontStyle;

  /// 英文：每个字母之间的距离
  /// 中文：每个汉字之间的距离
  /// 可以使用负数，会进一步缩进距离
  final double? letterSpacing;

  /// 英文：每个单词之间的的间距（hello {wordSpacing} word）
  /// 中文：没效果
  /// 中英：负数时，英文会缩进到中文之中，反正仅仅会影响英文
  /// 可以使用负数，会进一步缩进距离
  final double? wordSpacing;

  /// 行高：fontSize * height = 行间距
  final double? height;

  /// 修复自动换行问题（存在字母或数字，导致换行留白问题）
  final bool? fixAutoLines;

  final TextBaseline? textBaseline;

  final TextDecoration? decoration;

  final Color? decorationColor;

  final TextDecorationStyle? decorationStyle;

  final Locale? locale;

  /// 点击当前文本，携带当前text
  final ValueChanged<String>? onTap;


   BLDText(
    this.data, {
    this.textColor,
    this.backgroundColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.fixAutoLines,
    this.textAlign,
    this.overflow,
    this.maxLines,
    // this.isExpand,
    this.locale,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textBaseline,
    this.decoration,
    this.decorationColor,
    this.decorationStyle, this.onTap,
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    var _text = data;

    if (fixAutoLines == true) {
      _text = Characters(_text).join('\u{200B}');
    }

    TextStyle _customStyle = style ??
        TextStyle(
          color: textColor ?? BLDUtil().style?.color,
          backgroundColor: backgroundColor,
          fontSize: fontSize ?? BLDUtil().style?.fontSize,
          fontWeight: fontWeight ?? BLDUtil().style?.fontWeight,
          fontStyle: fontStyle ?? BLDUtil().style?.fontStyle,
          letterSpacing: letterSpacing ?? BLDUtil().style?.letterSpacing,
          wordSpacing: wordSpacing ?? BLDUtil().style?.wordSpacing,
          height: height ?? BLDUtil().style?.height,
          locale: locale ?? BLDUtil().style?.locale,
          textBaseline: textBaseline ?? BLDUtil().style?.textBaseline,
          decoration: decoration ?? BLDUtil().style?.decoration,
          decorationColor: decorationColor ?? BLDUtil().style?.decorationColor,
          decorationStyle: decorationStyle ?? BLDUtil().style?.decorationStyle,
        );

    return onTap == null ? Text(
      _text,
      key: key,
      style: _customStyle,
      strutStyle: strutStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      textDirection: textDirection,
    ) : GestureDetector(
      child: Text(
        _text,
        key: key,
        style: _customStyle,
        strutStyle: strutStyle,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        textDirection: textDirection,
      ),
      onTap: () => onTap?.call(data),
    );
  }
}
