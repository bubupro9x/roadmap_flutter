import 'package:bloc_provider/bloc_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatBloc extends Bloc {
  final name = 'Duy';

  ChatBloc() {}

  void getData() async {}

  sendData({String comment}) {}

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
