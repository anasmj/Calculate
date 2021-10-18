import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/providers/bmi_provider.dart';
import 'package:my_bmi_calculator/bmi/widgets/gender_widget.dart';
import 'package:my_bmi_calculator/bmi/widgets/buttons.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState (){
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  double value= 50.0;
  double height = 0.0;
  double weight = 0;
  static double? result;

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  static bool isMale = true;
  static bool isFemale = !isMale;


  @override
  Widget build (BuildContext context){

    void increaseHeight(){
      setState((){
        heightController.text = (double.parse(heightController.text) +0.1).toStringAsFixed(1);
      });
      Provider.of<BmiProvider>(context, listen: false).height = double.parse(heightController.text);
    }

    void decreaseHeight(){
      setState((){
        heightController.text = (double.parse(heightController.text) - 0.1).toStringAsFixed(1);
      });
      Provider.of<BmiProvider>(context, listen: false).height = double.parse(heightController.text);
    }

    void increaseWeight(){
      setState((){
        weightController.text = (double.parse(weightController.text) + 1).toString();
      });
      Provider.of<BmiProvider>(context, listen: false).weight = double.parse(weightController.text);
    }
    void decreaseWeight(){
      setState((){
        weightController.text = (double.parse(weightController.text) - 1).toString();
      });
      Provider.of<BmiProvider>(context, listen: false).weight = double.parse(weightController.text);
    }

    void calculate (){
      if (formKey.currentState!.validate()){
        Provider.of<BmiProvider>(context, listen: false).height= double.parse(heightController.text);
        Provider.of<BmiProvider>(context, listen: false).weight= double.parse(weightController.text);
        Provider.of<BmiProvider>(context,listen: false).calculate();
        Navigator.pushNamed(context, '/result_page');
      }
      //Navigator.pushNamed(context,'/resultPage', arguments: result!.toStringAsFixed(1));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Mass Calculator'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  <Widget>[
                GestureDetector(
                  child:const Male(),
                  onTap: (){
                    if(!isMale){
                      setState((){
                        isMale = true;
                        isFemale = false;
                      });
                    }
                  },
                ),
                GestureDetector(
                  child:const Female(),
                  onTap: (){
                    if(!isFemale){
                      setState((){
                        isFemale = true;
                        isMale = false;
                      });
                    }
                  },
                ),

              ],
            ),
            const Center(child: Text("Age", style: TextStyle(fontWeight: FontWeight.bold),)),
            Center(child: Text(value.round().toString() ,style: const TextStyle(fontSize: 38),)),
            //const SizedBox(height: 32,),
            Slider(
              value: value,
              min: 0,
              max: 100,
              divisions: 100,
              activeColor: Colors.black45,
              inactiveColor: Colors.black12,
              onChanged: (value) => setState((){
                this.value = value;
              }),
              label: value.round().toString() ,

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('Height',style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        SizedBox(
                          width: 75,
                          height: 70,
                          child: TextFormField(
                            //initialValue: height.toString(),
                            style: const TextStyle(
                              fontSize: 38.0,
                              //height: 2.0,
                              color: Colors.white,
                            ),
                            keyboardType: TextInputType.number,
                            controller: heightController,
                            validator: (value){
                              if (value!.isEmpty){
                                return 'Invalid';
                              }else if(double.parse(value) <= 0) {
                                return 'Invalid';
                              }
                            },
                          ),
                        ),
                        const Text('  ft'),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Weight',style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        SizedBox(
                          width: 75,
                          height: 70,
                          child: TextFormField(
                            controller: weightController,
                            validator: (value){
                              if (value!.isEmpty){
                                return 'Weight required';
                              }else if(double.parse(value) <= 0) {
                                return 'Invalid';
                              }
                            },
                            style: const TextStyle(
                              fontSize: 38.0,
                              //height: 2.0,
                              color: Colors.white,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const Text('  kg'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HeightIncrease(callBack: increaseHeight),
                HeightDecrease(callBack: decreaseHeight),
                WeightIncrease(callBack: increaseWeight),
                WeightDecrease(callBack: decreaseWeight),
              ]
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: CalcButton(callBack: calculate),
              ),
            ),
          ],
        ),
      ),
    );
  }
}