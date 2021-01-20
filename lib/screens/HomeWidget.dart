import 'package:flutter/material.dart';
import '../presentation/my_flutter_app_icons.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    void _openDrawer() {
      _scaffoldKey.currentState.openDrawer();
    }

    void _closeDrawer() {
      Navigator.of(context).pop();
    }

    return Container(
        child: Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: _openDrawer,
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.comment,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
        title: Text("Home",
            style: const TextStyle(
                color: const Color(0xff383838),
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: 18.0),
            textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: Padding(
          padding: new EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(children: [
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/user_alt.png'),
                radius: 50,
              ),
            ),
            SizedBox(height: 20),
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new InfoCard(
                      title: 'Mind Training',
                      bgColor: 0xff02b4ff,
                      cardImage: 'assets/images/brain.png'),
                  new InfoCard(
                      title: 'Daily Inspiration',
                      bgColor: 0xfff24e86,
                      cardImage: 'assets/images/hand_holding_heart.png'),
                  new InfoCard(
                      title: 'Events',
                      bgColor: 0xffd53349,
                      cardImage: 'assets/images/calendar_alt.png'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new InfoCard(
                      title: 'NACA Update',
                      bgColor: 0xff4dd068,
                      cardImage: 'assets/images/bell.png'),
                  new InfoCard(
                      title: 'FACA Update',
                      bgColor: 0xfff4cf54,
                      cardImage: 'assets/images/bell.png'),
                  new InfoCard(
                      title: 'Dating',
                      bgColor: 0xffd53349,
                      cardImage: 'assets/images/heart.png'),
                ],
              )
            ])
          ])),
      drawer: Drawer(
        child: Scaffold(
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/images/user_alt.png'),
                      radius: 50,
                    ),
                  ),
                  Text("Alfonso",
                      style: const TextStyle(
                          color: const Color(0xff383838),
                          fontWeight: FontWeight.w300,
                          fontFamily: "Lato",
                          fontStyle: FontStyle.normal,
                          fontSize: 25.0),
                      textAlign: TextAlign.center),
                  FlatButton(
                      onPressed: () {},
                      child: Text("EDIT PROFILE",
                          style: const TextStyle(
                              color: const Color(0xfff24e86),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Lato",
                              fontStyle: FontStyle.normal,
                              fontSize: 11.0),
                          textAlign: TextAlign.center)),
                  SizedBox(height: 20),
                  const Divider(
                    color: const Color(0xffeaeaea),
                    height: 10,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  SizedBox(height: 20),
                  Expanded(
                      child: ListView(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(MyFlutterApp.users),
                        title: Text("Browse",
                            style: const TextStyle(
                                color: const Color(0xff383838),
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0),
                            textAlign: TextAlign.left),
                      ),
                      ListTile(
                        leading: Icon(MyFlutterApp.bubble),
                        title: Text("Messages",
                            style: const TextStyle(
                                color: const Color(0xff383838),
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0),
                            textAlign: TextAlign.left),
                      ),
                      ListTile(
                        leading: Icon(MyFlutterApp.heart),
                        title: Text("My Matches",
                            style: const TextStyle(
                                color: const Color(0xff383838),
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0),
                            textAlign: TextAlign.left),
                      ),
                      ListTile(
                        leading: Icon(MyFlutterApp.star),
                        title: Text("Global Chat",
                            style: const TextStyle(
                                color: const Color(0xff383838),
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0),
                            textAlign: TextAlign.left),
                      ),
                      ListTile(
                        leading: Icon(MyFlutterApp.settings),
                        title: Text("Settings",
                            style: const TextStyle(
                                color: const Color(0xff383838),
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0),
                            textAlign: TextAlign.left),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            bottomNavigationBar: Container(
                alignment: Alignment.center,
                width: 280,
                height: 71,
                decoration: BoxDecoration(color: const Color(0xfff24e86)),
                child: Text("Meet",
                    style: const TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    textAlign: TextAlign.left))),
      ),
      // drawerEnableOpenDragGesture: false,
    ));
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key key, this.title, this.bgColor, this.cardImage})
      : super(key: key);

  final String title;
  final int bgColor;
  final String cardImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 110,
        height: 135,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(0, 1),
                  blurRadius: 8,
                  spreadRadius: 0)
            ],
            color: const Color(0xffffffff)),
        child: Column(
          children: [
            Container(
              width: 110,
              height: 80,
              padding: new EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(20),
                  //     topRight: Radius.circular(20)),
                  color: new Color(bgColor)),
              child: Image.asset(cardImage),
            ),
            Expanded(
                child: Container(
                    padding: new EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 3.0),
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(color: Colors.red),
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: const Color(0xff383838),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.center,
                    )))
          ],
        ),
      ),
    );
  }
}
