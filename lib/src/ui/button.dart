import 'package:flutter/material.dart';
import 'dart:ui' as ui show ParagraphBuilder, PlaceholderAlignment;

enum ButtonLayoutStyle {
  landscapeLeft,
  landscapeRight,
  landscapeTop,
  landscapeBottom,
}

class _ButtonStyle {
  Color? backgroundColor, borderColor;
  double? borderWidth = 0.3;
  double? radius;

  EdgeInsetsGeometry? padding;
  BorderRadiusGeometry? borderRadius;

  DecorationImage? backgroundImage;

  _ButtonStyle({
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.radius,
    this.padding,
    this.borderRadius,
    this.backgroundImage,
  });
}

abstract class _Button extends StatefulWidget {
  final VoidCallback? onPressed;

  const _Button({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @protected
  _ButtonStyle styleOf(BuildContext context);

  @protected
  Widget childOf(BuildContext context);

  @override
  __ButtonState createState() {
    return __ButtonState();
  }
}

class __ButtonState extends State<_Button> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    _ButtonStyle _buttonStyle = widget.styleOf(context);

    BorderRadiusGeometry? borderRadius = _buttonStyle.borderRadius ??
        BorderRadius.circular(_buttonStyle.radius ?? 0);

    final Widget result = InkWell(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          image: _buttonStyle.backgroundImage,
          color: _buttonStyle.backgroundImage != null
              ? null
              : _buttonStyle.backgroundColor ?? Colors.transparent,
          border: Border.all(
              color: _buttonStyle.borderColor ?? Colors.transparent,
              width: _buttonStyle.borderWidth ?? 0),
          borderRadius: borderRadius,
        ),
        padding: _buttonStyle.padding,
        child: widget.childOf(context),
      ),
    );
    return result;
  }
}

class BButton extends _Button {
  String? text;
  Widget? image;
  Color? backgroundColor, borderColor, textColor;
  double? borderWidth = 0.3;
  double? radius;
  EdgeInsetsGeometry? padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 7);
  BorderRadiusGeometry? borderRadius;
  double? fontSize;
  FontWeight? fontWeight;

  /// 小部件的结构布局，决定图片与文本的位置关系
  ButtonLayoutStyle layoutStyle;

  /// image 与 text 之间的空隙
  double widgetSpace;

  /// 是否撑开父视图
  /// 仅对:
  /// [ButtonLayoutStyle.landscapeLeft]
  /// [ButtonLayoutStyle.landscapeRight]
  /// 有效
  bool isExpand;

  DecorationImage? backgroundImage;

  BButton({
    Key? key,
    this.text,
    this.image,
    required VoidCallback? onPressed,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.radius,
    this.padding,
    this.borderRadius,
    this.fontSize,
    this.fontWeight,
    this.layoutStyle = ButtonLayoutStyle.landscapeLeft,
    this.widgetSpace = 5.0,
    this.isExpand = false,
    this.backgroundImage,
  }) : super(
          key: key,
          onPressed: onPressed,
        );

  @override
  _ButtonStyle styleOf(BuildContext context) {
    // TODO: implement styleOf
    return _ButtonStyle(
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      borderWidth: borderWidth,
      radius: radius,
      padding: padding,
      borderRadius: borderRadius,
      backgroundImage: backgroundImage,
    );
  }

  @override
  Widget childOf(BuildContext context) {
    // TODO: implement childOf

    Widget? _child;
    String _data = text ?? '';
    Widget? _image = image;
    Widget? _textChild;
    Widget? _imageChild;
    if (_data.isNotEmpty) {
      _textChild = Text(
        text ?? '',
        style: TextStyle(
            color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      );
    }
    if (_image != null) {
      _imageChild = _image;
    }

    if (_textChild != null && _imageChild != null) {
      switch (layoutStyle) {
        case ButtonLayoutStyle.landscapeLeft:
          _child = Text.rich(
            TextSpan(children: [
              WidgetSpan(
                  child: _imageChild,
                  alignment: ui.PlaceholderAlignment.middle),
              WidgetSpan(child: SizedBox(width: widgetSpace)),
              WidgetSpan(child: _textChild),
            ]),
            textAlign: TextAlign.center,
          );
          break;
        case ButtonLayoutStyle.landscapeRight:
          _child = Text.rich(
            TextSpan(children: [
              WidgetSpan(child: _textChild),
              WidgetSpan(child: SizedBox(width: widgetSpace)),
              WidgetSpan(
                  child: _imageChild,
                  alignment: ui.PlaceholderAlignment.middle),
            ]),
            textAlign: TextAlign.center,
          );
          break;
        case ButtonLayoutStyle.landscapeTop:
          _child = Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _imageChild,
              SizedBox(height: widgetSpace),
              _textChild,
            ],
          );
          break;
        case ButtonLayoutStyle.landscapeBottom:
          _child = Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _textChild,
              SizedBox(height: widgetSpace),
              _imageChild,
            ],
          );
          break;
      }
    }
    if (_textChild != null && _imageChild == null) _child = _textChild;
    if (_imageChild != null && _textChild == null) _child = _imageChild;
    if (isExpand) {
      if (_child != null) {
        _child = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _child,
          ],
        );
      }
    }
    return _child ?? const SizedBox(width: 0);
  }
}