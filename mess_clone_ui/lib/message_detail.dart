import 'dart:convert';

import 'package:bloc_provider/bloc_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'chat_bloc.dart';
import 'main.dart';

class ChatDetail extends StatefulWidget {
  final MessageModel model;

  const ChatDetail({Key key, this.model}) : super(key: key);

  @override
  _ChatDetailState createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  MessageModel model;
  bool isUserTyping = false;
  TextEditingController _controller = TextEditingController();

  ChatBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<ChatBloc>(context);
    model = widget.model;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            isUserTyping = false;
            setState(() {});
            FocusScope.of(context).unfocus();
          },
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildHeader(),
                _buildListChat(),
                _buildBottom(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildBottom() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          if (!isUserTyping) _buildTools(),
          _buildInput(),
          SizedBox(
            width: 6,
          ),
          _buildSend(),
        ],
      ),
    );
  }

  _buildListChat() {
    // DateTime.now().millisecondsSinceEpoch;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
            stream: _bloc.firestore
                .collection('chat')
                .orderBy('time', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return SizedBox();
              return ListView.separated(
                separatorBuilder: (_, __) => SizedBox(
                  height: 8,
                ),
                shrinkWrap: true,
                reverse: true,
                itemBuilder: (_, index) {
                  return _itemChat(
                      text: snapshot.data.docs[index].data()['message']
                          ['comment'],
                      name: snapshot.data.docs[index].data()['message']
                          ['name']);
                },
                itemCount: snapshot.data.docs.length,
              );
            }),
      ),
    );
  }

  _itemChat({String text, String name}) {
    return Container(
      child: Column(
        crossAxisAlignment: name == _bloc.name
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(name),
          SizedBox(
            height: 4,
          ),
          Container(
            width: 300,
            child: Row(
              mainAxisAlignment: name == _bloc.name
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                if (name == _bloc.name) Expanded(child: SizedBox()),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        color: name == _bloc.name
                            ? Colors.blueAccent
                            : Colors.grey[500],
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Text(
                      text ?? "",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildSend() {
    return GestureDetector(
      onTap: () async {
        final text = _controller.text; // text = Ahihi
        _bloc.sendData(comment: text);
        _controller.text = '';
        setState(() {});
      },
      child: Icon(
        Icons.send,
        color: Colors.blueAccent,
        size: 20,
      ),
    );
  }

  _buildInput() {
    return Expanded(
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: _controller,
          onTap: () {
            setState(() {
              isUserTyping = true;
            });
          },
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: -14, horizontal: 8),
              hintText: 'Aa',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14)),
        ),
      ),
    );
  }

  _buildTools() {
    return Row(
      children: [
        Icon(Icons.add, color: Colors.blueAccent),
        SizedBox(width: 8),
        Icon(Icons.camera_alt_rounded, color: Colors.blueAccent),
        SizedBox(width: 8),
        Icon(Icons.photo, color: Colors.blueAccent),
        SizedBox(width: 8),
        Icon(Icons.keyboard_voice_rounded, color: Colors.blueAccent),
        SizedBox(width: 8),
      ],
    );
  }

  _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context, 'ahihi');
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                model.user.avatar,
                width: 30,
                fit: BoxFit.cover,
              )),
          SizedBox(
            width: 8,
          ),
          Text(
            model.user.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Expanded(child: SizedBox()),
          Container(
            height: 25,
            width: 40,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 18,
                ),
                Icon(
                  Icons.arrow_drop_down_sharp,
                  color: Colors.white,
                  size: 12,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// To parse this JSON data, do
//
//     final aMessageModel = aMessageModelFromJson(jsonString);

AMessageModel aMessageModelFromJson(String str) =>
    AMessageModel.fromJson(json.decode(str));

String aMessageModelToJson(AMessageModel data) => json.encode(data.toJson());

class AMessageModel {
  AMessageModel({
    this.status,
    this.statusMessage,
    this.request,
    this.atext,
    this.lang,
  });

  int status;
  String statusMessage;
  Request request;
  String atext;
  String lang;

  factory AMessageModel.fromJson(Map<String, dynamic> json) => AMessageModel(
        status: json["status"] == null ? null : json["status"],
        statusMessage:
            json["statusMessage"] == null ? null : json["statusMessage"],
        request:
            json["request"] == null ? null : Request.fromJson(json["request"]),
        atext: json["atext"] == null ? null : json["atext"],
        lang: json["lang"] == null ? null : json["lang"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "statusMessage": statusMessage == null ? null : statusMessage,
        "request": request == null ? null : request.toJson(),
        "atext": atext == null ? null : atext,
        "lang": lang == null ? null : lang,
      };
}

class Request {
  Request({
    this.utext,
    this.lang,
  });

  String utext;
  String lang;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        utext: json["utext"] == null ? null : json["utext"],
        lang: json["lang"] == null ? null : json["lang"],
      );

  Map<String, dynamic> toJson() => {
        "utext": utext == null ? null : utext,
        "lang": lang == null ? null : lang,
      };
}
