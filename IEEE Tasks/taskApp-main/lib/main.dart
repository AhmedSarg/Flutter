import 'package:flutter/material.dart';
import 'package:neee/second_page.dart';

void main() {
  runApp( MyApp());
}
double height=160;
Color femaleColor=LightDark;
Color maleColor=LightDark;
int weight=60;
int age=18;
Color PINK=Color(0xffdc4168);
Color DARK =Color(0xff1d2136);
Color LightDark= Color(0xff26263c);
double BMI=weight/(height*height/10000);
class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DARK,
      appBar: AppBar(
        backgroundColor: DARK,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(

              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      maleColor=PINK;
                      femaleColor=LightDark;
                    });
                  },
                  child: Container(
                    width: 170,
                    height: 200,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.male, color: Colors.white, size: 100,),
                        SizedBox(height: 40,),
                        Text("Male", style: TextStyle(color: Colors.white, fontSize: 16),)
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: maleColor,
                      borderRadius: BorderRadius.circular(25)

                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      femaleColor=PINK;
                      maleColor=LightDark;
                    });
                  },
                  child: Container(
                    width: 170,
                    height: 200,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.female, color: Colors.white, size: 100,),
                        SizedBox(height: 40,),
                        Text("Female", style: TextStyle(color: Colors.white, fontSize: 16),)
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: femaleColor,
                        borderRadius: BorderRadius.circular(25)

                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Container(
                  height: 150,
                  width: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: LightDark
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Hieght",style: TextStyle(fontSize: 20, color: Colors.white),),
                      Text("${height.round().toString()} cm", style: TextStyle(fontSize: 20, color: Colors.white),),
                      Container(
                       child: Slider(
                         label: height.toString(),
                         activeColor: PINK,
                         inactiveColor: Colors.grey,
                         value: height,
                         onChanged: (value){
                           setState(() {
                             height=value;
                           });
                         },
                         max: 200,
                         min: 50,
                       ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                  color: LightDark,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Weight", style: TextStyle(fontSize: 20,color: Colors.white),),
                    SizedBox(height: 10,),
                    Text(weight.toString(), style: TextStyle(fontSize: 20,color: Colors.white),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap:(){
                            weight++;
                            setState(() {

                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.add,color: Colors.white,),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            weight--;
                            setState(() {

                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.remove, color: Colors.white,),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                  color: LightDark,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Age", style: TextStyle(fontSize: 20, color: Colors.white),),
                    SizedBox(height: 10,),
                    Text(age.toString(), style: TextStyle(fontSize: 20,color: Colors.white),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap:(){
                            age++;
                            setState(() {

                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.add,color: Colors.white,),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            age--;
                            setState(() {

                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.remove, color: Colors.white,),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage(BMI: BMI,)));
            },
            child: Container(
              width: 300,
              height: 40,
              child: Center(child: Text("Calculate", style: TextStyle(color: Colors.white),)),
              decoration: BoxDecoration(
                color: PINK,
                borderRadius: BorderRadius.circular(15)
              ),
            ),
          )
        ],
      ),
    );
  }
}
