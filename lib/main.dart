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
  var bgColor= Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.amberAccent,
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

                 ElevatedButton(onPressed: () {
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
                     var bmi= iwt/(tm+tm);
                     var msg= "";
                     if (kDebugMode) {
                       print(msg);
                     }

                     if(bmi>25){
                       msg= "you're overweight";
                       bgColor=Colors.orangeAccent;

                     }else if (bmi<18){
                     msg= "you're underweight";
                     bgColor=Colors.redAccent;
                     }else{
                       msg= "you're  healthy";
                       bgColor=Colors.greenAccent;



                     }
                     setState(() {
                       result="your BMI is: $bmi";
                     });



                   }else{
                     setState(() {
                       result="please fill  all the required blanks ";
                     });
                   }

                 },
                     child: const Text('Calculate')),
                 Text(result, style: const TextStyle(
                   fontSize: 25,
                 ),),
              ],
            ),
          ),
        ),
      )
    );
  }
}
