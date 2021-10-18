import 'package:my_bmi_calculator/bmi/pages/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Male extends StatefulWidget  {
  const Male({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState(){
    return MaleState();
  }
}
class MaleState extends State<Male>{
  @override
  Widget build (BuildContext context){
    Color enableColor = MainPageState.isMale ? Colors.black45 : Theme.of(context).scaffoldBackgroundColor;
    String enableMessage = MainPageState.isMale? 'Enabled' : ' ';

    return Container(
      width: 130,
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      padding: const EdgeInsets.all(12.0),
      color: enableColor,
      child: Column(
        children: [
          const Text('Male'),
          const Text('🙋‍♂', style: TextStyle(fontSize: 74.0),),
          const SizedBox(height: 12.0,),
          Text(enableMessage, style: const TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}

class Female extends StatefulWidget {
  const Female({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState(){
    return FemaleState();
  }
}
class FemaleState extends State<Female>{
  @override
  Widget build( BuildContext context ){
    Color enableColor = MainPageState.isFemale ? Colors.black45 : Theme.of(context).scaffoldBackgroundColor;
    String enableMessage = MainPageState.isFemale? 'Enabled' : ' ';
    return Container(
      width: 130,
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      padding: const EdgeInsets.all(12.0),
      color: enableColor,
      child: Column(
        children:  [
          const Text('Female'),
          const Text('🙋‍♀️', style: TextStyle(fontSize: 74.0),),
          const SizedBox(height: 12.0,),
          Text(enableMessage, style: const TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
