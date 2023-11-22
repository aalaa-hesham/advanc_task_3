import 'dart:async';
import 'package:advanc_task_3/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    isLogin();
  }

  void isLogin() async {
    await Future.delayed(Duration(seconds: 1));

    SharedPreferences data = await SharedPreferences.getInstance();
    bool? isLogin = data.getBool('isLogin') ?? false;

    if (isLogin) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Timer(const Duration(seconds: 3), () {
    //   Get.to(Login());
    // });
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 59, 168),
      body: const Center(
          child: Image(image: AssetImage("assets/Untitled-2.png"))),
    );
  }
}
