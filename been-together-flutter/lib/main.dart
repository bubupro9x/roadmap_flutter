import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Been Together',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.pink,
      ),
      home: MyHomePage(title: 'Been Together'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now();
  dynamic loveDays = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    print('picked');
    print(picked);
    loveDays = DateTime.now().difference(picked).inDays;
    print('loveDays');
    print(loveDays);
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 150,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  'https://cdn.tgdd.vn/GameApp/3/228491/Screentshots/been-together-ung-dung-dem-ngay-yeu-nhau-danh-cho-cap-logo-10-09-2020.png',
                  width: 100,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              'Đếm ngày yêu thương',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 26,
                  color: Colors.white),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'v21official productions',
                    style: TextStyle(
                      fontWeight: FontWeight.w300, // light
                      fontStyle: FontStyle.italic, // italic
                      color: Colors.white60,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Text("${selectedDate.toLocal()}".split(' ')[0]),
                  Text(
                    "${loveDays}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                      'Chọn ngày bắt đầu',
                      style: TextStyle(
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
