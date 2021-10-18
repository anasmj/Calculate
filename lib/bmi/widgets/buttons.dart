import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeightIncrease extends StatelessWidget {
  final Function callBack;

  const HeightIncrease({Key? key, required this.callBack}): super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 60,
        width: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black12,
            shape: const CircleBorder(),
          ),
          onPressed: () {
            callBack();
          },
          child: const Icon(Icons.add),
        ),
      );
}

class HeightDecrease extends StatelessWidget {
  final Function callBack;

  const HeightDecrease({Key? key, required this.callBack}): super (key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 60,
        width: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black12,
            shape: const CircleBorder(),
          ),
          onPressed: () {
            callBack();
          },
          child: const Icon(Icons.remove),
        ),
      );
}

class WeightIncrease extends StatelessWidget {
  final Function callBack;

  const WeightIncrease({Key? key, required this.callBack}): super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 60,
        width: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black12,
            shape: const CircleBorder(),
          ),
          onPressed: () {
            callBack();
          },
          child: const Icon(Icons.add),
        ),
      );
}

class WeightDecrease extends StatelessWidget {
  final Function callBack;

  const WeightDecrease({Key? key, required this.callBack}): super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 60,
        width: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black12,
            shape: const CircleBorder(),
          ),
          onPressed: () {
            callBack();
          },
          child: const Icon(Icons.remove),
        ),
      );
}

class CalcButton extends StatelessWidget {
  final Function callBack;

  const CalcButton({Key? key, required this.callBack}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black12,
      ),
      onPressed: () {
        callBack();
      },
      child: const Text('CALCULATE',
          style: TextStyle(fontSize: 18, color: Colors.white)),
    );
  }
}
