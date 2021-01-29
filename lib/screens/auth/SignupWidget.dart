import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heev/widgets/auth_button.dart';
import 'package:heev/widgets/snackbar.dart';

class SignupWidget extends StatefulWidget {
  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;

  void _toggleLoader(val) {
    setState(() => {isLoading = val});
  }

  handleSignUp() async {
    _toggleLoader(true);
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "barry.allen@example.com",
              password: "SuperSecretPassword!");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        final snackBar = snackbar(
            content: 'The password provided is too weak.',
            color: Colors.red[400]);
        _scaffoldKey.currentState.showSnackBar(snackBar);
      } else if (e.code == 'email-already-in-use') {
        final snackBar = snackbar(
            content: 'The account already exists for that email.',
            color: Colors.red[400]);
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    } catch (e) {
      print(e);
      final snackBar = snackbar(
        content: Text('Please Check your connection settings and try again'),
        color: Colors.red[400],
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
    _toggleLoader(false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Login-Reg-img.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: new EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Row(children: [
                    Text(
                      "Signup",
                      style: TextStyle(
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w100,
                          fontStyle: FontStyle.normal,
                          fontSize: 40.0),
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr,
                    ),
                  ]),
                  SizedBox(height: 30),
                  TextField(
                    style: TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          borderSide: BorderSide(width: 1, color: Colors.white),
                        ),
                        labelText: 'CHOOSE A USERNAME',
                        labelStyle: TextStyle(
                            height: -100,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        hintText: 'johndoe'),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    style: TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          borderSide: BorderSide(width: 1, color: Colors.white),
                        ),
                        labelText: 'YOUR AGE',
                        labelStyle: TextStyle(
                            height: -100,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        hintText: 'Enter your age'),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    style: TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          borderSide: BorderSide(width: 1, color: Colors.white),
                        ),
                        labelText: 'EMAIL ADDRESS',
                        labelStyle: TextStyle(
                            height: -100,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        hintText: 'example@test.com'),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          borderSide: BorderSide(width: 1, color: Colors.white),
                        ),
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                            height: -100,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        hintText: 'Enter your password'),
                    validator: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Password is required';
                      }
                      return '';
                    },
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: authbutton(
                            title: 'SIGN UP',
                            isLoading: isLoading,
                            handlePress: () {
                              handleSignUp();
                            }),
                      ),
                      FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Opacity(
                            opacity: 0.6499999761581421,
                            child: Text("Already a memeber?",
                                style: const TextStyle(
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 13.0),
                                textAlign: TextAlign.left),
                          ))
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
