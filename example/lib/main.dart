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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    var _body = [
      BText('hello word'),
      BText('textColor', textColor: Colors.red),
      BText('backgroundColor', backgroundColor: Colors.red),
      BText('wordSpacing test', wordSpacing: 40),
      BText('你好wordSpacing test测试', wordSpacing: 40),
      BText('letterSpacing', letterSpacing: 10),
      BText('字间隔 letterSpacing ', letterSpacing: 10),
      BText('字间隔 letterSpacing', letterSpacing: -3),
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
            child: BText(
              '丨丨丨丨丨',
              fontSize: 34.67,
            ),
          ),
        ],
      ),
      Container(
        color: Colors.purpleAccent,
        child: BText(
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
          child: BButton(
              text: 'BTextButton',
              padding: EdgeInsets.all(10),
              textColor: Colors.red,
              borderColor: Colors.orange,
              backgroundColor: Colors.yellow,
              radius: 5,
              onPressed: () {
                print('BTextButton -> 点击事件');
              })),
      Container(
        width: 300,
        height: 50,
        color: Colors.blueAccent,
        alignment: Alignment.center,
        child: BButton(
            text: '按钮标题',
            image: Icon(Icons.ac_unit, size: 20),
            padding: EdgeInsets.all(10),
            radius: 10,
            backgroundColor: Colors.deepOrangeAccent,
            isExpand: false,
            layoutStyle: ButtonLayoutStyle.landscapeLeft,
            widgetSpace: 10,
            onPressed: () {}),
      )
    ];

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: _body,
        ),
        // child: ListView.separated(
        //     itemBuilder: (_, index) {
        //       return _body[index];
        //     },
        //     separatorBuilder: (_, index) {
        //       return const SizedBox(height: 10);
        //     },
        //     itemCount: _body.length),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
