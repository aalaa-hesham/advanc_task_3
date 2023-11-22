import 'package:advanc_task_3/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String email = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    email = data.getString('email') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Account'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Email'),
                  Text(email.toString()),
                ],
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () async {
                  SharedPreferences data = await SharedPreferences.getInstance();

                  data.clear();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.green,
                  child: const Center(
                    child: Text("Log Out"),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
