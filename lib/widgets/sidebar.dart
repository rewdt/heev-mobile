import 'package:flutter/material.dart';
import '../presentation/my_flutter_app_icons.dart';

Widget sideBar() {
  return Drawer(
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
  );
}
