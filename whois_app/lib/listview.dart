import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MyHomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/detail': (context) => MessengerDetail(),
      },
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
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.extentAfter < 100) {
        // load more
        // print('trigger loadmore');
      }
      if (_scrollController.offset > 100) {
        if (showFAB == false) {
          showFAB = true;
          setState(() {});
        }
      } else {
        if (showFAB == true) {
          showFAB = false;
          setState(() {});
        }
      }
    });

    messagesModel.add(MessageModel(
        user: UserModel(
            name: 'Brian',
            avatar:
            'https://cdn.baogiaothong.vn/upload/images/2021-1/article_img/2021-03-30/img-bgt-2021-ngoc-trinh-a-1617122674-width620height620.jpg'),
        hasStory: true,
        isActive: true,
        comment: "Làm người yêu em nhé",
        time: '5m'));

    messagesModel.add(MessageModel(
        user: UserModel(
            name: 'Steve Job',
            avatar:
            'https://readtoolead.com/wp-content/uploads/2018/06/stevejobs.jpg'),
        hasStory: false,
        isActive: false,
        comment: "Anh trả chú 500k \$\. Về làm cho anh nhé.",
        time: '15m'));

    messagesModel.add(MessageModel(
        user: UserModel(
            name: 'Elon Musk',
            avatar:
            'https://static.doanhnhan.vn/images/upload/ngocdiem/03012021/451.jpg'),
        hasStory: false,
        isActive: false,
        comment: "Allin DOGE nhé, Anh sắp vào 5 tỷ coin",
        time: '1m'));

    messagesModel.add(MessageModel(
        user: UserModel(
            name: 'Người yêu cũ',
            avatar:
            'https://photo-cms-plo.zadn.vn/Uploaded/2021/vrwqlqdwp/2021_03_02/ninh-duong-lan-ngoc-clip-nong_mcan.jpg'),
        hasStory: true,
        isActive: false,
        comment: "Mình làm lại từ đầu nhé",
        time: '1m'));

    messagesModel.add(MessageModel(
        user: UserModel(
            name: 'Min-e',
            avatar:
            'https://static2.yan.vn/YanNews/2167221/201905/tieu-su-su-nghiep-va-cuoc-doi-cua-ca-si-min-f0ea35dc.jpg'),
        hasStory: true,
        isActive: false,
        comment: "Mình có thể trên tình yêu nhưng dưới tình bạn không?",
        time: '1h'));

    messagesModel.add(MessageModel(
        user: UserModel(
            name: 'Lupin',
            avatar:
            'https://www.ramascreen.com/wp-content/uploads/2020/09/Omar-Sy-Lupin-e1601037251868.jpg'),
        hasStory: false,
        isActive: false,
        comment: "Anh dấu 5 tỷ dưới hiên nhà.",
        time: '1h'));

    // messagesModel.add(MessageModel(
    //     user: UserModel(
    //         name: 'Người yêu',
    //         avatar:
    //             'https://media-cdn.laodong.vn/Storage/NewsPortal/2021/1/21/872871/Photo-1-160188900296-02.jpg'),
    //     hasStory: false,
    //     isActive: false,
    //     comment: "Anh đừng làm dev nữa. Về bố em cho 100 tỷ",
    //     time: '11h'));
    // messagesModel.add(MessageModel(
    //     user: UserModel(
    //         name: 'Min-e',
    //         avatar:
    //             'https://static2.yan.vn/YanNews/2167221/201905/tieu-su-su-nghiep-va-cuoc-doi-cua-ca-si-min-f0ea35dc.jpg'),
    //     hasStory: true,
    //     isActive: false,
    //     comment: "Mình có thể trên tình yêu nhưng dưới tình bạn không?",
    //     time: '1h'));
    //
    // messagesModel.add(MessageModel(
    //     user: UserModel(
    //         name: 'Lupin',
    //         avatar:
    //             'https://www.ramascreen.com/wp-content/uploads/2020/09/Omar-Sy-Lupin-e1601037251868.jpg'),
    //     hasStory: false,
    //     isActive: false,
    //     comment: "Anh dấu 5 tỷ dưới hiên nhà.",
    //     time: '1h'));
    //
    // messagesModel.add(MessageModel(
    //     user: UserModel(
    //         name: 'Người yêu',
    //         avatar:
    //             'https://media-cdn.laodong.vn/Storage/NewsPortal/2021/1/21/872871/Photo-1-160188900296-02.jpg'),
    //     hasStory: false,
    //     isActive: false,
    //     comment: "Anh đừng làm dev nữa. Về bố em cho 100 tỷ",
    //     time: '11h'));
    // messagesModel.add(MessageModel(
    //     user: UserModel(
    //         name: 'Min-e',
    //         avatar:
    //             'https://static2.yan.vn/YanNews/2167221/201905/tieu-su-su-nghiep-va-cuoc-doi-cua-ca-si-min-f0ea35dc.jpg'),
    //     hasStory: true,
    //     isActive: false,
    //     comment: "Mình có thể trên tình yêu nhưng dưới tình bạn không?",
    //     time: '1h'));
    //
    // messagesModel.add(MessageModel(
    //     user: UserModel(
    //         name: 'Lupin',
    //         avatar:
    //             'https://www.ramascreen.com/wp-content/uploads/2020/09/Omar-Sy-Lupin-e1601037251868.jpg'),
    //     hasStory: false,
    //     isActive: false,
    //     comment: "Anh dấu 5 tỷ dưới hiên nhà.",
    //     time: '1h'));
    //
    // messagesModel.add(MessageModel(
    //     user: UserModel(
    //         name: 'Người yêu',
    //         avatar:
    //             'https://media-cdn.laodong.vn/Storage/NewsPortal/2021/1/21/872871/Photo-1-160188900296-02.jpg'),
    //     hasStory: false,
    //     isActive: false,
    //     comment: "Anh đừng làm dev nữa. Về bố em cho 100 tỷ",
    //     time: '11h'));
    super.initState();
  }

  bool showFAB = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        floatingActionButton: showFAB
            ? FloatingActionButton(
          child: IconButton(
            onPressed: () {
              // animate scroll
              _scrollController.animateTo(0,
                  duration: Duration(milliseconds: 700),
                  curve: Curves.linearToEaseOut);
            },
            icon: Icon(Icons.arrow_upward_outlined),
          ),
        )
            : null,
        body: Column(
          children: [
            _buildHeader(),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.separated(
                controller: _scrollController,
                separatorBuilder: (_, __) => Container(
                  height: 16,
                ),
                itemCount: messagesModel.length + 2,
                itemBuilder: (ctx, index) {
                  if (index == 0) return _buildSearch();
                  if (index == 1) return _buildStory();
                  return _buildChatItem(messagesModel[index - 2], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildChatItem(MessageModel model, int soNha) {
    return InkWell(
      onTap: (){
        print("Container clicked");
        Navigator.pushNamed(context, '/detail', arguments: model.user.name);
      },
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        actions: <Widget>[
          IconSlideAction(
            caption: 'Archive',
            color: Colors.blue,
            icon: Icons.archive,
            onTap: (){},
          ),
          IconSlideAction(
            caption: 'Share',
            color: Colors.indigo,
            icon: Icons.share,
            onTap: (){},
          ),
        ],
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            _buildAvatar(model),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//                InkWell(
//                  onTap: () => print("Container pressed"), // handle your onTap here
//                ),
                  Text(
                    model.user.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: Text(
                          model.comment,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Text(
                        ' - ${model.time}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );



    //swipe
    // return Dismissible(
    //   background: Container(color: Colors.red),
    //   key: UniqueKey(),
    //   secondaryBackground: Container(
    //     color: Colors.yellow,
    //     height: 10,
    //   ),
    //   onDismissed: (_){
    //     setState(() {
    //       messagesModel.remove(model);
    //     });
    //   },
    //   child: Row(
    //     children: [
    //       SizedBox(
    //         width: 10,
    //       ),
    //       _buildAvatar(model),
    //       SizedBox(
    //         width: 10,
    //       ),
    //       Expanded(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               model.user.name,
    //               style: TextStyle(fontWeight: FontWeight.bold),
    //             ),
    //             Row(
    //               children: [
    //                 Flexible(
    //                   child: Text(
    //                     model.comment,
    //                     overflow: TextOverflow.ellipsis,
    //                     style: TextStyle(fontSize: 12),
    //                   ),
    //                 ),
    //                 Text(
    //                   ' - ${model.time}',
    //                   style: TextStyle(fontSize: 12),
    //                 ),
    //               ],
    //             )
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }

  _buildAvatar(MessageModel model) {
    return Stack(
      alignment: Alignment.center,
      children: [
      Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: model.hasStory
              ? Border.all(color: Colors.blue, width: 2)
              : null),
    ),
    Container(
    width: model.hasStory ? 38.5 : 42,
    height: model.hasStory ? 38.5 : 42,
    child: Padding(
    padding: const EdgeInsets.all(2.5),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(100),
    child: Image.network(
    model.user.avatar,
    width: 36,
    fit: BoxFit.cover,
    )),
    ),
    ),
    if (model.isActive)
    Positioned(
    bottom: 1,
    right: 1,
    child: Container(
    width: 12,
    height: 12,
    decoration: BoxDecoration(
    color: Colors.green,
    shape: BoxShape.circle,
    border: Border.all(color: Colors.white, width: 2)),
    ),
    )
    ],
    );
  }

  _buildStory() {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 16),
      height: 60,
      child: ListView.separated(
        separatorBuilder: (_, __) => Container(
          width: 8,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          if (index == 0) return _buildAddStory();
          return _buildItemStory(messagesModel[index - 1]);
        },
        itemCount: messagesModel.length + 1,
      ),
    );
  }

  _buildItemStory(MessageModel model) {
    return Container(
      child: Column(
        children: [
          _buildAvatar(model),
          SizedBox(
            height: 4,
          ),
          Text(
            model.user.name,
            style: TextStyle(fontSize: 12, color: Colors.grey[400]),
          )
        ],
      ),
    );
  }

  Widget _buildAddStory() {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.add,
                size: 30,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Add story',
            style: TextStyle(fontSize: 12, color: Colors.grey[400]),
          )
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 16, right: 16),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(8))),
      height: 40,
      child: Row(
        children: [
          SizedBox(
            width: 8,
          ),
          Icon(
            Icons.search,
            color: Colors.grey,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            'Search',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.network(
                me.avatar,
                width: 30,
                fit: BoxFit.cover,
                height: 30,
              )),
          Text(
            'Chats',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.add_comment_outlined)
        ],
      ),
    );
  }

  List<MessageModel> messagesModel = [];

  UserModel me = UserModel(
      name: 'Duy Mai',
      avatar:
      'https://photo-cms-plo.zadn.vn/w653/Uploaded/2021/pwvouqvp/2019_10_18/dam-vinh-hung-thump_qblr.jpg');
}

class MessageModel {
  final UserModel user;
  final String comment;
  final bool isActive;
  final bool hasStory;
  final String time;

  MessageModel({
    this.user,
    this.comment,
    this.isActive,
    this.hasStory,
    this.time,
  });
}

class UserModel {
  final String avatar;
  final String name;

  UserModel({this.avatar, this.name});
}



class MessengerDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the SecondScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context);
            final snackBar = SnackBar(
              content: Text('Biến đi ' + name),
              action: SnackBarAction(
                label: 'Click me',
                onPressed: () {
                  // Some code to undo the change.
                },
              ),
            );

            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text('Xin chao ' + name),
        ),
      ),
    );
  }
}
