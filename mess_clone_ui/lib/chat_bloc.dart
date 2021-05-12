import 'package:bloc_provider/bloc_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatBloc extends Bloc {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final name = 'Duy';

  ChatBloc() ;

  void listenData() async {
  }

  sendData({String comment})async {
    firestore.collection('chat').add({
      "message": {
        "comment": comment,
        "name": name,
      },        "time": DateTime.now().millisecondsSinceEpoch

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

class MessageFirestore {
  String name;
  String comment;

  MessageFirestore({this.name, this.comment});
}
