// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'result_page.dart';

class MalenFemale extends StatefulWidget {
  final Icon icon;
  final String text;

  const MalenFemale({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  _MalenFemaleState createState() => _MalenFemaleState();
}

class _MalenFemaleState extends State<MalenFemale> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 160,
          height: 190,
          decoration: BoxDecoration(
            color: Color.fromARGB(141, 52, 71, 78),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.icon,
              SizedBox(height: 10),
              Text(
                widget.text,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}

class WeightnAge extends StatefulWidget {
  final String title;

  const WeightnAge({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<WeightnAge> createState() => _WeightnAgeState();
}

class _WeightnAgeState extends State<WeightnAge> {
  int _counter = 0;
  double getCounterValue() {
    return _counter.toDouble();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 190,
      decoration: BoxDecoration(
        color: Color.fromARGB(141, 52, 71, 78),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            '$_counter',
            style: TextStyle(
                fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                icon: Icon(Icons.remove),
                iconSize: 30,
                onPressed: _decrementCounter,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 105, 111, 114))),
              ),
              SizedBox(
                width: 20,
              ),
              IconButton.filled(
                icon: Icon(Icons.add),
                iconSize: 30,
                onPressed: _incrementCounter,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 105, 111, 114))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class bmi_cal extends StatefulWidget {
  @override
  _bmi_calState createState() => _bmi_calState();
}

class _bmi_calState extends State<bmi_cal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: Color.fromARGB(255, 104, 26, 104),
          useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromARGB(198, 31, 23, 49),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(
                141, 52, 71, 78), // Set the background color of the app bar
            centerTitle: true, // Center the title within the app bar
            elevation: 0,
            title: Text(
              'BMI Calculator',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Bmi_calculator()),
    );
  }
}

class Bmi_calculator extends StatefulWidget {
  const Bmi_calculator({super.key});

  @override
  State<Bmi_calculator> createState() => _Bmi_calculatorState();
}

class _Bmi_calculatorState extends State<Bmi_calculator> {
  double _sliderValue = 50.0;
  final _weightKey = GlobalKey<_WeightnAgeState>();
  final _ageKey = GlobalKey<_WeightnAgeState>();

  void calculateBMI(
    double heightInCm,
    double weight,
    double age,
  ) {
    // BMI Formula: weight (kg) / (height (m))^2

    double heightInMeters = heightInCm / 100.0;

    // Calculate BMI using the formula: weight (kg) / (height (m))^2
    double bmi = weight / (heightInMeters * heightInMeters);

    // Determine BMI category
    String bmiCategory;
    if (bmi < 18.5) {
      bmiCategory = 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      bmiCategory = 'Normal';
    } else if (bmi >= 25 && bmi < 29.9) {
      bmiCategory = 'Overweight';
    } else {
      bmiCategory = 'Obese';
    }

    // Navigate to the result page and pass the BMI and category
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ResultPage(bmi: bmi, category: bmiCategory),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 0, left: 0, right: 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MalenFemale(
                icon: Icon(Icons.male, size: 80, color: Colors.white),
                text: 'MALE',
              ),
              SizedBox(
                width: 40,
              ),
              MalenFemale(
                icon: Icon(Icons.female, size: 80, color: Colors.white),
                text: 'FMALE',
              ),
            ],
          ),
          Container(
            height: 190,
            width: 360,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(141, 52, 71, 78),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      children: [
                        TextSpan(
                          text: '${_sliderValue.toInt()}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 70,
                          ),
                        ),
                        TextSpan(text: 'cm'),
                      ],
                    ),
                  ),
                  Slider(
                    value: _sliderValue,
                    min: 0,
                    max: 350,
                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                    activeColor: Color.fromARGB(250, 255, 68, 68),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WeightnAge(
                title: 'WEIGHT',
                key: _weightKey,
              ),
              SizedBox(width: 40),
              WeightnAge(
                title: 'AGE',
                key: _ageKey,
              )
            ],
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              calculateBMI(
                  _sliderValue,
                  _weightKey.currentState!.getCounterValue(),
                  _ageKey.currentState!.getCounterValue());
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(250, 255, 68, 68),
              foregroundColor: Colors.white,
              padding: EdgeInsets.all(15.0), // Button padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ), // Button border radius
              ),
              fixedSize: Size(410.0, 75.0),
            ),
            child: Text('CACULATE',
                style: TextStyle(fontSize: 30, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(bmi_cal());
}
