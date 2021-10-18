import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_bmi_calculator/providers/bmi_provider.dart';
import 'package:my_bmi_calculator/welcome_page.dart';
import 'package:my_bmi_calculator/calculator/calculator_page.dart';
import 'package:my_bmi_calculator/bmi/pages/main_page.dart';
import 'package:my_bmi_calculator/bmi/pages/result_page.dart';
import 'package:my_bmi_calculator/age_guesser/screens/home_screen.dart';
import 'package:my_bmi_calculator/age_guesser/screens/last_screen.dart';
import 'package:my_bmi_calculator/age_guesser/screens/start_page.dart';

void main() {
  //runApp(const BmiCalculator());
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => BmiProvider()),
    ],
      child:  const MyCalculator(),
    ),
  );
}

class MyCalculator extends StatelessWidget {
  const MyCalculator({Key? key}) : super(key: key);

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


      initialRoute: '/welcome_page',
      routes: {
        '/welcome_page': (context) =>  const WelcomePage(),

        '/calculator_page': (context) => const CalculatorPage(),

        /// BMI
        '/main_page': (context) => const MainPage(),
        '/result_page': (context) =>  const ResultPage(),

        ///Age Guesser
        '/home_screen' : (context) => const HomeScreen(),
        '/page1' : (context) => StartPage(),
        '/page2' : (context) => LastScreen(),


      },


    );
  }
}