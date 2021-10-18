import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/providers/bmi_provider.dart';

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
    final bmiProvider = Provider.of<BmiProvider>(context);

    Color enableColor = bmiProvider.isMale ? Colors.black45 : Theme.of(context).scaffoldBackgroundColor;
    String enableMessage = bmiProvider.isMale? 'Enabled' : ' ';

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
    final bmiProvider = Provider.of<BmiProvider>(context);

    Color enableColor = bmiProvider.isFemale ? Colors.black45 : Theme.of(context).scaffoldBackgroundColor;
    String enableMessage = bmiProvider.isFemale? 'Enabled' : ' ';

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
