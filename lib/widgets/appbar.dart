import 'package:flutter/material.dart';
import 'package:heev/presentation/my_flutter_app_icons.dart';

Widget drawerAppbar(String title, Function _openDrawer) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(
            MyFlutterApp.menu,
            color: const Color(0xff383838),
            size: 20,
          ),
          onPressed: _openDrawer,
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    ),
    actions: [
      IconButton(
        icon: const Icon(MyFlutterApp.bubble,
            color: const Color(0xff383838), size: 25),
        onPressed: () {},
      )
    ],
    title: Text(title,
        style: const TextStyle(
            color: const Color(0xff383838),
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 18.0),
        textAlign: TextAlign.center),
    centerTitle: true,
  );
}
