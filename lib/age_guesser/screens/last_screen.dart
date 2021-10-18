import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/age_guesser/screens/start_page.dart';
class LastScreen extends StatelessWidget {
  const LastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int age = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 90.0, left: 60.0, right: 60.0, bottom: 20),
          child: Column(
            children: <Widget>[
              const Text(
                "Your age is ",
                style: TextStyle(
                  fontSize: 30.0,
                  //fontFamily: 'LukiestGuy',
                ),
              ),
              Text(
                "$age !",
                style: const TextStyle(
                  fontSize: 50.0,
                  //fontFamily: 'LukiestGuy',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/cute.jpg',
                    height: 240,
                    width: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                radius: 120,
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/page1');
                },
                child: Image.asset(
                  'assets/images/playAgain.png',
                  height: 150,
                  width: 180,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
