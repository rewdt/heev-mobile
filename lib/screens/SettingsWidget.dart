import 'package:flutter/material.dart';
import 'package:heev/widgets/appbar.dart';
import 'package:heev/widgets/sidebar.dart';

class SettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    void _openDrawer() {
      _scaffoldKey.currentState.openDrawer();
    }

    return Container(
        child: Scaffold(
            key: _scaffoldKey,
            appBar: drawerAppbar('Settings', _openDrawer),
            drawer: sideBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/images/user_alt.png'),
                      radius: 50,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {},
                    child: Text("Change Photo",
                        style: const TextStyle(
                            color: const Color(0xfff24e86),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.center),
                  ),
                  SectionHeader(title: 'My current location'),
                  Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                      ),
                      child: SizedBox(
                        height: 60,
                        width: double.maxFinite,
                        child: FlatButton(
                            onPressed: () {},
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Abuja, Nigeria",
                                  style: const TextStyle(
                                      color: const Color(0xfff24e86),
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left),
                            )),
                      )),
                  SectionHeader(title: 'Age'),
                  Padding(
                      padding: new EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your age',
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xffeaeaea))),
                          ),
                          style: const TextStyle(
                              color: const Color(0xfff24e86),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.left)),
                  Padding(
                      padding: new EdgeInsets.symmetric(
                        vertical: 30.0,
                      ),
                      child: SizedBox(
                        width: 247,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xfff24e86),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text("UPDATE PROFILE",
                                style: const TextStyle(
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13.0,
                                ),
                                textAlign: TextAlign.center)),
                      )),
                  Container(
                      height: 166,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: const Color(0xfff24e86),
                          image: DecorationImage(
                              image: AssetImage('assets/images/pattern_bg.png'),
                              fit: BoxFit.cover)),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          Text("You’re on our free plan",
                              style: const TextStyle(
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18.0),
                              textAlign: TextAlign.left),
                          Opacity(
                            opacity: 0.8899999856948853,
                            child: Text(
                                "You want to make the most out of Meet?",
                                style: const TextStyle(
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0),
                                textAlign: TextAlign.center),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                              height: 33,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0xffffffff),
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text("Upgrade to PRO",
                                      style: const TextStyle(
                                          color: const Color(0xfff24e86),
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 13.0),
                                      textAlign: TextAlign.right)))
                        ],
                      )),
                  TextButton(
                      onPressed: null,
                      child: Text("Logout",
                          style: const TextStyle(
                              color: const Color(0xfff24e86),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.center))
                ],
              ),
            )));
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        alignment: Alignment.centerLeft,
        padding: new EdgeInsets.symmetric(horizontal: 20.0),
        height: 44,
        decoration: BoxDecoration(
            color: const Color(0xfffafafa),
            border: Border(
                bottom: BorderSide(color: const Color(0xffeaeaea), width: 1))),
        child: Opacity(
          opacity: 0.6000000238418579,
          child: Text(title,
              style: const TextStyle(
                  color: const Color(0xff383838),
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 12.0),
              textAlign: TextAlign.left),
        ));
  }
}
