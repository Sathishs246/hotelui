import 'package:flutter/material.dart';
import 'package:hotelui/home_screen.dart';
import 'package:hotelui/signin.dart';

import 'colors.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String _email, _password;

  /*  void signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _email, password: _password)
        .catchError((onError) {
      print(onError);
    }).then((authUser) {
      print(authUser.user?.uid);
    });
  }
*/
  void signIn() async {
    try {
      UserCredential authUser = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      print("Signed in as: ${authUser.user?.uid}");
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      bgImage,
                      height: height * 0.30,
                      width: width,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: height * 0.35,
                      width: width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              stops: [0.3, 0.7],
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
                      )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text("  $loginString  ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            PrimaryColor.withOpacity(0.3),
                            Colors.transparent,
                          ],
                        ),
                        border: Border(
                            left: BorderSide(color: PrimaryColor, width: 5))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onSaved: (value) {
                      _email = value!;
                    },
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return "Please Enter Email";
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email)) return "its Not a Valid Email";
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: PrimaryColor)),
                      prefixIcon: Icon(
                        Icons.email,
                        color: PrimaryColor,
                      ),
                      labelText: "EMAIL ADDRESS",
                      labelStyle: TextStyle(color: PrimaryColor, fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: TextFormField(
                    onSaved: (value) {
                      _password = value!;
                    },
                    validator: (password) {
                      if (password == null || password.isEmpty) {
                        return "Please Enter the Password";
                      } else if (password.length < 8 || password.length > 15) {
                        return "Password Length is incorrect";
                      }

                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: PrimaryColor)),
                      prefixIcon: Icon(
                        Icons.lock_open,
                        color: PrimaryColor,
                      ),
                      labelText: "PASSWORD",
                      labelStyle: TextStyle(color: PrimaryColor, fontSize: 16),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          forgetText,
                          style: TextStyle(color: Colors.black),
                        ))),
                Center(
                    child: SizedBox(
                  height: height * 0.07,
                  width: width - 30,
                  child: TextButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState?.save();
                        signIn();

                        // if (_email == "demo2@gmail.com" &&
                        //     _password == "demo1234") {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => HomeScreen(),
                        //     ),
                        //   );
                        //   FocusScope.of(context).unfocus();
                        // } else {
                        //   print("Invalid Login Details");
                        // }
                      }
                    },
                    child: Text('Login to account',
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
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignIn()));
                        },
                        child: Text(
                          "Create Account",
                          style: TextStyle(color: PrimaryColor, fontSize: 16),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
