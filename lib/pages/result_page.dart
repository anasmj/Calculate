import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/providers/bmi_provider.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late String _result = 'something wrong';

  final String _description = """
  A healthy diet is essential for good health and nutrition.
  It protects you against many chronic noncommunicable diseases,
   such as heart disease, diabetes and cancer. Eating a variety of
   foods and consuming less salt, sugars and saturated and
   industrially-produced trans-fats, are essential for healthy diet.
  """;

  late String _status = 'Normal';

  @override
  Widget build(BuildContext context) {
    //_result = ModalRoute.of(context)!.settings.arguments as String;
    _result = (Provider.of<BmiProvider>(context, listen: false).result).toStringAsFixed(1);
    setStatus();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Result',
                style: TextStyle(fontSize: 38),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Container(
                  color: Colors.white,
                  height: 300,
                  width: 290,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Text(_status,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                      Text(
                        _result,
                        style: const TextStyle(fontSize: 78,
                            color: Colors.black),
                      ),
                      SizedBox(
                          height: 120,
                          width: 250,
                          child: Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(_description,
                                  style: const TextStyle(
                                      color: Colors.black54, fontSize: 18)),
                            ),
                          )),
                      //SizedBox(height: 10,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          //color: Colors.blue,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('RECALCULATE',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setStatus() {
    double bmi = double.parse(_result);
    if (0 < bmi && bmi < 18.5) {
      _status = 'normal';
    } else if (18.5 <= bmi && bmi <= 24.9) {
      //idal
      _status = 'Ideal';
    } else if (bmi <= 25) {
      //overweight
      _status = 'Over Weight';
    }
  }
}

