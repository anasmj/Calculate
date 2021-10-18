import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color buttonColor  ;
  final String buttonText ;
  final Function callBack;
  final double textSize;

  const Button({
    required this.buttonColor,
    required this.buttonText,
    required this.callBack,
    this.textSize = 26,

  });

  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 60,
      child: RaisedButton(
        onPressed: (){
          callBack(buttonText);
        },
        //color: Colors.grey[800],
        color: buttonColor,

        child: Text(
          buttonText,
          style: TextStyle(
            // color: Colors.blue,
            fontSize: textSize,
            color: Colors.grey[200],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.0),
          //side: BorderSide(color: Theme.of(context).primaryColor),
          side: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}

