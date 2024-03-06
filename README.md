<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->


[![Version](https://img.shields.io/badge/version-0.0.2-blue.svg)](https://pub.dev/packages/bld_ui_kit)

This is a simple encapsulation library of the base UI space, which is easy to use for common UI development.

## Usage


### 文本(Text)
```dart
BText('text', textColor:Colors.white)
```

### 按钮(Button)
```dart
BLDButton(
    text: '按钮标题',
    image: Icon(Icons.ac_unit, size: 20),
    padding: EdgeInsets.all(10),
    radius: 10,
    backgroundColor: Colors.deepOrangeAccent,
    isExpand: false,
    layoutStyle: ButtonLayoutStyle.landscapeLeft,
    widgetSpace: 10,
    onPressed: () {})
```

### 会话(Dialog)
```dart
showBLDCustomDialog(context, customStyle: (style){
  style.titleColor = Colors.blue;
  return style;
});
```
