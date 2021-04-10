import 'package:flutter/material.dart';

import 'main.dart';

class NameDetails extends StatefulWidget {
  final MessageModel model;

  const NameDetails({Key key, this.model}) : super(key: key);

  @override
  _NameDetailsState createState() => _NameDetailsState();
}

class _NameDetailsState extends State<NameDetails> {
  MessageModel model;
  bool isUserTyping = false;

  @override
  void initState() {
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
                Expanded(child: Container()),
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
          SizedBox(width: 8),
          _buildSend(),
        ],
      ),
    );
  }

  _buildSend() {
    return GestureDetector(
      onTap: () {},
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