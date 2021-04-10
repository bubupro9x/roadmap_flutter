import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Second page'),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Pop to first Page'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
