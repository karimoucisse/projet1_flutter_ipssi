import 'package:dots_indicator/dots_indicator.dart';
import 'package:firstbd233/view/my_background.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
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
  //variable
  PageController page = PageController();
  int position = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.transparent,
        elevation: 0,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
      ),
      extendBodyBehindAppBar: true,
      body: Stack(

          children: <Widget>[
            MyBackGroundPage(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height *0.55,
                    child: PageView(
                      onPageChanged: (number){
                        setState(() {
                          position = number;
                        });

                      },
                      controller: page,
                      children: [
                        Center(child: Lottie.asset("assets/01.json")),
                        Center(child: Lottie.asset("assets/02.json")),
                        Center(child: Lottie.asset("assets/03.json"))
                      ],
                    ),
                  ),
                  DotsIndicator(

                    position: position,
                      dotsCount: 3
                  )
                ],
              ),
            ),
           

           ]
    )

    );
  }
}
