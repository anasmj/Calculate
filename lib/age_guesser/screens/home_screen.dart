import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        title: const Center(
          child: Text('Guessing game'),
        ),

      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 220,
            left: 180,
            child: Image.asset(
              'assets/images/edd.png',
              height: 300,
              width: 200,
            ),
          ),
          Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Hi!",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 0),
                //color: Colors.transparent,
                // child: Padding(
                //   padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "If you are less than 31 than I will find your age! ",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                //),
              ),
              const SizedBox(height: 220.0),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    "Lets try!",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, '/page1', arguments: 0),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
