import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context){

    void openCalc(){
      Navigator.pushNamed(context, '/calculator_page');
    }
    void openBmi(){
      Navigator.pushNamed(context, '/main_page');
    }
    void openAgeGuesser(){
      Navigator.pushNamed(context, '/home_screen');
    }

    return Scaffold(
      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(buttonName: 'Calculator', callBack: openCalc),
            const SizedBox(height: 25,),
            CustomButton(buttonName: 'Body Mass Calculator', callBack: openBmi),
            const SizedBox(height: 25,),
            CustomButton(buttonName: 'Age Guesser', callBack: openAgeGuesser),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget{
  final String buttonName;
  final Function callBack;

  const CustomButton({Key? key, required this.buttonName, required this.callBack}):super (key:key);

  @override
  Widget build(BuildContext context){
    return ButtonTheme(
      minWidth: 280.0,
      height: 45,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: const BorderSide(color: Colors.green)),
      child: RaisedButton(

        elevation: 5.0,
        hoverColor: Colors.green,
        color: Colors.black45,
        child: Text(
          buttonName,
          style: const TextStyle(
              color: Colors.white, fontSize : 22),
        ),
        onPressed: (){
          callBack(); /// without braces () it won't work
        },
      ),
    );
  }
}