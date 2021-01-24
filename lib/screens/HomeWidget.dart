import 'package:flutter/material.dart';
import 'package:heev/widgets/appbar.dart';
import 'package:heev/widgets/sidebar.dart';

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
      appBar: drawerAppbar('Home', _openDrawer),
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
      drawer: sideBar(),
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
