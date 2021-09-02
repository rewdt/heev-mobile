// Flutter
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './shelf.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(textTheme),
            scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
        initialRoute: '/',
        routes: {
          '/': (context) => WelcomeWidget(),
          '/login': (context) => LoginWidget(),
          '/signup': (context) => SignupWidget(),
          '/forgot-password': (context) => ForgotPassword(),
          // '/': (context) => HomeWidget(),
          // '/': (context) => SettingsWidget(),
          // '/': (context) => MessageListWidget(),
          // '/': (context) => BrowseUsersWidget(),
          // '/': (context) => WallWidget(),
          // '/': (context) => ChatWidget()
        });
  }
}
