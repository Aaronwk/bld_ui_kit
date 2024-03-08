import 'package:bld_ui_kit/bld_ui_kit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BLD(
        style: TextStyle(
          color: Colors.deepPurple,
        ),
        builder: () => MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(

                primarySwatch: Colors.blue,
              ),
              home: const MyHomePage(title: 'Flutter Demo Home Page'),
            ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    var _body = [
      BLDText('hello word'),
      BLDText('textColor', textColor: Colors.red),
      BLDText('backgroundColor', backgroundColor: Colors.red),
      BLDText('wordSpacing test', wordSpacing: 40),
      BLDText('你好wordSpacing test测试', wordSpacing: 40),
      BLDTextField(
        controller: TextEditingController(),
        hintText: '请输入内容',
        title: '测试标题',
        axis: BLDAxis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 13.33),
        backgroundColor: Colors.white,
        radius: 6,
        clean: Icon(Icons.close_rounded, color: Colors.red,),
        alwaysClean: true,
        obscureText: true,
        showEye: true,
        maxLength: 4,
      ),
      BLDText('letterSpacing', letterSpacing: 10),
      BLDText('字间隔 letterSpacing ', letterSpacing: 10),
      BLDText('字间隔 letterSpacing', letterSpacing: -3),
      Row(
        children: [
          Container(
            color: Colors.pink,
            child: Text(
              '丨丨丨丨丨',
              style: TextStyle(fontSize: 34.67),
            ),
          ),
          Container(
            color: Colors.green,
            child: BLDText(
              '丨丨丨丨丨',
              fontSize: 34.67,
            ),
          ),
        ],
      ),
      Container(
        color: Colors.purpleAccent,
        child: BLDText(
          '文本文本文本文本文本文本文本文本文本文本本',
          textAlign: TextAlign.center,
          onTap: (text) {
            print(text);
          },
        ),
      ),
      Container(
          width: 200,
          height: 50,
          color: Colors.green,
          alignment: Alignment.center,
          child: BLDButton(
              text: 'BLDTextButton',
              padding: EdgeInsets.all(10),
              textColor: Colors.red,
              borderColor: Colors.orange,
              backgroundColor: Colors.yellow,
              radius: 5,
              onPressed: () {
                print('BLDTextButton -> 点击事件');
              })),
      Container(
        width: 300,
        height: 50,
        color: Colors.blueAccent,
        alignment: Alignment.center,
        child: BLDButton(
            text: '按钮标题',
            image: Icon(Icons.ac_unit, size: 20),
            padding: EdgeInsets.all(10),
            radius: 10,
            backgroundColor: Colors.deepOrangeAccent,
            isExpand: false,
            layoutStyle: ButtonLayoutStyle.landscapeLeft,
            widgetSpace: 10,
            onPressed: () {
              showBLDCustomDialog(context, customStyle: (style) {
                style.titleColor = Colors.blue;
                return style;
              });
            }),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      backgroundColor: Colors.grey,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          children: _body,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
