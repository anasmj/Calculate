import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/age_guesser/widgets/custome_text.dart';


class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StartPageState();
  }
}

class StartPageState extends State<StartPage> {
  static int listNo = 0;
  int age = 0;
  int no = listNo;

  @override
  Widget build(BuildContext context) {
    var allNumbers = [
      [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29],
      [2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23, 26, 27, 30],
      [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30],
      [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30],
      [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 31]
    ];

    void ageFound(String txt) {
      if (no < 4) {
        setState(() {
          age = age + allNumbers[listNo][0];
          listNo = listNo + 1;
          no = listNo;
        });
      } else if (no == 4) {
        setState(() {
          age = age + allNumbers[listNo][0];
          //no = listNo;
          no = no + 1;
        });
        Navigator.pushReplacementNamed(context, '/page2', arguments: age);
      } else {
        no = no + 1;
      }
    }

    void ageNotFound(String txt) {
      //if (listNo <= 3) {
      if (no < 4) {
        setState(() {
          listNo = listNo + 1;
          no = no + 1;
        });
      } else if (no == 5) {
        //listNo = listNo + 1;
        no = no + 1;
      } else {
        Navigator.pushReplacementNamed(context, '/page2', arguments: age);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Guessing your age"),
      ),
      body: Stack(children: <Widget>[
        Positioned(
          bottom: 150,
          left: 10,
          height: 300,
            child: Container(
              color: Colors.blue,
              child: Image.asset(
                'assets/images/santa.jpg',
              ),
            ),
          ),

        Column(
          // contains all rows
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 28, top: 8, right: 28, bottom: 0),
              child: Text(
                'Do you see your age\nin here?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 90, left: 10, right: 10, bottom: 10),
              child: Row(
                // row1
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomText(allNumbers[listNo][0]),
                  CustomText(allNumbers[listNo][1]),
                  CustomText(allNumbers[listNo][2]),
                  const SizedBox(width: 10,),
                ],
              ),
            ),
            Row(
              // row2
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomText(allNumbers[listNo][3]),
                CustomText(allNumbers[listNo][4]),
                CustomText(allNumbers[listNo][5]),
                const SizedBox(width: 10,),
              ],
            ),
            Row(
              // row3
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomText(allNumbers[listNo][6]),
                CustomText(allNumbers[listNo][7]),
                CustomText(allNumbers[listNo][8]),
                const SizedBox(width: 10,),
              ],
            ),
            Row(
              // row4
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomText(allNumbers[listNo][9]),
                CustomText(allNumbers[listNo][10]),
                CustomText(allNumbers[listNo][11]),
                const SizedBox(width: 10,),
              ],
            ),
            Row(
              // row5
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomText(allNumbers[listNo][12]),
                CustomText(allNumbers[listNo][13]),
                CustomText(allNumbers[listNo][14]),
                const SizedBox(width: 10,),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 0.0, right: 0.0, bottom: 0.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                    iconSize: 50,
                    color: Colors.blueGrey,
                    splashColor: Colors.purple,
                    onPressed: () {
                      if (no == 5) {
                        setState(() {
                          no = no - 1;
                          age = age - allNumbers[listNo][0];
                          if (age < 0) {
                            age = 0;
                          }
                        });

                        //listNo = no;
                      } else if (no > 5) {
                        setState(() {
                          no = no - 1;
                          //age = age - allNumbers[listNo][0];
                        });

                      } else if (no > 0) {
                        setState(() {
                          age = age - allNumbers[listNo - 1][0];
                          listNo = listNo - 1;
                          if (age < 0) {
                            age = 0;
                          }
                          //no = listNo;
                          no = no - 1;
                        });
                      } else {
                        setState(() {
                          age = 0;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Hay! There are no more pages!'),
                        ));
                      }
                    },
                  ),
                ),
                Column(
                  children: <Widget>[
                    CustomButton(txt: "yes, I do", callback: ageFound),
                    //find age
                    CustomButton(txt: "Nope", callback: ageNotFound)
                    //age not found
                  ],
                ),
                //replay button
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, top: 0.0, right: 0.0, bottom: 0.0),
                  child: IconButton(
                    //REPLAY BUTTON
                    icon: const Icon(
                      Icons.replay,
                    ),
                    iconSize: 50,
                    color: Colors.blueGrey,
                    splashColor: Colors.purple,
                    onPressed: () {
                      refreshAlert(context);
                      playAgain();

                      // setState(() {
                      //   listNo = 0;
                      //   age = 0;
                      //   no = 0;
                      // });
                      throw '';
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }

  void refreshAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Center(child: Text("Ready!",style: TextStyle(color: Colors.black45),)),
          );
        });
  }

  void refreshRequest(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("please refresh before use"),
          );
        });
  }
  void playAgain (){
    setState(() {
      listNo = 0;
      age = 0;
      no = 0;
    });
  }
}