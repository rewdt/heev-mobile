import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Login-Reg-img.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
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
                      "FORGOT PASSWORD?",
                      style: TextStyle(
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w100,
                          fontStyle: FontStyle.normal,
                          fontSize: 31.0),
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr,
                    ),
                  ]),
                  SizedBox(height: 30),
                  Opacity(
                    opacity: 0.6000000238418579,
                    child: Text(
                        "Enter your email address, we’ll send you the instructions on how to change your password",
                        style: const TextStyle(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Lato",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.left),
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
                        hintText: 'user@example.com'),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                          child: Text(
                            'SEND',
                            style: const TextStyle(
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xfff24e86),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
