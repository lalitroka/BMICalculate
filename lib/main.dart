import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController= TextEditingController();
  var ftController= TextEditingController();
  var inController= TextEditingController();
  var result="";
  var intext="";
  var bgColor= Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          title: Text(widget.title),
        ),
        body: Container(
          color: Colors.blue[80],
          child: Center(
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const  Text('BMI', style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w100),
                  ),

                  TextField(
                    controller: wtController,
                    decoration: const InputDecoration(
                        label: Text('Enter you weight in kg'),
                        prefixIcon: Icon(Icons.line_weight)
                    ),
                    keyboardType: TextInputType.number,

                  ),
                  const SizedBox(height: 11,),
                  TextField(
                    controller: ftController,
                    decoration: const InputDecoration(
                        label: Text('Enter you height (in feet)'),
                        prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,

                  ),
                  const SizedBox(height: 11,),

                  TextField(
                    controller: inController,
                    decoration: const InputDecoration(
                        label: Text('Enter your height (in inch) '),
                        prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,

                  ),


                  SizedBox(
                    width: 220,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),

                      child: ElevatedButton(onPressed: () {
                        var wt= wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();

                        if(wt!="" && ft!="" && inch!=""){
                          var iwt= int.parse(wt);
                          var ift= int.parse(ft);
                          var iInch= int.parse(inch);
                          var tinch = ift*12 + iInch;
                          var tcm= tinch * 2.54;
                          var tm = tcm/100;
                          var bmi = iwt/(tm+tm);
                          String bmiResult = bmi.toStringAsFixed(2);
                          var msg= "";

                          setState(() {
                            result="your BMI is: $bmiResult";
                            if (bmi > 25) {
                              if (kDebugMode) {
                                print("you're overweight");
                                intext="you're overweight";
                              }
                            } else if (bmi < 18) {
                              if (kDebugMode) {
                                print("you're underweight");
                                intext="you are underweight";
                              }
                            } else {
                              if (kDebugMode) {
                                print("you're healthy");
                                intext="you are healthy";
                              }
                            }
                          });

                        }else{
                          setState(() {
                            result="please fill  all the required blanks ";
                          });
                        }

                      },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[50],
                          ),

                          child: const Text('Calculate')),
                    ),
                  ),
                  Text(result, style: const TextStyle(
                    fontSize: 25,
                  ),),
                  Text(intext, style: const TextStyle(
                    fontSize: 30,
                  ),)

                ],
              ),
            ),
          ),
        )
    );
  }
}



