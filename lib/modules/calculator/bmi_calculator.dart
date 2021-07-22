import 'dart:math';

import 'package:flutter/material.dart';

import 'bmi_result_screen.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  bool isMale = true;
  double height = 180.0;
  int age = 35;
  int weight = 80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            child: Image(
                              image: AssetImage('assets/images/male.png'),
                              width: 50,
                              height: 50,
                            ),
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                                color: isMale? Colors.blue : Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                shape: BoxShape.rectangle),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(bottom: 30),
                            child: Text(
                              'MALE',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[400]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            child: Image(
                              image: AssetImage('assets/images/female.png'),
                              width: 85,
                              height: 85,
                            ),
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                                color: !isMale? Colors.blue : Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                shape: BoxShape.rectangle),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(bottom: 30),
                            child: Text(
                              'FEMALE',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[400]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Height',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[400]),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${height.round()}',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsetsDirectional.only(top: 15),
                                  child: Text(
                                    'cm',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[400]),
                                  ),
                                ),
                              ],
                            ),
                            Slider(
                              value: height,
                              min: 80,
                              max: 220,
                              onChanged: (value) {
                                setState(() {
                                  height = value;
                                });
                                print(value);
                              },
                            )
                          ],
                        ),
                      ),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          shape: BoxShape.rectangle),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                       children:
                       [
                         Text(
                           'Age',
                           style: TextStyle(
                             fontSize: 25,
                             fontWeight: FontWeight.bold,
                             color: Colors.white,
                           ),
                         ),
                         Text(
                           '$age',
                           style: TextStyle(
                             fontSize: 25,
                             fontWeight: FontWeight.bold,
                             color: Colors.white,
                           ),
                         ),
                         Row(
                           children:
                           [
                             Expanded(child: FloatingActionButton(heroTag: 'age++',mini: true,child: Icon(Icons.add), onPressed: (){
                               setState(() {
                                 age++;
                               });
                             },backgroundColor: Colors.grey[300],)),
                             Expanded(child: FloatingActionButton(heroTag: 'age--',mini: true,child: Icon(Icons.remove), onPressed: (){
                               setState(() {
                                 age--;
                               });
                             },backgroundColor: Colors.grey[300],)),
                           ],
                         ),
                       ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Text(
                            'Weight',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '$weight',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children:
                            [
                              Expanded(child: FloatingActionButton(heroTag: 'weight++',mini: true,child: Icon(Icons.add), onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },backgroundColor: Colors.grey[300],)),
                              Expanded(child: FloatingActionButton(heroTag: 'weight--',mini: true,child: Icon(Icons.remove), onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },backgroundColor: Colors.grey[300],)),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                double result = weight / pow(height/100, 2);
                Navigator.push(context, MaterialPageRoute(builder:(context)=>BMIResultScreen(age, result, isMale) ));
              },
              child: Container(
                alignment: AlignmentDirectional.center,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                ),
                color: Colors.pink,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
