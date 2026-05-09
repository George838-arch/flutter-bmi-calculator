import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiScreen(),
    );
  }
}

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
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(15),

        child: Column(

          children: [

            /// HEIGHT CONTAINER
            Container(

              width: double.infinity,
              padding: EdgeInsets.all(20),

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

                  SizedBox(height: 10),

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

            SizedBox(height: 20),

            /// Row for container age and weight
            Row(

              children: [

                /// Conatiner for weight
                Expanded(
                  child: Container(

                    padding: EdgeInsets.all(20),

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

                        SizedBox(height: 10),

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

                SizedBox(width: 15),

                /// Conatiner for age
                Expanded(
                  child: Container(

                    padding: EdgeInsets.all(20),

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

                        SizedBox(height: 10),

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

            SizedBox(height: 30),

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

/// RESULT SCREEN

class ResultScreen extends StatelessWidget {

  double result;

  ResultScreen({
    required this.result,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Color(0xff0A0E21),

      appBar: AppBar(

        backgroundColor: Color(0xff0A0E21),

        centerTitle: true,

        title: Text("Result"),
      ),

      body: Center(

        child: Container(

          margin: EdgeInsets.all(20),

          width: double.infinity,

          padding: EdgeInsets.all(20),

          decoration: BoxDecoration(

            color: Color(0xff1D1E33),

            borderRadius: BorderRadius.circular(20),
          ),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Text(

                "Your BMI",

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),

              SizedBox(height: 20),

              Text(

                result.toStringAsFixed(1),

                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),

                onPressed: () {

                  Navigator.pop(context);

                },

                child: Text("Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}