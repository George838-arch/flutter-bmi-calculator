import 'package:flutter/material.dart';
import'main.dart';
import 'BmiScreen.dart';
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
        leading: Icon(Icons.arrow_back,size: 20,color: Colors.white,),
        title: Text("Result",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white,),
      ),
      ),
      body: Center(

        child: Container(

          margin: EdgeInsets.all(20),

          width: 500,

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

              SizedBox(height: 30),

              Text(

                result.toStringAsFixed(1),

                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 30),

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