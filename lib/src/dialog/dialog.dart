
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef CustomStyle = BLDDialogCustomStyle Function(
    BLDDialogCustomStyle customStyle);

void showBLDCustomDialog(
  BuildContext context, {
  String? title,
  String? content,
  String? cancel,
  String? confirm,
  bool hiddenCancel = false,
  bool barrierDismissible = false,
  bool hiddenCloseIcon = false,
  WidgetBuilder? contentBuilder,
  WidgetBuilder? cancelBuilder,
  WidgetBuilder? confirmBuilder,
  CustomStyle? customStyle,
  GestureTapCallback? onCancel,
  GestureTapCallback? onConfirm,
}) {
  Widget dialog = BLDCustomDialog(
    title: title ?? '提示',
    content: content ?? '提示',
    cancel: cancel ?? '取消',
    confirm: confirm ?? '确认',
    hiddenCancel: hiddenCancel,
    hiddenCloseIcon: hiddenCloseIcon,
    contentBuilder: contentBuilder,
    cancelBuilder: cancelBuilder,
    confirmBuilder: confirmBuilder,
    customStyle: customStyle,
    onCancel: onCancel,
    onConfirm: onConfirm,
  );

  showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return dialog;
      });
}

class BLDCustomDialog extends StatefulWidget {
  BLDCustomDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.cancel,
    required this.confirm,
    this.hiddenCancel = false,
    this.barrierDismissible = true,
    this.hiddenCloseIcon = false,
    this.contentBuilder,
    this.cancelBuilder,
    this.confirmBuilder,
    this.customStyle,
    this.onCancel,
    this.onConfirm,
  }) : super(key: key);

  /// 标题
  String title;

  /// 内容文本
  String content;

  /// 取消按钮文本
  String cancel;

  /// 确认按钮文本
  String confirm;

  /// 参数指定表单是否被删除,当用户点击屏幕时，屏幕消失。
  bool barrierDismissible;

  /// 隐藏取消按钮，默认为false
  bool hiddenCancel;

  /// 内容部分的构建器，优先级高于content,
  WidgetBuilder? contentBuilder;

  /// 取消按钮的构建器，优先级高于cancel,
  WidgetBuilder? cancelBuilder;

  /// 确认按钮的构建器，优先级高于confirm,
  WidgetBuilder? confirmBuilder;

  /// 默认组件的风格
  CustomStyle? customStyle;

  /// 点击了取消按钮
  GestureTapCallback? onCancel;

  /// 点击了确认按钮
  GestureTapCallback? onConfirm;

  /// 隐藏右上角关闭icon
  bool hiddenCloseIcon;

  @override
  _BLDCustomDialogState createState() {
    return _BLDCustomDialogState();
  }
}

class _BLDCustomDialogState extends State<BLDCustomDialog> {
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
    BLDDialogCustomStyle _style = BLDDialogCustomStyle();
    _style = widget.customStyle?.call(_style) ?? _style;

    return Dialog(
      child: Stack(
        children: [
          Container(
            padding: _style.padding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: _style.titleColor,
                    fontWeight: _style.titleFontWeight,
                    fontSize: _style.titleFontSize,
                  ),
                ),
                SizedBox(height: _style.topSpace),
                widget.contentBuilder?.call(context) ??
                    Text(
                      widget.content,
                      style: TextStyle(
                        color: _style.contentColor,
                        fontWeight: _style.contentFontWeight,
                        fontSize: _style.contentFontSize,
                      ),
                      textAlign: _style.textAlign,
                    ),
                SizedBox(height: _style.bottomSpace),
                Row(
                  children: [
                    if (!widget.hiddenCancel)
                      Expanded(
                          child: widget.cancelBuilder?.call(context) ??
                              _button(
                                text: widget.cancel,
                                backgroundColor: _style.cancelBackgroundColor,
                                gradient: _style.cancelGradient,
                                borderRadius: _style.cancelBorderRadius,
                                border: _style.cancelBorder,
                                textColor: _style.cancelColor,
                                fontSize: _style.cancelFontSize,
                                fontWeight: _style.cancelFontWeight,
                                fontStyle: _style.cancelFontStyle,
                                padding: _style.buttonPadding,
                                onTap: () {
                                  Navigator.pop(context);
                                  widget.onCancel?.call();
                                },
                              )),
                    if (!widget.hiddenCancel)
                      SizedBox(width: _style.buttonSpace),
                    Expanded(
                        child: widget.confirmBuilder?.call(context) ??
                            _button(
                              text: widget.confirm,
                              backgroundColor: _style.confirmBackgroundColor,
                              gradient: _style.confirmGradient,
                              borderRadius: _style.confirmBorderRadius,
                              border: _style.confirmBorder,
                              textColor: _style.confirmColor,
                              fontSize: _style.confirmFontSize,
                              fontWeight: _style.confirmFontWeight,
                              fontStyle: _style.confirmFontStyle,
                              padding: _style.buttonPadding,
                              onTap: () {
                                Navigator.pop(context);
                                widget.onConfirm?.call();
                              },
                            )),
                  ],
                ),
              ],
            ),
          ),
          if(!widget.hiddenCloseIcon)Positioned(
              right: 13,
              top: 16,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.close_sharp,
                  size: 18.33,
                  color: Color(0xffd1d1d1),
                ),
              ))
        ],
      ),
    );
  }

  Widget _button({required String text,
  Color? backgroundColor,
  Gradient? gradient,
  BorderRadiusGeometry? borderRadius,
  BoxBorder? border,
  Color? textColor,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  GestureTapCallback? onTap,
  EdgeInsetsGeometry? padding,}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 7),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:
          gradient == null ? backgroundColor ?? Colors.transparent : null,
          gradient: gradient,
          borderRadius: borderRadius,
          border: border,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
            fontStyle: fontStyle,
          ),
        ),
      ),
    );
  }
}

class BLDDialogCustomStyle {
  /// title
  Color? titleColor;
  double titleFontSize = 18;
  FontWeight titleFontWeight = FontWeight.bold;
  FontStyle? titleFontStyle;

  /// cancel
  Color? cancelColor;
  double? cancelFontSize;
  FontWeight? cancelFontWeight;
  FontStyle? cancelFontStyle;

  /// confirm
  Color? confirmColor;
  double? confirmFontSize;
  FontWeight? confirmFontWeight;
  FontStyle? confirmFontStyle;

  /// content
  Color? contentColor;
  double? contentFontSize;
  FontWeight? contentFontWeight;
  FontStyle? contentFontStyle;
  TextAlign textAlign = TextAlign.center;

  Border cancelBorder = Border.all(color: Color(0xffF85959), width: 0.33);
  Border? confirmBorder;

  Color? cancelBackgroundColor;
  Color? confirmBackgroundColor;

  Gradient? cancelGradient;
  Gradient? confirmGradient;

  BorderRadiusGeometry cancelBorderRadius = BorderRadius.circular(20);
  BorderRadiusGeometry confirmBorderRadius = BorderRadius.circular(20);

  /// dialog 外层边距
  EdgeInsetsGeometry padding =
      EdgeInsets.symmetric(horizontal: 35, vertical: 33);

  /// 内部部分与标题部分之间的空隙
  double topSpace = 15;

  /// 内部部分与操作按钮部分之间的空隙
  double bottomSpace = 30;

  /// 底部操作按钮之间的的空隙
  double buttonSpace = 15;

  /// 仅针对操作按钮
  EdgeInsetsGeometry? buttonPadding;
}
