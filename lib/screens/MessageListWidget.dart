import 'package:flutter/material.dart';
import 'package:heev/layouts/AppbarDrawerLayout.dart';

class MessageListWidget extends StatelessWidget {
  final data = List<String>.generate(1001, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    return (AppbarDrawerLayout(
      title: 'Messages',
      body: Column(children: [
        Container(
          height: 48,
          width: double.maxFinite,
          decoration: BoxDecoration(color: const Color(0xfff2f2f2)),
          child: Padding(
              padding: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: TextField(
                textAlignVertical: TextAlignVertical(y: 1),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color(0xff383838),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Lato",
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search Messages',
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xffeaeaea),
                      )),
                ),
              )),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return Padding(
                padding: new EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: InkWell(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: const Color(0xffeaeaea), width: 1))),
                        height: 96,
                        child: Stack(children: [
                          Row(
                            children: [
                              Stack(children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage('assets/images/user_alt.png'),
                                  radius: 30,
                                ),
                                Positioned(
                                    bottom: 0,
                                    left: 8,
                                    child: Container(
                                        alignment: Alignment.center,
                                        width: 45.046875,
                                        height: 15.6943359375,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color(0xff54d586)),
                                        child: Text("ONLINE",
                                            style: const TextStyle(
                                                color: const Color(0xffffffff),
                                                fontWeight: FontWeight.w900,
                                                fontFamily: "Lato",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 9.0),
                                            textAlign: TextAlign.left)))
                              ]),
                              Padding(
                                  padding: new EdgeInsets.only(
                                    left: 10.0,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Benjamin",
                                          style: const TextStyle(
                                              color: const Color(0xff383838),
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 16.0),
                                          textAlign: TextAlign.left),
                                      Opacity(
                                        opacity: 0.699999988079071,
                                        child: Text(
                                            "Hey! how was the concert last night?? ",
                                            style: const TextStyle(
                                                color: const Color(0xff383838),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Lato",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.0),
                                            textAlign: TextAlign.left),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                          Positioned(
                              top: 15,
                              right: 0,
                              child: Container(
                                  child: Opacity(
                                opacity: 0.5,
                                child: Text("09.40am",
                                    style: const TextStyle(
                                        color: const Color(0xff383838),
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.0),
                                    textAlign: TextAlign.right),
                              ))),
                        ]))));
          },
        ))
      ]),
    ));
  }
}
