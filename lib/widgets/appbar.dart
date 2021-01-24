import 'package:flutter/material.dart';

Widget drawerAppbar(String title, Function _openDrawer) {
  return AppBar(
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
