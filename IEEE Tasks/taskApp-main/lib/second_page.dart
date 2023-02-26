import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key, required this.BMI}) : super(key: key);
double BMI;
  Color PINK=Color(0xffdc4168);
  Color DARK =Color(0xff1d2136);
  Color LightDark= Color(0xff26263c);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DARK,
      appBar: AppBar(
        backgroundColor: DARK,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children:[
            Text("Your Result", style: TextStyle(fontSize: 25, color: Colors.white),),
SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
               color: LightDark,
                borderRadius: BorderRadius.circular(15)
              ),
              height: 500,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(state(BMI), style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(BMI.ceil().toString(), style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold, color: Colors.white),),
                    Text("your body weight is absolutely ${state(BMI)} ,Good Job", style: TextStyle(color: Colors.white))
                  ],
                ),
              ),

            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: 300,
                height: 40,
                child: Center(child: Text("BACK", style: TextStyle(color: Colors.white),)),
                decoration: BoxDecoration(
                    color: PINK,
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String state (double bmi){
    if(bmi<=18.5)
      return "UnderWeight";
    else if(bmi<=24.9)
      return "Normal";
    else if(bmi<=29.9 )
      return "Over Weight";
    else if(bmi<=34.9 )
      return "Obesity(1st class)";
    else if(bmi<=39.9 )
      return "Obesity(2st class)";
    else
      return "Extreme Obesity(3st class)";
  }
}
