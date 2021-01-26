import 'package:flutter/material.dart';
import 'package:dash_chat/dash_chat.dart';
import '../layouts/AppbarDrawerLayout.dart';

class WallWidget extends StatefulWidget {
  @override
  _WallWidgetState createState() => _WallWidgetState();
}

class _WallWidgetState extends State<WallWidget> {
  final chats = [
    {
      "user": {
        "name": "Abubakar",
        "uid": "1",
        "avatar":
            "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
      },
      "createdAt": 1611674124824,
      "image": "http://www.sclance.com/images/picture/Picture_753248.jpg",
      "text":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis metus eget libero venenatis cursus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed fermentum consectetur elementum. Suspendisse ultrices mi quam, sed ultricies magna rutrum ultrices. Integer cursus lacinia mattis. Aenean eu diam vitae sem feugiat semper. Cras dictum velit in laoreet vestibulum. Nam placerat hendrerit imperdiet. Praesent pulvinar lacus vel augue condimentum, nec fringilla ex accumsan."
    },
    {
      "user": {
        "name": "Fayeed",
        "uid": "2",
        "avatar":
            "https://www.wrappixel.com/ampleadmin/assets/images/users/5.jpg",
      },
      "createdAt": 1611674124824,
      "image": "http://www.sclance.com/images/picture/Picture_753248.jpg",
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
    }
  ];

  @override
  Widget build(BuildContext context) {
    var messages = chats.map((i) => ChatMessage.fromJson(i)).toList();
    return AppbarDrawerLayout(
        title: 'The Wall',
        body: Container(
            child: DashChat(
          user: ChatUser(
            name: "Abubakar",
            uid: "1",
            avatar:
                "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
          ),
          messageContainerPadding: EdgeInsets.symmetric(horizontal: 1),
          // messageContainerDecoration: BoxDecoration(color: Colors.red),
          messageBuilder: (chatMessage) {
            return MessageContainer(chatMessage: chatMessage);
          },
          avatarBuilder: (chatUser) {
            return emptyAvatar(chatUser);
          },
          chatFooterBuilder: () {
            return Divider(thickness: 1, height: 1);
          },
          dateBuilder: (date) {
            return Container();
          },
          inputDecoration: InputDecoration(hintText: 'Type your message...'),
          inputTextStyle: TextStyle(
              color: const Color(0xff383838),
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
          showUserAvatar: true,
          messages: messages,
          onSend: (chatMessage) {
            setState(() {
              chats.add(chatMessage.toJson());
            });
          },
        )));
  }
}

Widget emptyAvatar(chatUser) {
  return Container();
}

class MessageContainer extends StatelessWidget {
  const MessageContainer({Key key, this.chatMessage}) : super(key: key);

  final chatMessage;
  @override
  Widget build(BuildContext context) {
    final bool isUser = chatMessage.user.uid == '1';
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: isUser ? const Color(0xfff24e86) : const Color(0xff02b4ff),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(chatMessage.user.avatar)),
              SizedBox(width: 10),
              Flexible(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Opacity(
                      opacity: 0.800000011920929,
                      child: Text(chatMessage.user.name,
                          style: const TextStyle(
                              color: const Color(0xfffafafa),
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.normal,
                              fontSize: 10.0),
                          textAlign: TextAlign.left),
                    ),
                    Text(
                      chatMessage.text,
                      softWrap: true,
                      style: const TextStyle(
                          color: const Color(0xfffafafa),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 15.0),
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                    ),
                  ]))
            ])));
  }
}
