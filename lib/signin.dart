import 'package:flutter/material.dart';
import 'package:hotelui/login_screen.dart';

import 'colors.dart';
import 'constants.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  Signinbg,
                  height: height * 0.30,
                  width: width,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: height * 0.40,
                  width: width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          stops: [0.4, 0.7],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.white])),
                ),
                Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            text: appName + "\n",
                            children: [
                              TextSpan(
                                  text: slogan,
                                  style: TextStyle(
                                      color: Colors.red[500], fontSize: 15))
                            ]),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                child: Text("Create Account",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      PrimaryColor.withOpacity(0.4),
                      Colors.transparent
                    ]),
                    border: Border(
                      left: BorderSide(color: PrimaryColor, width: 5),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: PrimaryColor)),
                    suffixIcon: Icon(Icons.person, color: PrimaryColor),
                    labelText: "NAME",
                    labelStyle: TextStyle(color: PrimaryColor, fontSize: 16)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: PrimaryColor)),
                    suffixIcon: Icon(
                      Icons.email,
                      color: PrimaryColor,
                    ),
                    labelText: "EMAIL ADDRESS",
                    labelStyle: TextStyle(color: PrimaryColor, fontSize: 16)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: PrimaryColor)),
                    suffixIcon: Icon(
                      Icons.lock,
                      color: PrimaryColor,
                    ),
                    labelText: "PASSWORD",
                    labelStyle: TextStyle(color: PrimaryColor, fontSize: 16)),
              ),
            ),
            Center(
              child: SizedBox(
                height: height * 0.07,
                width: width - 30,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Submit',
                      style: TextStyle(
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white)),
                  style: TextButton.styleFrom(
                      backgroundColor: PrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: height * 0.07,
                  width: width - 30,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Text('Go Back',
                        style: TextStyle(
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: PrimaryColor)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
