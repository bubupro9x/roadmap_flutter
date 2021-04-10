import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('First page'),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: Text('Push Second Page'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// Inkwell

// GestureDetector
