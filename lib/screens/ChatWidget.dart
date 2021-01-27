import 'package:flutter/material.dart';
import 'package:dash_chat/dash_chat.dart';

class ChatWidget extends StatefulWidget {
  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final chats = [
    {
      "user": {
        "name": "Abubakar",
        "uid": "1",
        "avatar":
            "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
      },
      "createdAt": 1611674124824,
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
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
    }
  ];

  @override
  Widget build(BuildContext context) {
    var messages = chats.map((i) => ChatMessage.fromJson(i)).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.chevron_left, color: Colors.black, size: 30),
          );
        }),
        actions: [
          TextButton(
              onPressed: null,
              child: Text("Edit",
                  style: const TextStyle(
                      color: const Color(0xff383838),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                  textAlign: TextAlign.center))
        ],
        centerTitle: true,
        title: Column(
          children: [
            Text("Benjamin",
                style: const TextStyle(
                    color: const Color(0xff383838),
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                textAlign: TextAlign.center),
            Opacity(
              opacity: 0.6000000238418579,
              child: Text("last seen 15m ago",
                  style: const TextStyle(
                      color: const Color(0xff383838),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Lato",
                      fontStyle: FontStyle.normal,
                      fontSize: 11.0),
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ),
      body: DashChat(
        user: ChatUser(
          name: "Jhon Doe",
          uid: "1",
          avatar:
              "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
        ),
        messages: messages,
        onSend: (chatMessage) {
          setState(() {
            chats.add(chatMessage.toJson());
          });
        },
        // showAvatarForEveryMessage: true,
        // showUserAvatar: true,
        chatFooterBuilder: () {
          return Divider(thickness: 1, height: 1);
        },
        messageContainerPadding: EdgeInsets.symmetric(vertical: 20),
        messageDecorationBuilder: (ChatMessage msg, bool isUser) {
          return BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: isUser
                ? const Color(0xff68d1fd)
                : const Color(0xfff595b6), // example
          );
        },
        messageTextBuilder: (msgText, [chatMessges]) {
          return messageText(msgText, chatMessges);
        },
        inputDecoration: InputDecoration(hintText: 'Type your message...'),
        dateBuilder: (String dateString) {
          return Opacity(
            opacity: 0.779492974281311,
            child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 10),
                width: 161,
                height: 33,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    border:
                        Border.all(color: const Color(0xffa69ecf), width: 0.5)),
                child: Text(dateString,
                    style: const TextStyle(
                        color: const Color(0xffa69ecf),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 13.0),
                    textAlign: TextAlign.right)),
          );
        },
        messageTimeBuilder: (timeString, [chatMessage]) {
          return Opacity(
            opacity: 0.5,
            child: Text(timeString,
                style: const TextStyle(
                    color: const Color(0xff383838),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0),
                textAlign: TextAlign.right),
          );
        },
        dateFormat: DateFormat('dd MMMM yyyy'),
        showTraillingBeforeSend: true,
        trailing: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.camera_alt,
                color: const Color(0xffb4b4b4), size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.mic, color: const Color(0xffb4b4b4), size: 30),
          )
        ],
      ),
    );
  }
}

Widget messageText(msgText, chatMessage) {
  return Text(msgText,
      style: const TextStyle(
          color: const Color(0xffffffff),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 15.0),
      textAlign: TextAlign.left);
}
