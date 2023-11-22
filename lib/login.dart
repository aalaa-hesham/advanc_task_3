import 'dart:async';

import 'package:advanc_task_3/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;
  final passwordController = TextEditingController();
  void navigateToHome() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    data.setString('email', emailController.text.toString());
    data.setBool('isLogin', true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            // Positioned(
            //     top: 0,
            //     child: Opacity(
            //       opacity: 0.7,
            //       child: SvgPicture.asset(
            //         "assets/wave.svg",
            //         color: Color.fromARGB(255, 68, 2, 18),
            //         height: 250,
            //         width: 100,
            //       ),
            //     )),
            Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                Image.asset("assets/Untitled-2.png"),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(20),
                      height: 320,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 181, 218),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              label: Text("Email"),
                              hintText: "Your Email",
                              icon: Icon(Icons.mail, color: Color(0xFF3F3D56)),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                  gapPadding: 1.0,
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 214, 68, 68))),
                              fillColor: Color.fromARGB(255, 142, 44, 44),
                            ),
                          ),
                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              label: Text("password"),
                              hintText: "password",
                              icon: Icon(Icons.visibility_off,
                                  color: Color(0xFF3F3D56)),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                  gapPadding: 1.0,
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 87, 214, 68))),
                              fillColor: Color.fromARGB(255, 142, 44, 44),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Forgot passwordController ?",
                            //style: Theme.of(context).textTheme.didatalayLarge,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: TextButton(
                                onPressed: navigateToHome,
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    backgroundColor:
                                        Color.fromARGB(255, 111, 41, 59)),
                                child: Text(
                                  "Login",
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        indent: 50,
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Or Contunie with",
                          )),
                      Expanded(
                          child: Divider(
                        endIndent: 50,
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        "assets/google.png",
                        height: 32,
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(31, 8, 216, 109)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        "assets/twitter.png",
                        height: 32,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member ?",
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Register now",
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
            // Positioned(
            //     bottom: 0,
            //     child: Opacity(
            //         opacity: 0.1,
            //         child: SvgPicture.asset(
            //           "assets/wave2.svg",
            //           color: Color.fromARGB(255, 114, 6, 33),
            //           height: 300,
            //           width: 100,
            //         )))
          ],
        ),
      ),
    );
  }
}
