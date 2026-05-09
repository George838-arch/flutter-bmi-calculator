import 'package:flutter/material.dart';
import 'main.dart';
import 'ResultScreen.dart';
class BmiScreen extends StatefulWidget {

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  double height = 170;
  int weight = 70;
  int age = 20;

  double bmi = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Color(0xff0A0E21),

      appBar: AppBar(
        backgroundColor: Color(0xff0A0E21),
        centerTitle: true,
        leading: Icon(Icons.arrow_back,size: 20,color: Colors.white,),
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(40),

        child: Column(

          children: [

            /// HEIGHT CONTAINER
            Container(

              width: double.infinity,
              padding: EdgeInsets.all(40),

              decoration: BoxDecoration(
                color: Color(0xff1D1E33),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(

                children: [

                  Text(
                    "HEIGHT",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    "${height.toInt()} cm",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Slider(

                    value: height,
                    min: 100,
                    max: 220,

                    activeColor: Colors.pink,

                    onChanged: (value) {

                      setState(() {

                        height = value;

                      });
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 80),

            /// Row for container age and weight
            Row(

              children: [

                /// Conatiner for weight
                Expanded(
                  child: Container(

                    padding: EdgeInsets.all(30),

                    decoration: BoxDecoration(
                      color: Color(0xff1D1E33),
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Column(

                      children: [

                        Text(
                          "WEIGHT",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 22,
                          ),
                        ),

                        SizedBox(height:30),

                        Text(
                          "$weight",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Row(

                          mainAxisAlignment:
                          MainAxisAlignment.center,

                          children: [

                            FloatingActionButton(

                              heroTag: "weight-",

                              mini: true,

                              backgroundColor: Colors.grey,

                              child: Icon(Icons.remove),

                              onPressed: () {

                                setState(() {

                                  weight--;

                                });
                              },
                            ),

                            SizedBox(width: 10),

                            FloatingActionButton(

                              heroTag: "weight+",

                              mini: true,

                              backgroundColor: Colors.pink,

                              child: Icon(Icons.add),

                              onPressed: () {

                                setState(() {

                                  weight++;

                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 20),

                /// Conatiner for age
                Expanded(
                  child: Container(

                    padding: EdgeInsets.all(30),

                    decoration: BoxDecoration(
                      color: Color(0xff1D1E33),
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Column(

                      children: [

                        Text(
                          "AGE",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 22,
                          ),
                        ),

                        SizedBox(height: 30),

                        Text(
                          "$age",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Row(

                          mainAxisAlignment:
                          MainAxisAlignment.center,

                          children: [

                            FloatingActionButton(

                              heroTag: "age-",

                              mini: true,

                              backgroundColor: Colors.grey,

                              child: Icon(Icons.remove),

                              onPressed: () {

                                setState(() {

                                  age--;

                                });
                              },
                            ),

                            SizedBox(width: 10),

                            FloatingActionButton(

                              heroTag: "age+",

                              mini: true,

                              backgroundColor: Colors.pink,

                              child: Icon(Icons.add),

                              onPressed: () {

                                setState(() {

                                  age++;

                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 100),

            /// BUTTON
            SizedBox(

              width: double.infinity,
              height: 60,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),

                onPressed: () {

                  double h = height / 100;

                  bmi = weight / (h * h);

                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (context) {

                        return ResultScreen(
                          result: bmi,
                        );
                      },
                    ),
                  );
                },

                child: Text(

                  "CALCULATE",

                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}