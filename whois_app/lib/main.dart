import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whois',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Whois'),
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

  TextEditingController _controller;
  var dio = Dio();
  var _domainName;
  var _creationDate;
  var _expirationDate;
  var _registrantName;
  var _registrar;
  var _nameServer;
  var _status;
  var _whoisResponseStatus;
  var _whoisResponseMessage;
  var whoisButtonText = 'Whois';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  callWhois() async{
    if(_controller.text == null || _controller.text == ''){
      setState(() {
      _whoisResponseStatus = 'error';
      _whoisResponseMessage = 'Chưa nhập từ khóa truy vấn';
      });
      return;
    }

    setState(() {
      whoisButtonText = 'Đang kiểm tra...';
    });
    Response response = await dio.get('https://whois.inet.vn/api/whois/domainspecify/' + _controller.text);
    setState(() {
      whoisButtonText = 'Whois';
    });
    if(response.statusCode == 200 && response.data['code'] != '1'){
      setState(() {
        _whoisResponseStatus = 'success';
        _domainName = response.data['domainName'];
        _creationDate = response.data['creationDate'];
        _expirationDate = response.data['expirationDate'];
        _registrantName = response.data['registrantName'];
        _registrar = response.data['registrar'];
        _nameServer = response.data['nameServer'];
        _status = response.data['status'];
      });
    } else if(response.statusCode == 200 && response.data['code'] == '1'){
      setState(() {
        _whoisResponseStatus = 'error';
        _whoisResponseMessage = 'Tên miền '+response.data['domainName']+' chưa được đăng ký';
      });
    } else {
      setState(() {
      _whoisResponseStatus = 'error';
      _whoisResponseMessage = 'Lỗi không xác định';
      });
    }

  }

  Widget buildResultSuccess() {
    return ListView(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      children: [
        RichText(
            text: new TextSpan(
              children: <TextSpan>[
                new TextSpan(text: 'Thông tin đăng ký tên miền: '),
                new TextSpan(text: '$_domainName', style: new TextStyle(fontWeight: FontWeight.bold)),
              ],
            )
        ),
        Container(height: 10,),
        RichText(
            text: new TextSpan(
              children: <TextSpan>[
                new TextSpan(text: 'Ngày đăng ký: '),
                new TextSpan(text: '$_creationDate', style: new TextStyle(fontWeight: FontWeight.bold)),
              ],
            )
        ),
        Container(height: 10,),
        RichText(
            text: new TextSpan(
              children: <TextSpan>[
                new TextSpan(text: 'Ngày hết hạn: '),
                new TextSpan(text: '$_expirationDate', style: new TextStyle(fontWeight: FontWeight.bold)),
              ],
            )
        ),
        Container(height: 10,),
        RichText(
            text: new TextSpan(
              children: <TextSpan>[
                new TextSpan(text: 'Chủ sở hữu tên miền: '),
                new TextSpan(text: '$_registrantName', style: new TextStyle(fontWeight: FontWeight.bold)),
              ],
            )
        ),
        Container(height: 10,),
        RichText(
            text: new TextSpan(
              children: <TextSpan>[
                new TextSpan(text: 'Cờ trạng thái: '),
                new TextSpan(text: _status != null ? _status.join(', ') : '', style: new TextStyle(fontWeight: FontWeight.bold)),
              ],
            )
        ),
        Container(height: 10,),
        RichText(
            text: new TextSpan(
              children: <TextSpan>[
                new TextSpan(text: 'Quản lý tại Nhà đăng ký: '),
                new TextSpan(text: '$_registrar', style: new TextStyle(fontWeight: FontWeight.bold)),
              ],
            )
        ),
        Container(height: 10,),
        RichText(
            text: new TextSpan(
              children: <TextSpan>[
                new TextSpan(text: 'Nameservers: '),
                new TextSpan(text: _nameServer != null ? _nameServer.join(', ') : '', style: new TextStyle(fontWeight: FontWeight.bold)),
              ],
            )
        ),
      ],
    );
  }

  Widget buildResultError() {
    return Text(_whoisResponseMessage, style: TextStyle(color: Colors.red));
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
            Text(
              'KIỂM TRA TÊN MIỀN',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          Container(height: 20,),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nhập tên miền hoặc từ khóa bạn muốn kiếm tra',
              ),
            ),
            Container(height: 20,),
            ElevatedButton(
              onPressed: () {
                callWhois();
              },

              child:
                Text('$whoisButtonText'),
            ),
            Container(height: 50),
            if(_whoisResponseStatus == 'success')
              buildResultSuccess()
            else if(_whoisResponseStatus == 'error')
              buildResultError()
          ],
        ),
      )
    );
  }
}
