import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_bmi_calculator/pages/main_page.dart';
import 'package:my_bmi_calculator/pages/result_page.dart';
import 'package:my_bmi_calculator/providers/bmi_provider.dart';


void main() {
  //runApp(const BmiCalculator());
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => BmiProvider()),
    ],
      child:  const BmiCalculator(),
    ),
  );
}

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.black54,
          //color: Color(0xFF151026),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.grey,     //  <-- dark color
          //textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color
        ),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),// changes entire text color
        scaffoldBackgroundColor: Colors.grey[800],
      ),
      initialRoute: '/main_page',
      routes: {
        '/main_page': (context) => const MainPage(),
        '/result_page': (context) =>  const ResultPage(),
      },


    );
  }
}