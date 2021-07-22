import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  final int age;
  final double result;
  final bool isMale;
  BMIResultScreen(this.age, this.result, this.isMale);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text(
              'Gender: ${isMale? 'Male': 'Female'}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              'Result: ${result.round()}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              'Age: $age',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
