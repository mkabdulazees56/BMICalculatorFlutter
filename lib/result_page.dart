// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  final String category;
 
  ResultPage({required this.bmi, required this.category});

  Map<String, String> categoryDescriptions = {
    'Underweight':
        'You may need to gain weight. Consult with a healthcare professional.',
    'Normal': 'Congratulations! Your BMI is within the normal range.',
    'Overweight':
        'You may need to lose weight. Consult with a healthcare professional.',
    'Obese':
        'You are in the obese range. Consult with a healthcare professional for advice.'
  };

  @override
  Widget build(BuildContext context) {
    Color textColor = category == 'Normal' ? Colors.green : Colors.red;
    String description = categoryDescriptions[category] ?? '';

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(198, 31, 23, 49),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 25.0, bottom: 0, left: 0, right: 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Result',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 612,
                width: 360,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(141, 52, 71, 78),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        category,
                        style: TextStyle(
                          fontSize: 25,
                          color: textColor,
                        ),
                      ),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(description,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(250, 255, 68, 68), // Background color
                  onPrimary: Colors.white, // Text color
                  padding: EdgeInsets.all(15.0), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ), // Button border radius
                  ),
                  fixedSize: Size(410.0, 75.0),
                ),
                child: Text('RE-CACULATE',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
