import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),//fullscreen
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              FlutterLogo(),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text('Hello\n Welcome Back',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 15)
                  ),
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.grey, fontSize: 15)
                      ),
                    ),
                  ),
                  Text("SHOW",
                  style: TextStyle(color: Colors.blue, fontSize: 15),)
                ]
              ),
              SizedBox(
                child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                    onPressed: onSignInClicked,
                    child: Text("SIGN IN", style: TextStyle(color: Colors.white, fontSize: 16))
                ),
              ),
              Container(
                  height: 130,
                  width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('NEW USER? SIGN UP',
                        style: TextStyle(fontSize: 15, color: Colors.blue),),
                        Text('FORGOT PASSWORD',
                          style: TextStyle(fontSize: 15, color: Colors.blue),)
                      ]
                    ),
                ),
            ],
          ),
        )
      ),
    );
  }
}

void onSignInClicked() {}
