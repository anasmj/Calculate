import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  int? txt;

  CustomText(this.txt, {Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Text(
      '$txt',
      style: const TextStyle(
        color: Colors.black45,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),

    );
  }
}

class CustomButton extends StatelessWidget {
  String? txt;
  Function? callback;

  CustomButton({Key? key, this.txt, this.callback}) : super(key: key);

  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 200.0,
      height: 40.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)

        ),
        onPressed: () {
          callback!(txt);
        },
        child: Text(
            '$txt',
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}