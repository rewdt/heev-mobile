import 'package:flutter/material.dart';
import 'package:heev/widgets/appbar.dart';
import 'package:heev/widgets/sidebar.dart';

class AppbarDrawerLayout extends StatelessWidget {
  AppbarDrawerLayout({this.title, this.body, this.footer});

  final String title;
  final body;
  final footer;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    void _openDrawer() {
      _scaffoldKey.currentState.openDrawer();
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: drawerAppbar(title, _openDrawer),
      drawer: sideBar(),
      body: body,
      bottomNavigationBar: footer,
    );
  }
}
