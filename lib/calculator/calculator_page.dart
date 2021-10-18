import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'buttons.dart';


class CalculatorPage extends StatefulWidget{
  const CalculatorPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState ()=> CalculatorPageState();
}
class CalculatorPageState extends State<CalculatorPage>{
  String _expression = '';
  String _history1 = '';


  @override
  Widget build(BuildContext context){


    void clicked (String value) {
      setState(() {
        _expression += value;
      });
    }

    void clear(String value) {
      setState(() {
        _expression = ' ';
        _history1 = '';
      });
    }

    void backSpace(String value) {
      setState(() {
        _expression = value.substring(0, value.length - 1);

        //print (expression);
        //expression = 'backspace called';
      });
    }

    void resolve (String value){
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();

      setState(() {
        _history1 +=  _expression;
        _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
      });
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Back')),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children:  [

          ///LEVEL 1 HISTORY
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child : Text(
                      _history1,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 28,
                      ),
                    )

              ),
              const SizedBox(
                width: 20.0,
              ),
            ],
          ),
          ///RESUT
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:  [
              Flexible(
                child: Text(
                    _expression,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                    ),
                  ),

              ),

              const SizedBox(
                width: 20.0,
              )
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button(
                buttonText: 'AC',
                buttonColor: Colors.redAccent,
                textSize: 20,
                callBack: clear,
              ),
              Button(
                buttonText: '(',
                buttonColor: Colors.black12,
                callBack: clicked,
              ),
              Button(
                buttonText: ')',
                buttonColor: Colors.black12,
                callBack: clicked,
              ),
              Button(
                buttonText: '/',
                buttonColor: Colors.black12,
                callBack: clicked,
              )
            ],
          ),
          const SizedBox(height: 8.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button(
                buttonText: '7',
                buttonColor: Colors.grey,
                callBack: clicked,
              ),
              Button(
                buttonText: '8',
                buttonColor: Colors.grey,
                callBack: clicked,
              ),
              Button(
                buttonText: '9',
                buttonColor: Colors.grey,
                callBack: clicked,
              ),
              Button(
                buttonText: '*',
                buttonColor: Colors.black12,
                callBack: clicked,
              )
            ],
          ),


          const SizedBox(height: 8.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button(
                buttonText: '4',
                buttonColor: Colors.grey,
                callBack: clicked,
              ),
              Button(
                buttonText: '5',
                buttonColor: Colors.grey,
                callBack: clicked,
              ),
              Button(
                buttonText: '6',
                buttonColor: Colors.grey,
                callBack: clicked,
              ),
              Button(
                buttonText: '-',
                buttonColor: Colors.black12,
                callBack: clicked,
              )
            ],
          ),
          const SizedBox(height: 8.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button(
                buttonText: '1',
                buttonColor: Colors.grey,
                callBack: clicked,
              ),
              Button(
                buttonText: '2',
                buttonColor: Colors.grey,
                callBack: clicked,
              ),
              Button(
                buttonText: '3',
                buttonColor: Colors.grey,
                callBack: clicked,
              ),
              Button(
                buttonText: '+',
                buttonColor: Colors.black12,
                callBack: clicked,
              )
            ],
          ),


          const SizedBox(height: 8.0),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button(
                buttonText: '.',
                buttonColor: Colors.grey,
                callBack: clicked,
              ),
              Button(
                buttonText: '0',
                buttonColor: Colors.grey,
                callBack: clicked,
              ),
              BackButton(
                expression: _expression,
                callBack: backSpace, buttonColor: Colors.blue,
              ),
              Button(
                buttonText: '=',
                buttonColor: Colors.black12,
                callBack: resolve,
              )
            ],
          ),
          const SizedBox(height: 20.0),





        ]
      ),
    );









  }
}


class BackButton extends StatelessWidget {
  final Color buttonColor;
  final Function callBack;
  final String expression;

  const BackButton(
      {Key? key, required this.buttonColor,
      required this.callBack,
      required this.expression}): super (key:key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 60,
      child: RaisedButton(
        onPressed: (){
          callBack(expression);
        },
        color: Colors.grey[800],
        child: const Icon(
          Icons.backspace,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.0),
          side: BorderSide(color: Theme
              .of(context)
              .primaryColor),
          //side: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
