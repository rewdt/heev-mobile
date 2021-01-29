import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:heev/widgets/auth_button.dart';
import 'package:heev/widgets/snackbar.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void _toggleLoader(val) {
    setState(() => {isLoading = val});
  }

  handleSignIn() async {
    // Validate returns true if the form is valid, otherwise false.
    if (_formKey.currentState.validate()) {
      _toggleLoader(true);
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: "barry.allen@example.com",
                password: "SuperSecretPassword!");

        print('userCredential');
      } on FirebaseAuthException catch (e) {
        // print(e);
        if (e.code == 'user-not-found') {
          final snackBar = snackbar(
              content: 'No user found for that email.', color: Colors.red[400]);
          _scaffoldKey.currentState.showSnackBar(snackBar);
        } else {
          if (e.code == 'wrong-password') {
            final snackBar = snackbar(
                content: 'Wrong password provided for that user.',
                color: Colors.red[400]);
            _scaffoldKey.currentState.showSnackBar(snackBar);
          } else {
            final snackBar = snackbar(
              content:
                  Text('Please Check your connection settings and try again'),
              color: Colors.red[400],
            );
            _scaffoldKey.currentState.showSnackBar(snackBar);
          }
        }
      }
      _toggleLoader(false);
    }
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
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                  padding: new EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Row(children: [
                        Text(
                          "Login",
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
                      TextFormField(
                        style: TextStyle(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white),
                            ),
                            labelText: 'EMAIL ADDRESS',
                            labelStyle: TextStyle(
                                height: -100,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0),
                            hintText: 'example@test.com'),
                        validator: (String value) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return 'Invalid Email suupplied to the Email field';
                          }
                          return null;
                        },
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white),
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
                          if (value.length < 6) {
                            return 'Password is too short';
                          }
                          return null;
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
                                title: 'LOGIN',
                                isLoading: isLoading,
                                handlePress: () {
                                  handleSignIn();
                                }),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/forgot-password');
                              },
                              child: Opacity(
                                opacity: 0.6499999761581421,
                                child: Text("Forgot password?",
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
            )),
        bottomNavigationBar: SizedBox(
          width: double.maxFinite,
          height: 50,
          child: Opacity(
            opacity: 0.30000001192092896,
            child: ElevatedButton(
              child: Text("Don’t have an account? Sign up",
                  style: TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 13.0),
                  textAlign: TextAlign.left),
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff2b2b2b),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
