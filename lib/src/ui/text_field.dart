import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'text.dart';
import 'enum.dart';
import 'package:bld_ui_kit/src/bld_util.dart';

class BLDTextField extends StatefulWidget {
  /// 在main文件中可以设置默认风格，默认使用BLD中的属性设置
  ///
  /// BLD(
  ///     style: TextStyle(
  ///        color: Colors.deepOrange,
  ///      ),
  ///   builder: () => MaterialApp())
  ///
  /// 该控件的属性优先级最高，其次为BLD中的默认设置
  BLDTextField({
    Key? key,
    this.controller,
    this.title,
    this.titleColor,
    this.titleFontSize,
    this.titleFontWeight,
    this.titleAlignment = BLDAlignment.start,
    this.hintText,
    this.hintTextColor,
    this.visible,
    this.invisible,
    this.clean,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.keyboardType,
    this.fontSize,
    this.textColor,
    this.obscureText = false,
    this.backgroundColor = Colors.transparent,
    this.borderColor,
    this.cursorColor,
    this.borderWidth,
    this.radius,
    this.alwaysClean = false,
    this.enabled = true,
    this.showEye = false,
    this.showLine = false,
    this.focusNode,
    this.inputFormatters,
    this.titleTextFieldSpacing = 10,
    this.style,
    this.hintStyle,
    this.padding,
    this.axis = BLDAxis.vertical,
    this.readOnly = false,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  /// 若为空，在其他功能将不会生效，仅支持文本输入功能
  final TextEditingController? controller;

  /// 附加标题，默认在文本框上方，切默认不显示。
  final String? title;

  /// 标题颜色
  final Color? titleColor;

  /// 标题字号
  final double? titleFontSize;

  /// 标题字重
  final FontWeight? titleFontWeight;

  /// 标题在垂直方向时，在水平方向的对齐方式[start],[center],[end]
  final BLDAlignment titleAlignment;

  /// 提示文字，默认为请输入
  final String? hintText;

  /// 可见性控件，例如，密码框中的睁开眼睛
  final Widget? visible;

  /// 不可见性空间，例如，密码框中的闭上眼睛
  final Widget? invisible;

  /// 清空控件，清除当前输入框所有文本
  final Widget? clean;

  /// 对齐方式
  final TextAlign textAlign;

  /// 支持输入文本的最大长度
  final int? maxLength;

  /// 键盘类型，例如数字键盘[TextInputType.number]
  final TextInputType? keyboardType;

  /// 输入框文字字号
  final double? fontSize;

  /// 输入框文字颜色
  final Color? textColor;

  /// 输入框提示文字颜色
  final Color? hintTextColor;

  /// 模糊文本，通常用于密码框，默认为false
  late bool obscureText;

  /// 输入框背景颜色
  final Color? backgroundColor;

  /// 边框颜色
  final Color? borderColor;

  /// 光标颜色
  final Color? cursorColor;

  /// 边框宽度，默认为0.3
  final double? borderWidth;

  /// 圆角弧度
  final double? radius;

  /// 是否显示清除按钮（只有输入框内有文本时才会显示）
  final bool alwaysClean;

  ///
  final bool enabled;

  /// 是否显示文本模糊开关
  final bool showEye;

  /// 底部线条
  final bool showLine;

  /// 焦点
  final FocusNode? focusNode;

  /// 输入框限制条件
  final List<TextInputFormatter>? inputFormatters;

  /// 标题与输入框之间的空隙
  final double titleTextFieldSpacing;

  /// 输入框文本风格，优先级最高
  final TextStyle? style;

  /// 输入框提示文本风格，优先级最高
  final TextStyle? hintStyle;

  /// 输入框边距
  final EdgeInsetsGeometry? padding;

  /// 标题与输入框的方向
  final BLDAxis axis;

  /// 只读
  final bool readOnly;

  /// 监听文本发生变化
  final ValueChanged<String>? onChanged;

  /// return 按键操作
  final ValueChanged<String>? onSubmitted;

  @override
  _BLDTextFieldState createState() {
    return _BLDTextFieldState();
  }
}

class _BLDTextFieldState extends State<BLDTextField> {
  bool _showClean = false;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller?.addListener(() {
        if (mounted) {
          setState(() {
            _showClean = widget.controller!.text.isNotEmpty;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(() {});
    super.dispose();
  }

  CrossAxisAlignment formatTitleAlignment() {
    switch (widget.titleAlignment) {
      case BLDAlignment.start:
        return CrossAxisAlignment.start;
      case BLDAlignment.center:
        return CrossAxisAlignment.center;
      case BLDAlignment.end:
        return CrossAxisAlignment.end;
    }
  }

  Widget _renderClean() {
    return GestureDetector(
        onTap: () => widget.controller?.clear(),
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(5),
          child: widget.clean ?? BLDUtil().clean,
        ));
  }

  Widget _renderEye() {
    return GestureDetector(
        onTap: () => setState(() {
              widget.obscureText = !widget.obscureText;
            }),
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(5),
          child: widget.obscureText
              ? widget.invisible ?? BLDUtil().invisible
              : widget.visible ?? BLDUtil().visible,
        ));
  }

  Widget _renderTextField() {
    TextStyle _customStyle = widget.style ??
        TextStyle(
          fontSize: widget.fontSize ?? BLDUtil().style?.fontSize,
          color: widget.textColor ?? BLDUtil().style?.color,
        );
    TextStyle _customHintStyle = widget.hintStyle ??
        TextStyle(
          fontSize: widget.fontSize ?? BLDUtil().hintStyle?.fontSize,
          color: widget.hintTextColor ?? BLDUtil().hintStyle?.color,
        );
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: (widget.radius != null)
              ? BorderRadius.circular(widget.radius ?? 0)
              : null,
          border: widget.showLine
              ? const Border(
                  bottom: BorderSide(color: Color(0xffC9C9C9), width: 0.33))
              : Border.all(
                  color: widget.borderColor ?? Colors.transparent,
                  width: widget.borderWidth ?? 0.3,
                )),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            enabled: widget.enabled,
            inputFormatters: widget.inputFormatters,
            obscureText: widget.obscureText,
            cursorColor: widget.cursorColor,
            textAlign: widget.textAlign,
            maxLength: widget.maxLength,
            style: _customStyle,
            keyboardType: widget.keyboardType,
            readOnly: widget.readOnly,
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
            decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                hintText: widget.hintText ?? '请输入',
                hintStyle: _customHintStyle),
          )),
          if (_showClean && widget.alwaysClean) _renderClean(),
          if (widget.showEye) _renderEye(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var _title = widget.title ?? '';

    var _body = [
      if (_title.isNotEmpty)
        BLDText(
          _title,
          textColor: widget.titleColor,
          fontSize: widget.titleFontSize,
          fontWeight: widget.titleFontWeight,
        ),
      if (_title.isNotEmpty)
        widget.axis == BLDAxis.vertical
            ? SizedBox(height: widget.titleTextFieldSpacing)
            : SizedBox(width: widget.titleTextFieldSpacing),
    ];

    return widget.axis == BLDAxis.vertical
        ? Column(
            crossAxisAlignment: formatTitleAlignment(),
            mainAxisSize: MainAxisSize.min,
            children: _body..add(_renderTextField()),
          )
        : Row(
            children: _body..add(Expanded(child: _renderTextField())),
          );
  }
}
